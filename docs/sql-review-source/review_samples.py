from pathlib import Path
import re
import sqlite3
import json

root = Path(__file__).resolve().parent
def normalize(sql):
    sql = re.sub(r'\bclaim_id\b', 'compensation_claim_id', sql, flags=re.I)
    return re.sub(r'\bdepartment\b', 'position', sql, flags=re.I)
ddl = normalize((root / '01_create_tables.sql').read_text(encoding='utf-8-sig'))
original = normalize((root / 'sample_data.sql').read_text(encoding='utf-8-sig'))
db = sqlite3.connect(':memory:')
db.execute('PRAGMA foreign_keys=ON')
pks = dict(re.findall(r'ALTER TABLE (\w+)\s+ADD CONSTRAINT \w+\s+PRIMARY KEY \((\w+)\)', (root/'02_create_constraints.sql').read_text(encoding='utf-8-sig'), re.I))
fks = re.findall(r'ALTER TABLE (\w+)\s+ADD CONSTRAINT \w+\s+FOREIGN KEY \((\w+)\)\s+REFERENCES (\w+) \((\w+)\)', normalize((root/'02_create_constraints.sql').read_text(encoding='utf-8-sig')), re.I)
for table, body in re.findall(r'CREATE TABLE (\w+)\s*\((.*?)\);', ddl, re.S):
    constraints = [f'PRIMARY KEY ({pks[table]})'] + [f'FOREIGN KEY ({col}) REFERENCES {parent} ({key})' for child,col,parent,key in fks if child == table]
    db.execute(f'CREATE TABLE {table} ({body}, '+', '.join(constraints)+')')
def load(sql):
    sql = re.sub(r"TO_DATE\('([^']*)',\s*'YYYY-MM-DD'\)", r"'\1'", sql)
    sql = re.sub(r'^\s*COMMIT;', '', sql, flags=re.M)
    db.executescript(sql)
load(original)
relations = [('agriculture_damage_app','applicant_id'), ('damage_site_invest','app_id')] + [(t,c) for t,c,_,_ in fks if t.endswith('_doc')]
def counts():
    return {f'{t}.{c}': db.execute(f'SELECT {c},COUNT(*) FROM {t} GROUP BY {c} ORDER BY {c}').fetchall() for t,c in relations}
before = counts()
print('BEFORE', json.dumps(before, ensure_ascii=False))
print('ACCOUNTS', db.execute('SELECT officer_id,username,name,position FROM quality_assurance_officer').fetchall())
print('APPLICATIONS', db.execute('SELECT app_id,applicant_id,product_name,app_status FROM agriculture_damage_app').fetchall())
print('CHAIN', {t:db.execute(f'SELECT * FROM {t}').fetchall() for t in ['damage_site_invest','compensation_claim','compensation_calc','compensation_payment']})
out = root.parent.parent / 'sql'
out.mkdir(exist_ok=True)
additions = ["DELETE FROM quality_assurance_officer WHERE username IN ('admin01', 'admin02');"]
db.execute(additions[0])
def insert(table, row):
    cols = [r[1] for r in db.execute(f'PRAGMA table_info({table})')]
    def literal(value, col):
        if value is None: return 'NULL'
        if isinstance(value, (int,float)): return str(value)
        value = "'" + value.replace("'", "''") + "'"
        return f"TO_DATE({value}, 'YYYY-MM-DD')" if col.endswith('_date') else value
    sql = f"INSERT INTO {table} ({', '.join(cols)})\nVALUES ({', '.join(literal(v,c) for v,c in zip(row,cols))});"
    additions.append(sql)
    load(sql)
insert('quality_assurance_officer', (3,'quality01','quality1234','이*규','품질담당자'))
# One additional investigation for the paid application; existing investigation 4 stays intact.
insert('damage_site_invest', (5,'REQ-2026-000136','품질담당자','병해충 피해',3400,68,'재조사: 최초 조사 이후 피해면적과 피해율 재확인','조사 완료','2026-09-25'))
insert('invest_doc',(3,5,'재조사 결과서','/uploads/investigation/5/result.pdf'))
insert('invest_doc',(4,5,'재조사 현장사진','/uploads/investigation/5/photo.jpg'))
insert('compensation_calc_doc',(2,1,'산정 근거 확인서','/uploads/calculation/1/basis.pdf'))
insert('compensation_payment_doc',(2,1,'지급 이체 확인서','/uploads/payment/1/transfer.pdf'))
# New paid application for applicant 1, with its own compensation chain.
insert('agriculture_damage_app',('REQ-2026-000137',1,'DIS-2026-00137','집중호우','배추','AREA-2026-00137','인천광역시 강화군','지급결과 확인','2026-09-21'))
insert('damage_site_invest',(6,'REQ-2026-000137','품질담당자','침수 피해',1000,40,'침수 피해 확인','조사 완료','2026-09-23'))
insert('damage_action',(4,'REQ-2026-000137','품질담당자',500,1000,'폐기','침수 작물 폐기','2026-09-24',1,'2026-09-25','품질담당자','품질관리과',500,'폐기 확인','2026-09-26'))
insert('compensation_claim',(3,'REQ-2026-000137','품질담당자',2000000,1000,500,'2026-09-27'))
insert('compensation_calc',(2,3,'품질담당자','품질관리과','침수 작물 보상 기준',500,4000,'지원율 80% 적용',1600000,80,'2026-09-28'))
insert('compensation_payment',(2,3,'품질담당자','보상지원과','김민아','테스트계좌-0137','2026-09-29','2026-09-29',1600000))
for table,parent in [('app_doc','REQ-2026-000137'),('invest_doc',6),('damage_action_doc',4),('compensation_claim_doc',3),('compensation_calc_doc',2),('compensation_payment_doc',2)]:
    pk=pks[table]
    next_id=db.execute(f'SELECT MAX({pk})+1 FROM {table}').fetchone()[0]
    for i in range(2):
        label=['확인서','증빙자료'][i]
        url=f'/uploads/test137/{table}/{i+1}.pdf'
        row=(next_id+i,parent,label,url)
        if table=='compensation_claim_doc': row=(next_id+i,parent,label,'신청인','2026-09-27',url,'품질담당자','2026-09-28')
        insert(table,row)
header='-- Oracle / UTF-8. 기존 최신 ZIP의 sample_data.sql 실행 후 1회 실행.\n-- 고정 ID를 사용하는 개발용 데이터입니다. 재실행/기존 ID 충돌 시 실행하지 마세요.\n-- COMMIT 전 확인 쿼리로 결과를 확인하고 필요하면 ROLLBACK 하세요.\n-- URL은 테스트 문자열이며 실제 첨부파일은 포함하지 않습니다.\n\n'
(out/'sample_data_additions.sql').write_text(header+'\n\n'.join(additions)+'\n\n-- 검증 후 수동 COMMIT;\n',encoding='utf-8')
clean_original = re.sub(r"INSERT INTO quality_assurance_officer\s*\(.*?\)\s*VALUES\s*\(.*?\);", '', original, flags=re.S)
(out/'sample_data.sql').write_text(clean_original.replace('COMMIT;', '')+'\n'+header+'\n\n'.join(additions)+'\n\nCOMMIT;\n',encoding='utf-8')
checks=["SELECT position, name FROM quality_assurance_officer WHERE username = 'quality01' AND password = 'quality1234';"]
checks.append("-- expected: 0\nSELECT COUNT(*) AS admin_count FROM quality_assurance_officer WHERE LOWER(username) LIKE 'admin%';")
for table,col in relations:
    checks.append(f'SELECT {col}, COUNT(*) AS child_count FROM {table} GROUP BY {col} HAVING COUNT(*) > 1;')
checks.append("SELECT a.app_id, ap.organization_name, a.product_name, p.payment_completion_date, p.payment_amount FROM agriculture_damage_app a JOIN applicant ap ON ap.applicant_id=a.applicant_id JOIN compensation_claim c ON c.app_id=a.app_id JOIN compensation_payment p ON p.compensation_claim_id=c.compensation_claim_id ORDER BY a.app_id;")
checks.append("SELECT invest_id, app_id, invest_date, damage_rate, damage_area FROM damage_site_invest WHERE app_id='REQ-2026-000136' ORDER BY invest_date, invest_id;")
(out/'sample_data_checks.sql').write_text('-- 로그인 1건 / 신청자1 신청3건 / 000136 조사2건 / 문서6종 복수건 / 지급목록2건\n\n'+'\n\n'.join(checks)+'\n',encoding='utf-8')
assert db.execute("SELECT COUNT(*) FROM quality_assurance_officer WHERE username='quality01' AND password='quality1234'").fetchone()[0]==1
assert db.execute("SELECT COUNT(*) FROM quality_assurance_officer WHERE LOWER(username) LIKE 'admin%'").fetchone()[0]==0
assert db.execute('SELECT COUNT(*) FROM agriculture_damage_app WHERE applicant_id=1').fetchone()[0]==3
assert db.execute("SELECT COUNT(*) FROM damage_site_invest WHERE app_id='REQ-2026-000136'").fetchone()[0]==2
assert not db.execute('PRAGMA foreign_key_check').fetchall()
for table,col in relations[2:]:
    assert db.execute(f'SELECT {col} FROM {table} GROUP BY {col} HAVING COUNT(*)>1').fetchall()
print('AFTER',json.dumps(counts(),ensure_ascii=False))
print('PASS: PK/FK, login, all requested 1:N relationships (SQLite structural verification; Oracle not executed)')
for name in ['01_create_tables.sql','02_create_constraints.sql']:
    (out/name).write_text(normalize((root/name).read_text(encoding='utf-8-sig')),encoding='utf-8')
sequences=(root/'03_create_sequences.sql').read_text(encoding='utf-8-sig')
def sequence_start(match):
    table=match.group(1)[4:]
    start=db.execute(f'SELECT COALESCE(MAX({pks[table]}),0)+1 FROM {table}').fetchone()[0]
    return f'CREATE SEQUENCE {match.group(1)}\n    START WITH {start}'
sequences=re.sub(r'CREATE SEQUENCE (seq_\w+)\s+START WITH 1',sequence_start,sequences)
(out/'03_create_sequences.sql').write_text(sequences,encoding='utf-8')

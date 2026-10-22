const fs = require('node:fs');

const JIRA_BASE = 'https://tlals0028.atlassian.net/browse/';

function validate(pr) {
  const keyPattern = /(?<![A-Za-z0-9])SCRUM-[1-9]\d*(?![A-Za-z0-9])/g;
  const titleKeys = [...new Set((pr.title || '').match(keyPattern) || [])];
  const branchKeys = new Set((pr.head?.ref || '').match(keyPattern) || []);
  const errors = [];
  if (!titleKeys.length) errors.push('PR 제목에 Jira 키가 필요합니다. 예: docs: [SCRUM-86] 개발 이력 연결');
  for (const key of titleKeys) {
    // dev -> main release PRs keep the established integration branch name.
    const isRelease = pr.head?.ref === 'dev' && pr.base?.ref === 'main';
    if (!isRelease && !branchKeys.has(key)) errors.push(`브랜치에 제목의 Jira 키 ${key}를 포함하세요.`);
    const escaped = (JIRA_BASE + key).replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    if (!new RegExp(`${escaped}(?=$|[\\s)\\]<>.,;])`, 'm').test(pr.body || '')) {
      errors.push(`PR 본문에 정확한 Jira 링크 ${JIRA_BASE}${key}를 넣으세요.`);
    }
  }
  return { keys: titleKeys, errors };
}

if (require.main === module) {
  try {
    const eventPath = process.env.GITHUB_EVENT_PATH || process.argv[2];
    if (!eventPath) throw new Error('GitHub event JSON 경로가 필요합니다.');
    const event = JSON.parse(fs.readFileSync(eventPath, 'utf8'));
    if (!event.pull_request) throw new Error('pull_request 이벤트가 필요합니다.');
    const { keys, errors } = validate(event.pull_request);
    if (errors.length) {
      for (const error of errors) process.stderr.write(`${error}\n`);
      process.exitCode = 1;
    } else {
      process.stdout.write(`Jira 연결 확인: ${keys.join(', ')}\n`);
    }
  } catch (error) {
    process.stderr.write(`연결 검사 실패: ${error.message}\n`);
    process.exitCode = 1;
  }
}

module.exports = { validate };

# DAO Test Guide

## Scope

These tests cover the first sprint screens:

- Manager login
- Compensation payment-result list
- Compensation detail monitoring view

Damage action and field survey are not separate DAO features in this sprint. Their summary values are verified through `CompensationDAO.findCompensationDetailByApplyNo`.

## Prerequisite

Run the SQL files in this order against Oracle:

1. `sql/01_create_tables.sql`
2. `sql/02_create_constraints.sql`
3. `sql/03_create_sequences.sql`
4. `sql/sample_data.sql`
5. `sql/04_select_check.sql`

## Database Settings

Set either environment variables:

```powershell
$env:AGRICOMP_DB_URL = "jdbc:oracle:thin:@localhost:1521/XEPDB1"
$env:AGRICOMP_DB_USER = "AGRICOMP"
$env:AGRICOMP_DB_PASSWORD = "password"
```

Or JVM system properties:

```powershell
mvn test -Dagricomp.db.url="jdbc:oracle:thin:@localhost:1521/XEPDB1" -Dagricomp.db.user="AGRICOMP" -Dagricomp.db.password="password"
```

If the DB URL or user is not configured, the JUnit tests are skipped instead of failing.

## Run

```powershell
mvn test
```

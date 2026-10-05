-- Existing local sample DB: update only the display name of the sprint1 account.
UPDATE quality_assurance_officer SET name = '이*규' WHERE username = 'quality01';
-- Inspect the affected row before COMMIT when applying manually.
SELECT position, name FROM quality_assurance_officer WHERE username = 'quality01';

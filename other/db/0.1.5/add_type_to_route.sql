USE setter;
ALTER TABLE routes ADD COLUMN type INT DEFAULT 0;

UPDATE routes SET type = IF(boulder_grade_id IS NOT null, 0, IF(toprope_grade_id IS NOT NULL, 1, 2));

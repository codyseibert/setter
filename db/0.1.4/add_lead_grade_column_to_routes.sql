USE setter;
ALTER TABLE routes ADD COLUMN lead_grade_id INT DEFAULT NULL;
ALTER TABLE routes ADD FOREIGN KEY (lead_grade_id) REFERENCES rope_grades(id) ON DELETE SET NULL;

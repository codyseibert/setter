USE setter;
ALTER TABLE routes DROP FOREIGN KEY `routes_ibfk_3`;
ALTER TABLE routes CHANGE rope_grade_id toprope_grade_id INT;
ALTER TABLE routes ADD FOREIGN KEY (lead_grade_id) REFERENCES rope_grades(id) ON DELETE SET NULL;
ALTER TABLE routes ADD FOREIGN KEY (toprope_grade_id) REFERENCES rope_grades(id) ON DELETE SET NULL;

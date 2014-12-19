USE setter;

ALTER TABLE routes ADD COLUMN wall_id INT NOT NULL;

UPDATE routes r SET r.wall_id = (SELECT s.wall_id FROM sets s WHERE s.id = r.set_id);

ALTER TABLE routes ADD FOREIGN KEY (wall_id) REFERENCES walls(id) ON DELETE CASCADE;

ALTER TABLE routes DROP FOREIGN KEY routes_ibfk_1;

ALTER TABLE routes DROP set_id;

DROP TABLE sets;

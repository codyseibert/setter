USE setter;
ALTER TABLE accounts DROP FOREIGN KEY `accounts_ibfk_2`;
ALTER TABLE accounts ADD FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE SET NULL;

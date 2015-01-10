USE setter;
ALTER TABLE routes ADD COLUMN active boolean NOT NULL DEFAULT 1;

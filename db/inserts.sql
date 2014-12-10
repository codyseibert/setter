INSERT INTO boulder_grades (name) VALUES ('V0');
INSERT INTO boulder_grades (name) VALUES ('V1');
INSERT INTO boulder_grades (name) VALUES ('V2');
INSERT INTO boulder_grades (name) VALUES ('V3');
INSERT INTO boulder_grades (name) VALUES ('V4');
INSERT INTO boulder_grades (name) VALUES ('V5');
INSERT INTO boulder_grades (name) VALUES ('V6');
INSERT INTO boulder_grades (name) VALUES ('V7');
INSERT INTO boulder_grades (name) VALUES ('V8');
INSERT INTO boulder_grades (name) VALUES ('V9');
INSERT INTO boulder_grades (name) VALUES ('V10');
INSERT INTO boulder_grades (name) VALUES ('V11');
INSERT INTO boulder_grades (name) VALUES ('V12');
INSERT INTO boulder_grades (name) VALUES ('V13');

INSERT INTO rope_grades (name) VALUES ('5.6');
INSERT INTO rope_grades (name) VALUES ('5.7');
INSERT INTO rope_grades (name) VALUES ('5.8');
INSERT INTO rope_grades (name) VALUES ('5.9');
INSERT INTO rope_grades (name) VALUES ('5.10');
INSERT INTO rope_grades (name) VALUES ('5.11');
INSERT INTO rope_grades (name) VALUES ('5.12');
INSERT INTO rope_grades (name) VALUES ('5.13');
INSERT INTO rope_grades (name) VALUES ('5.14');
INSERT INTO rope_grades (name) VALUES ('5.15');

INSERT INTO accounts_types (name) values ('user');
INSERT INTO accounts_types (name) values ('setter');
INSERT INTO accounts_types (name) values ('gym');

INSERT INTO accounts (email, password, type_id) VALUES ('user', '123456', 1);
INSERT INTO users (account_id, firstname, lastname) VALUES (1, 'Cody', 'Seibert');

INSERT INTO accounts (email, password, type_id) VALUES ('setter', '123456', 2);
INSERT INTO setters (account_id, firstname, lastname) VALUES (2, 'Cody', 'Seibert');

INSERT INTO accounts (email, password, type_id) VALUES ('gym', '123456', 3);
INSERT INTO gyms (account_id, name, address) VALUES (3, 'Aiguille', '999 Barton Street');

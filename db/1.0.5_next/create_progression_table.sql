USE setter;

DROP TABLE IF EXISTS `progressions`;
CREATE TABLE progressions
(
    user_id INT NOT NULL,
    date DATE NOT NULL,
    bouldering_grade FLOAT,
    toprope_grade FLOAT,
    lead_grade FLOAT,

    PRIMARY KEY (user_id, date),

    FOREIGN KEY (user_id)
        REFERENCES users(account_id)
        ON DELETE CASCADE

) ENGINE=InnoDB;

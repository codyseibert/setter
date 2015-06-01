USE setter;

DROP TABLE IF EXISTS `alerts_users`;
CREATE TABLE alerts_users
(
    user_id INT NOT NULL,
    alert_id INT NOT NULL,

    FOREIGN KEY (user_id)
        REFERENCES users(account_id)
        ON DELETE CASCADE,

    FOREIGN KEY (alert_id)
        REFERENCES alerts(id)
        ON DELETE CASCADE

) ENGINE=InnoDB;

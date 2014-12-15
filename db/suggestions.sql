CREATE TABLE suggestions
(
    id int NOT NULL AUTO_INCREMENT,
    account_id int NOT NULL,
    suggestion text NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE suggestions_upvotes
(
    suggestion_id int NOT NULL,
    account_id int NOT NULL,

    PRIMARY KEY (suggestion_id, account_id),

    FOREIGN KEY (suggestion_id)
        REFERENCES suggestions(id)
        ON DELETE CASCADE,

    FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

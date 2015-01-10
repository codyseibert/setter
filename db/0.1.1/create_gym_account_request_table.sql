USE setter;

CREATE TABLE gym_account_requests
(
    email VARCHAR(255) NOT NULL,
    name INT NOT NULL,
    address VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

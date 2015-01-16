insert into accounts
    (
        email,
        password,
        type_id,
        token
    )
    values
    (
        'info@onthedgerockclimbing.com',
        '$2a$10$Ye2MhsIX.4bKvOvS8pBDfe9La69392zLbHthXIxAKl4NNnBZ7p.Bq',
        2,
        'HlofkGfmw4dBdZwQbcJG'
    );


insert into gyms
    (
        account_id,
        name,
        address
    )
    values
    (
        30,
        'On The Edge',
        '200 West Drive, Melbourne, FL, 32904'
    );

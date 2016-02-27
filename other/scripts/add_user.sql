insert into accounts
    (
        email,
        password,
        type_id,
        token
    )
    values
    (
        'some_guest_email_1@some_non_email.com',
        '$2a$10$Ye2MhsIX.4bKvOvS8pBDfe9La69392zLbHthXIxAKl4NNnBZ7p.Bq',
        1,
        'HlofkGfmw4dBdZwQbcJG'
    );


insert into users
    (
        account_id,
        gym_id,
        firstname,
        lastname
    )
    values
    (
        31, # replace me
        2,
        'Guest',
        'Guest'
    );

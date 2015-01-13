insert into accounts
    (
        email,
        password,
        type_id,
        token
    )
    values
    (
        'contact@highpoint.com',
        '$2a$10$I.N.rmQH.OgRFKxH3YXyNOx2BTxeRdDDaNFNUJgo3jltNhS9RMGsK',
        2,
        'xKzBYQdhDJ0K3822RiZO'
    );


insert into gyms
    (
        account_id,
        name,
        address
    )
    values
    (
        26,
        'High Point Climbing and Fitness',
        '219 Broad Street Chattanooga, TN 37402'
    );

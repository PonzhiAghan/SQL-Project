SELECT *
FROM crime_scene_report
WHERE city = "SQL City" AND date = 20180115;

SELECT *
FROM interview
JOIN person ON person.id = interview.person_id
WHERE interview.person_id IN (
    SELECT id 
    FROM person
    WHERE address_street_name IN ("Northwestern Dr", "Franklin Ave") 
    OR name LIKE "%Annabel%"
);

SELECT *
FROM get_fit_now_member
JOIN interview ON get_fit_now_member.person_id = interview.person_id
WHERE get_fit_now_member.person_id IN (
    SELECT id 
    FROM person
    WHERE address_street_name IN ("Northwestern Dr", "Franklin Ave") 
    OR name LIKE "%Annabel%"
);

SELECT * 
FROM get_fit_now_check_in
JOIN get_fit_now_member ON get_fit_now_check_in.membership_id = get_fit_now_member.id
JOIN person ON get_fit_now_member.person_id = person.id
WHERE membership_id LIKE "%48Z%" AND check_in_date = 20180109 OR check_out_time >= 1600;

SELECT * 
FROM person
JOIN interview ON interview.person_id = person.id
WHERE person_id IN (28819 ,67318);

SELECT * 
FROM drivers_license
WHERE hair_color = "red" AND gender = "female" AND car_make = "Tesla" AND height IN (65, 67) OR plate_number LIKE "%H42W%";

SELECT * 
FROM person
JOIN drivers_license ON drivers_license.id = person.license_id
JOIN income ON income.ssn = person.ssn
WHERE drivers_license.id = (
    SELECT id 
    FROM drivers_license
    WHERE hair_color = "red" AND gender = "female" AND car_make = "Tesla" AND height IN (65, 67)
) OR person.id IN (28819 ,67318);

SELECT * 
FROM facebook_event_checkin
JOIN person ON facebook_event_checkin.person_id =  person.id
WHERE event_name = "SQL Symphony Concert" AND CAST(date AS TEXT) LIKE '201712%' 
    AND person.id = (
        SELECT person.id
        FROM person
        JOIN drivers_license ON drivers_license.id = person.license_id
        WHERE drivers_license.id = (
            SELECT id 
            FROM drivers_license
            WHERE hair_color = 'red' AND gender = 'female' 
            AND car_make = 'Tesla' AND height IN (65, 67)
        )
    );

SELECT * 
FROM person
JOIN facebook_event_checkin ON facebook_event_checkin.person_id = person.id
JOIN interview ON interview.person_id = person.id
WHERE date = 20171206 AND event_name = "SQL Symphony Concert";

SELECT * 
FROM income
JOIN person ON person.ssn = income.ssn
WHERE person.id = (
    SELECT person.id
    FROM person
    JOIN drivers_license ON drivers_license.id = person.license_id
    WHERE drivers_license.id = (
        SELECT id 
        FROM drivers_license
        WHERE hair_color = "red" AND gender = "female" AND car_make = "Tesla" AND height IN (65, 67)
    )
);

SELECT * 
FROM person
JOIN drivers_license ON drivers_license.id = person.license_id
JOIN income ON income.ssn = person.ssn
WHERE person.id IN (14887, 28819, 67318, 16371, 69325);

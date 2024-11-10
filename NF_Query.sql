CREATE database Netflix_db;

CREATE TABLE Netflix_data (
    show_id VARCHAR(50),
    type VARCHAR(50),
    title VARCHAR(200),
    director VARCHAR(210),
    casts VARCHAR(1000),
    country VARCHAR(200),
    date_added DATE,
    release_year INT,
    rating VARCHAR(100),
    duration VARCHAR(150),
    listed_in VARCHAR(100),
    descriptions VARCHAR(260)
);

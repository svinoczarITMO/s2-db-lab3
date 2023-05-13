CREATE TABLE humans (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    sex VARCHAR NOT NULL CONSTRAINT check_type CHECK (sex = 'Male' OR sex = 'Female') DEFAULT 'Female'
);

CREATE TABLE people (
    id SERIAL PRIMARY KEY,
    count INTEGER,
    human_id INTEGER REFERENCES humans(id)
);

CREATE TABLE action_types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(128)
);

CREATE TABLE location_types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(128)
);

CREATE TABLE object_types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(128)
);

CREATE TABLE objects (
    id SERIAL PRIMARY KEY,
    object_type_id INTEGER REFERENCES object_types(id),
    object_subtype VARCHAR(50),
    height FLOAT,
    width FLOAT,
    weight FLOAT,
    shape VARCHAR(50),
    material VARCHAR(50),
    count INTEGER,
    location VARCHAR(128),
    action VARCHAR(128)
);

CREATE TABLE environments (
    id SERIAL PRIMARY KEY,
    sounds VARCHAR(64),
    object_id INTEGER REFERENCES objects(id)
);

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    location_type_id INTEGER REFERENCES location_types(id),
    temperature FLOAT,
    environment INTEGER REFERENCES environments(id)
);

CREATE TABLE actions (
    id SERIAL PRIMARY KEY,
    action_type_id INTEGER REFERENCES action_types(id),
    performer_id INTEGER REFERENCES people(id),
    location_id INTEGER REFERENCES locations(id),
    time TIMESTAMP
);

CREATE TABLE object_subtypes (
    id SERIAL PRIMARY KEY,
    subtype VARCHAR(128)
);

CREATE TABLE object_location_types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(128)
);

CREATE TABLE object_action_types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(128)
);
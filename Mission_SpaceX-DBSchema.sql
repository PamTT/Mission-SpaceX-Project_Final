-- Database Schema

CREATE TABLE Capsule (
    capsule_serial varchar PRIMARY KEY NOT NULL,
    capsule_id varchar  NOT NULL,
    status varchar NOT NULL,
    type varchar NOT NULL,
    reuse_count varchar NOT NULL,
    water_landings varchar NOT NULL,
    land_landings varchar NOT NULL
);

CREATE TABLE Launchpad (
    site_id varchar PRIMARY KEY NOT NULL,
    name varchar NOT NULL,
    full_name varchar NOT NULL,
    status varchar NOT NULL,
    locality varchar NOT NULL,
    region varchar NOT NULL,
    timezone varchar NOT NULL,
    latitude varchar NOT NULL,
    longitude varchar NOT NULL,
    attempted_launches varchar NOT NULL,
    successful_launches varchar NOT NULL
);

CREATE TABLE Payload (
    payload_id varchar PRIMARY KEY NOT NULL,
    type varchar NOT NULL,
    reused varchar NOT NULL,
    mass_lb varchar NOT NULL,
    nationality varchar NOT NULL
);

CREATE TABLE Rocket (
    rocket_id varchar PRIMARY KEY NOT NULL,
    name varchar NOT NULL,
    type varchar NOT NULL,
    active varchar NOT NULL,
    country varchar NOT NULL,
    company varchar NOT NULL,
    height_ft varchar NOT NULL,
    diameter_ft varchar NOT NULL,
    mass_lb varchar NOT NULL,
    stages varchar NOT NULL,
    boosters varchar NOT NULL,
    cost_per_launch varchar NOT NULL,
    success_rate varchar NOT NULL
);

CREATE TABLE Launches (
    launch_id varchar PRIMARY KEY NOT NULL,
    mission_name varchar NOT NULL,
    launch_year varchar NOT NULL,
    date varchar NOT NULL,
    success varchar NOT NULL,
    failure_reason varchar NOT NULL
);

CREATE TABLE Launch_Cap (
    launch_id varchar NOT NULL,
    capsule_serial varchar NOT NULL,
    PRIMARY KEY (launch_id, capsule_serial),
    FOREIGN KEY (launch_id) REFERENCES Launches(launch_id),
    FOREIGN KEY (capsule_serial) REFERENCES Capsule(capsule_serial)
);

CREATE TABLE Bridge (
    launch_id varchar NOT NULL,
    rocket_id varchar NOT NULL,
    site_id varchar NOT NULL,
    payload_id varchar NOT NULL,
    PRIMARY KEY (launch_id, rocket_id, site_id, payload_id),
    FOREIGN KEY(launch_id) REFERENCES Launches (launch_id),
    FOREIGN KEY(rocket_id) REFERENCES Rocket (rocket_id),
    FOREIGN KEY(site_id) REFERENCES Launchpad (site_id),
    FOREIGN KEY(payload_id) REFERENCES Payload (payload_id)
);




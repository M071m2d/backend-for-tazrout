--creating data base
create database tazrout;

--creating tables

--zone model 
 create table Zone(
    id int primary key not null,
    crop_type varchar(40),
    status varchar(10),
    area float,
    location varchar(45),
    created_at TIMESTAMP,
    updated_at timestamp
    
    );

--Sensor Reading model

create table sensor_reading(
    id int primary key not null,
    zone_id int REFERENCES zone(id) ,
    moisture_percentage float,
    temperature_celsius float,
    humidity_percentage float,
    battery_percentage float,
    is_calibrated bool,
    timestamp timestamp
);

--AI Decision Model 

create table AI_Decision(
    id int primary key not null,
    zone_id int REFERENCES zone(id),
    decision varchar(45),
    rationale varchar(45),
    confidence_score real constraint smaller_than_one check(confidence_score>=0.0 and confidence_score <= 1.0 ),
     timestamp  timestamp,
     executed bool,
     sensor_data_snapshot jsonb --dictionary
);

--Irrigation Log Model

create table Irrigation_Log(
    id int primary key not null,
    zone_id int REFERENCES zone(id),
    water_used_liters float,
    duration_minute float,
    start_time timestamp,
    end_time timestamp,
    triggered_by varchar(45)
);


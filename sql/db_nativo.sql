create database nativo;

create table activity(
	activity_id serial primary key,
	name_activity varchar(50),
	description varchar(600),
	cost_by_id real,
	turists_quote smallint
);

create table users(
	user_id serial primary key,
	full_name varchar(50),
	user_name varchar(30),
	contact_number varchar(14),
	email varchar(60),
	birthdate date,
	password varchar(12),
	photo bytea
);

create table municipality(
	municipality_id serial primary key,
	name_municipality varchar(60),	
	area_municipality GEOMETRY not null
);

create table place(
	municipality_id int,
	place_id serial primary key,
	coordinates point,
	photo bytea,
	description varchar(500)
);

alter table place
add constraint FKmunicipio
foreign key(municipality_id)
references municipality(municipality_id)

create table activity_per_place(
	activity_per_place_id serial primary key,
	activity_id int,
	place_id int
);
alter table activity_per_place
add constraint FKactivity
foreign key(activity_id)
references activity(activity_id);

alter table activity_per_place
add constraint FKplace
foreign key(place_id)
references place(place_id);

create table booking_activity(
	activity_id int,
	booking_activity_id bigserial primary key,
	activity_date timestamp
);

alter table booking_activity
add constraint FKbookingActivity
foreign key(activity_id)
references activity(activity_id);

create table booking(
	booking_id bigserial primary key,
	place_id int,
	user_id int,
	booking_activity_id bigint
);

alter table booking
add constraint FKbookingPlace
foreign key (place_id)
references place(place_id);

alter table booking
add constraint FKbookingUser
foreign key (user_id)
references users(user_id);

alter table booking
add constraint FKbookingActivity
foreign key (booking_activity_id)
references booking_activity(booking_activity_id);

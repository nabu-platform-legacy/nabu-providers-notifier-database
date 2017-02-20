create sequence seq_notifications_id;
create sequence seq_notification_props_id;

create table notifications (
	id bigint not null default nextval('seq_notifications_id') primary key,
	created timestamp not null,
	modified timestamp not null,
	severity text not null,
	message text,
	description text,
	context text,
	type text,
	code integer
);
create table notification_properties (
	id bigint not null default nextval('seq_notification_props_id') primary key,
	created timestamp not null,
	modified timestamp not null,
	key text not null,
	value text not null,
	notification_id bigint references notifications(id) not null
);

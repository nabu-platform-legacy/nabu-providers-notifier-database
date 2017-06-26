create table notifications (
	id number primary key,
	created timestamp not null,
	modified timestamp not null,
	severity varchar2(4000) not null,
	message varchar2(4000),
	description clob,
	context varchar2(4000),
	type varchar2(4000),
	code integer
);

create table notification_properties (
	id number primary key,
	created timestamp not null,
	modified timestamp not null,
	key varchar2(4000) not null,
	value varchar2(4000) not null,
	notification_id number not null,
	foreign key (notification_id) references eoly_dev.notifications(id)
);

-- sequence
CREATE SEQUENCE seq_notifications
 START WITH     1
 INCREMENT BY   1
;

CREATE SEQUENCE seq_notification_properties
 START WITH     1
 INCREMENT BY   1
;


--trigger
CREATE OR REPLACE TRIGGER trig_notifications 
BEFORE INSERT ON notifications 
FOR EACH ROW
BEGIN
  SELECT seq_notifications.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

--trigger
CREATE OR REPLACE TRIGGER trig_notification_properties
BEFORE INSERT ON notification_properties
FOR EACH ROW
BEGIN
  SELECT seq_notification_properties.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

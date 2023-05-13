select * from actions;
select * from action_types;
select * from environments;
select * from humans;
select * from location_types;
select * from locations;
select * from object_action_types;
select * from object_location_types;
select * from object_subtypes;
select * from object_types;
select * from objects;

ALTER TABLE actions
ADD CONSTRAINT fk_performer
FOREIGN KEY (performer_id)
REFERENCES humans(id);
delete from location_types where id >= 8;

alter table objects
    add constraint fk_object_subtype
    foreign key (object_subtype)
    references object_subtypes(id);

alter table objects
    add constraint fk_location
    foreign key (location)
    references object_location_types(id);

alter table objects
    add constraint fk_action
    foreign key (action)
    references object_action_types(id);

alter table objects
    add column object_subtype integer;

alter table objects
    add column location integer,
    add column action integer;

update objects set object_subtype = 1, location = 1, action = 1 where id = 1;
update objects set object_subtype = 2, location = 2, action = 2 where id = 2;
update objects set object_subtype = 3, location = 3, action = 1 where id = 3;
update objects set object_subtype = 4, location = 4, action = 1 where id = 4;
update objects set object_subtype = 5, location = 5, action = 1 where id = 5;
update objects set object_subtype = 6, location = 6, action = 3 where id = 6;
update objects set object_subtype = 7, location = 5, action = 4 where id = 7;

delete from objects where id >= 22;

------------------------------------------------------------------------

select humans.first_name, action_types.type, location_types.type
from humans join actions on humans.id = actions.performer_id
    join action_types on actions.action_type_id = action_types.id
    join locations on actions.location_id = locations.id
    join location_types on locations.location_type_id = location_types.id;

insert into actions (action_type_id, performer_id, location_id, time)
values
  (2, 10, 3, '2023-04-29 10:00:00'),
  (1, 11, 3, '2023-04-29 11:00:00'),
  (3, 11, 3, '2023-04-29 11:00:00');

select * from actions;

create view more_than_two as
select humans.first_name, count(*) as actions_count
from humans join actions on humans.id = actions.performer_id
group by performer_id, humans.first_name
having count(*) > 2;

select * from more_than_two;
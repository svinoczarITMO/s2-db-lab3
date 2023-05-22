create table runners (
    id serial primary key,
    performer_id serial references humans(id),
    location_id serial references locations(id);

insert into actions (action_type_id, performer_id, location_id)
values (
        2, 12, 1
        );

create or replace function log_runners()
returns trigger as $$
begin
  IF new.action_type_id = 2 then
    insert into runners (performer_id, location_id) values (new.performer_id, new.location_id);
  end if;
  return new;
end;
$$ language plpgsql;

create trigger add_runner_to_list
after insert on actions
for each row
execute function log_runners();

select * from actions;
select * from runners;


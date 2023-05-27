--- #1 ---
create table runners (
    id serial primary key,
    performer_id serial references humans(id),
    location_id serial references locations(id));

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

--- #2 ---
create or replace function get_actions_by_name(name varchar)
returns table(type varchar, "time" timestamp) as $$
begin
    return query
    (
    select at.type, a.time from actions a
    join action_types at on a.action_type_id = at.id
    join humans h on a.performer_id = h.id
    where h.first_name = name);
exception
  when others then
    raise exception 'An error occurred: %', SQLERRM;
end;
$$ language plpgsql;

select * from get_actions_by_name('John');
select * from get_actions_by_name('Jane');
select * from get_actions_by_name('Bob');

select * from actions;
select * from runners;
select * from humans;
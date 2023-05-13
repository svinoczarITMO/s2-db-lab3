INSERT INTO humans (first_name, last_name, date_of_birth, sex)
VALUES
  ('John', 'Doe', '1990-01-01', 'Male'),
  ('Jane', 'Doe', '1992-03-15', 'Female'),
  ('Bob', 'Smith', '1985-05-20', 'Male');


INSERT INTO action_types (type)
VALUES
  ('Walk'),
  ('Run'),
  ('Jump');

INSERT INTO location_types (type)
VALUES
  ('Factory'),
  ('Next Room'),
  ('Actual Room'),
  ('Outdoor'),
  ('Park'),
  ('Kitchen'),
  ('Bedroom');

INSERT INTO object_types (type)
VALUES
  ('Door'),
  ('Box'),
  ('Machine');

INSERT INTO objects (object_type_id, object_subtype, height, width, weight, shape, material, count, location, action)
VALUES
  (1, 'Automatic door', 4.0, 4.0, 50.5, 'Square', 'Steel', 2, 'Entrance to the factory', 'None'),
  (1, 'Sliding door', 3.0, 3.0, 45.0, 'Parallelepiped', 'Steel', 2, 'Entrance to the next room', 'Sliding'),
  (1, 'Casual door', 3.0, 1.5, 10.0, 'Parallelepiped', 'Wood', 1, 'Entrance to the bedroom', 'None');

INSERT INTO objects (object_type_id, object_subtype, height, width, weight, shape, material, count, location, action)
VALUES
  (2, 'Container', 0.75, 0.75, 2.0, 'Parallelepiped', 'Plastic', 3, 'Bedroom', 'None'),
  (2, 'Box', 1.25, 1.25, 8.0, 'Parallelepiped', 'Stainless steel', 8, 'Near the wall', 'None');

INSERT INTO objects (object_type_id, object_subtype, height, width, weight, shape, material, count, location, action)
VALUES
  (3, 'Apparatus', 35.0, 35.0, 40, 'Sphere', 'Stainless steel', 2, 'Center of the room', 'Buzzes'),
  (3, 'Furnace', 10, 5, 20, 'Parallelepiped', 'Steel', 1, 'Near the wall', 'Fries');

INSERT INTO environments (sounds, object_id)
VALUES
  ('Humming', 7),
  ('Buzzes', 6),
  ('Silence', 5);

INSERT INTO locations (location_type_id, temperature, environment)
VALUES
  (1, 24.5, 1),
  (2, 8.0, 2),
  (3, 17.5, 3);

INSERT INTO actions (action_type_id, performer_id, location_id, time)
VALUES
  (1, 10, 1, '2023-04-15 10:00:00'),
  (2, 11, 2, '2023-04-15 11:00:00'),
  (3, 12, 1, '2023-04-15 14:00:00');

insert into object_subtypes (id, subtype)
values
    (1, 'automatic door'),
    (2, 'sliding door'),
    (3, 'casual door'),
    (4, 'container'),
    (5, 'box'),
    (6, 'apparatus'),
    (7, 'furnace');

insert into object_location_types (id, type)
values
    (1, 'Entrance to the factory'),
    (2, 'Entrance to the next room'),
    (3, 'Entrance to the bedroom'),
    (4, 'Bedroom'),
    (5, 'Near the wall'),
    (6, 'Center of the room');

insert into object_action_types (id, type)
values
    (1, 'None'),
    (2, 'Sliding'),
    (3, 'Buzzes'),
    (4, 'Humming');


camper: /project$ psql --username=freecodecamp dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=> create database universe;
CREATE DATABASE
postgres=> \l
                                 List of databases
+-----------+--------------+----------+---------+---------+-----------------------+
|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+--------------+----------+---------+---------+-----------------------+
| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| universe  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
+-----------+--------------+----------+---------+---------+-----------------------+
(4 rows)

postgres=> \c universe;
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe=> create table galaxy(galaxy_id serial primary key, name varchar(20) unique not null);
CREATE TABLE
universe=> \d
                     List of relations
+--------+----------------------+----------+--------------+
| Schema |         Name         |   Type   |    Owner     |
+--------+----------------------+----------+--------------+
| public | galaxy               | table    | freecodecamp |
| public | galaxy_galaxy_id_seq | sequence | freecodecamp |
+--------+----------------------+----------+--------------+
(2 rows)

universe=> \d galaxy;
                                         Table "public.galaxy"
+-----------+-----------------------+-----------+----------+-------------------------------------------+
|  Column   |         Type          | Collation | Nullable |                  Default                  |
+-----------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name      | character varying(20) |           | not null |                                           |
+-----------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> alter table galaxy add column age int not null;
ALTER TABLE
universe=> \d galaxy;
                                         Table "public.galaxy"
+-----------+-----------------------+-----------+----------+-------------------------------------------+
|  Column   |         Type          | Collation | Nullable |                  Default                  |
+-----------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name      | character varying(20) |           | not null |                                           |
| age       | integer               |           | not null |                                           |
+-----------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> alter table galaxy add column shape text not null;
ALTER TABLE
universe=> \d galaxy;
                                         Table "public.galaxy"
+-----------+-----------------------+-----------+----------+-------------------------------------------+
|  Column   |         Type          | Collation | Nullable |                  Default                  |
+-----------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name      | character varying(20) |           | not null |                                           |
| age       | integer               |           | not null |                                           |
| shape     | text                  |           | not null |                                           |
+-----------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> alter table galaxy add column distance_from_earth int;
ALTER TABLE
universe=> alter table galaxy add column life_in_it bit;
ALTER TABLE
universe=> \d galaxy;
                                              Table "public.galaxy"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id           | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                | character varying(20) |           | not null |                                           |
| age                 | integer               |           | not null |                                           |
| shape               | text                  |           | not null |                                           |
| distance_from_earth | integer               |           |          |                                           |
| life_in_it          | bit(1)                |           |          |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> create table star(star_id serial primary key, name varchar(20) not null, age int, shape text, distance_from_earth int, life_in_it bit);
CREATE TABLE
universe=> \d
                     List of relations
+--------+----------------------+----------+--------------+
| Schema |         Name         |   Type   |    Owner     |
+--------+----------------------+----------+--------------+
| public | galaxy               | table    | freecodecamp |
| public | galaxy_galaxy_id_seq | sequence | freecodecamp |
| public | star                 | table    | freecodecamp |
| public | star_star_id_seq     | sequence | freecodecamp |
+--------+----------------------+----------+--------------+
(4 rows)

universe=> \d star;
                                             Table "public.star"
+---------------------+-----------------------+-----------+----------+---------------------------------------+
|       Column        |         Type          | Collation | Nullable |                Default                |
+---------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id             | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                | character varying(20) |           | not null |                                       |
| age                 | integer               |           |          |                                       |
| shape               | text                  |           |          |                                       |
| distance_from_earth | integer               |           |          |                                       |
| life_in_it          | bit(1)                |           |          |                                       |
+---------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)

universe=> alter table galaxy add column description text;
ALTER TABLE
universe=> \d galaxy;
                                              Table "public.galaxy"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id           | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                | character varying(20) |           | not null |                                           |
| age                 | integer               |           | not null |                                           |
| shape               | text                  |           | not null |                                           |
| distance_from_earth | integer               |           |          |                                           |
| life_in_it          | bit(1)                |           |          |                                           |
| description         | text                  |           |          |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> alter table star add column description text;
ALTER TABLE
universe=> \d star;
                                             Table "public.star"
+---------------------+-----------------------+-----------+----------+---------------------------------------+
|       Column        |         Type          | Collation | Nullable |                Default                |
+---------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id             | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                | character varying(20) |           | not null |                                       |
| age                 | integer               |           |          |                                       |
| shape               | text                  |           |          |                                       |
| distance_from_earth | integer               |           |          |                                       |
| life_in_it          | bit(1)                |           |          |                                       |
| description         | text                  |           |          |                                       |
+---------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)

universe=> alter table star add column galaxy_id int not null references galaxy(galaxy_id);
ALTER TABLE
universe=> \d star;
                                             Table "public.star"
+---------------------+-----------------------+-----------+----------+---------------------------------------+
|       Column        |         Type          | Collation | Nullable |                Default                |
+---------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id             | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                | character varying(20) |           | not null |                                       |
| age                 | integer               |           |          |                                       |
| shape               | text                  |           |          |                                       |
| distance_from_earth | integer               |           |          |                                       |
| life_in_it          | bit(1)                |           |          |                                       |
| description         | text                  |           |          |                                       |
| galaxy_id           | integer               |           | not null |                                       |
+---------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> alter table star add unique(name);
ALTER TABLE
universe=> \d star;
                                             Table "public.star"
+---------------------+-----------------------+-----------+----------+---------------------------------------+
|       Column        |         Type          | Collation | Nullable |                Default                |
+---------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id             | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                | character varying(20) |           | not null |                                       |
| age                 | integer               |           |          |                                       |
| shape               | text                  |           |          |                                       |
| distance_from_earth | integer               |           |          |                                       |
| life_in_it          | bit(1)                |           |          |                                       |
| description         | text                  |           |          |                                       |
| galaxy_id           | integer               |           | not null |                                       |
+---------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> create table planet(planet_id serial primary key, name varchar(20) unique, age int not null, shape text, distance_from_earth int, life_in_it bit,description text,star_id int references star(star_id));
CREATE TABLE
universe=> \d planet;
                                              Table "public.planet"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id           | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                | character varying(20) |           |          |                                           |
| age                 | integer               |           | not null |                                           |
| shape               | text                  |           |          |                                           |
| distance_from_earth | integer               |           |          |                                           |
| life_in_it          | bit(1)                |           |          |                                           |
| description         | text                  |           |          |                                           |
| star_id             | integer               |           |          |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> create table moon(moon_id serial primary key, name varchar(20) unique, age int not null, shape text, distance_from_earth int, life_in_it bit,description text,pla
net_id int references planet(planet_id));
CREATE TABLE
universe=> \d moon;
                                             Table "public.moon"
+---------------------+-----------------------+-----------+----------+---------------------------------------+
|       Column        |         Type          | Collation | Nullable |                Default                |
+---------------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id             | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name                | character varying(20) |           |          |                                       |
| age                 | integer               |           | not null |                                       |
| shape               | text                  |           |          |                                       |
| distance_from_earth | integer               |           |          |                                       |
| life_in_it          | bit(1)                |           |          |                                       |
| description         | text                  |           |          |                                       |
| planet_id           | integer               |           |          |                                       |
+---------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> \d galaxy;
                                              Table "public.galaxy"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id           | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                | character varying(20) |           | not null |                                           |
| age                 | integer               |           | not null |                                           |
| shape               | text                  |           | not null |                                           |
| distance_from_earth | integer               |           |          |                                           |
| life_in_it          | bit(1)                |           |          |                                           |
| description         | text                  |           |          |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)


universe=> insert into galaxy(name, age, shape, distance_from_earth, life_in_it, description)values('Milky way',13610,'spiral galaxy',1,b'1','This the galaxy that we live i
n');
INSERT 0 1
universe=> select * from galaxy;
+-----------+-----------+-------+---------------+---------------------+------------+---------------------------------+
| galaxy_id |   name    |  age  |     shape     | distance_from_earth | life_in_it |           description           |
+-----------+-----------+-------+---------------+---------------------+------------+---------------------------------+
|         1 | Milky way | 13610 | spiral galaxy |                   1 | 1          | This the galaxy that we live in |
+-----------+-----------+-------+---------------+---------------------+------------+---------------------------------+
(1 row)

                                            ^
universe=> alter table galaxy rename column age to age_in_million_years;
ALTER TABLE
universe=> \d galaxy;
                                               Table "public.galaxy"
+----------------------+-----------------------+-----------+----------+-------------------------------------------+
|        Column        |         Type          | Collation | Nullable |                  Default                  |
+----------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id            | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                 | character varying(20) |           | not null |                                           |
| age_in_million_years | integer               |           | not null |                                           |
| shape                | text                  |           | not null |                                           |
| distance_from_earth  | integer               |           |          |                                           |
| life_in_it           | bit(1)                |           |          |                                           |
| description          | text                  |           |          |                                           |
+----------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> select * from galaxy;
+-----------+-----------+----------------------+---------------+---------------------+------------+---------------------------------+
| galaxy_id |   name    | age_in_million_years |     shape     | distance_from_earth | life_in_it |           description           |
+-----------+-----------+----------------------+---------------+---------------------+------------+---------------------------------+
|         1 | Milky way |                13610 | spiral galaxy |                   1 | 1          | This the galaxy that we live in |
+-----------+-----------+----------------------+---------------+---------------------+------------+---------------------------------+
(1 row)

                                      ^
universe=> update galaxy set description = 'Our galaxy' where galaxy_id=1;
UPDATE 1
universe=> update galaxy set description = 'This is the galaxy where we live in' where galaxy_id=1;
UPDATE 1
universe=> select * from galaxy;
+-----------+-----------+----------------------+---------------+---------------------+------------+-------------------------------------+
| galaxy_id |   name    | age_in_million_years |     shape     | distance_from_earth | life_in_it |             description             |
+-----------+-----------+----------------------+---------------+---------------------+------------+-------------------------------------+
|         1 | Milky way |                13610 | spiral galaxy |                   1 | 1          | This is the galaxy where we live in |
+-----------+-----------+----------------------+---------------+---------------------+------------+-------------------------------------+
(1 row)

universe=> 












universe=> insert into star(star_id, name, age, shape, distance_from_earth, description,galaxy_id, life_in_it)values(3,'Proxima centuari b',4853, 'star',4.4, '4.4 ly away',1,'no');
INSERT 0 1
universe=> select * from star;
+---------+--------------------+------+--------+---------------------+-------------------------+-----------+------------+
| star_id |        name        | age  | shape  | distance_from_earth |       description       | galaxy_id | life_in_it |
+---------+--------------------+------+--------+---------------------+-------------------------+-----------+------------+
|       1 | sun                | 4600 | sphere |               149.6 | 149.6 million kms away  |         1 | f          |
|       2 | Proxima Centauri   | 4600 | star   |                4853 | 4.246 light yearss away |         1 | f          |
|       3 | Proxima centuari b | 4853 | star   |                 4.4 | 4.4 ly away             |         1 | f          |
+---------+--------------------+------+--------+---------------------+-------------------------+-----------+------------+
(3 rows)

universe=> insert into star(star_id, name, age, shape, distance_from_earth, description,galaxy_id, life_in_it)values(4,'Proxima centuari A',4853, 'star',4.4, '4.4 ly away',1,'no');
INSERT 0 1
universe=> insert into star(star_id, name, age, shape, distance_from_earth, description,galaxy_id, life_in_it)values(5,'Barnard's star',10010, 'star',5.94, '5.94 ly away',1,'no');
universe'> 
universe'> insert into star(star_id, name, age, shape, distance_from_earth, description,galaxy_id, life_in_it)values(4,'Barnard star',10010, 'star',5.94, '5.94 ly away',1,'no');
universe'> 
universe'> 
universe=> insert into star(star_id, name, age, shape, distance_from_earth, description,galaxy_id, life_in_it)values(4,'Barnard star',10010, 'star',5.94, '5.94 ly away',1,'no');
ERROR:  duplicate key value violates unique constraint "star_pkey"
DETAIL:  Key (star_id)=(4) already exists.
universe=> select * from star;
+---------+--------------------+------+--------+---------------------+-------------------------+-----------+------------+
| star_id |        name        | age  | shape  | distance_from_earth |       description       | galaxy_id | life_in_it |
+---------+--------------------+------+--------+---------------------+-------------------------+-----------+------------+
|       1 | sun                | 4600 | sphere |               149.6 | 149.6 million kms away  |         1 | f          |
|       2 | Proxima Centauri   | 4600 | star   |                4853 | 4.246 light yearss away |         1 | f          |
|       3 | Proxima centuari b | 4853 | star   |                 4.4 | 4.4 ly away             |         1 | f          |
|       4 | Proxima centuari A | 4853 | star   |                 4.4 | 4.4 ly away             |         1 | f          |
+---------+--------------------+------+--------+---------------------+-------------------------+-----------+------------+
(4 rows)

universe=> insert into star(star_id, name, age, shape, distance_from_earth, description,galaxy_id, life_in_it)values(5,'Barnard star',10010, 'star',5.94, '5.94 ly away',1,'no');
INSERT 0 1
universe=> insert into star(star_id, name, age, shape, distance_from_earth, description,galaxy_id, life_in_it)values(6,'sirius',4600, 'star',230, '230 ly away',1,'no');
INSERT 0 1
universe=> select * from star;
+---------+--------------------+-------+--------+---------------------+-------------------------+-----------+------------+
| star_id |        name        |  age  | shape  | distance_from_earth |       description       | galaxy_id | life_in_it |
+---------+--------------------+-------+--------+---------------------+-------------------------+-----------+------------+
|       1 | sun                |  4600 | sphere |               149.6 | 149.6 million kms away  |         1 | f          |
|       2 | Proxima Centauri   |  4600 | star   |                4853 | 4.246 light yearss away |         1 | f          |
|       3 | Proxima centuari b |  4853 | star   |                 4.4 | 4.4 ly away             |         1 | f          |
|       4 | Proxima centuari A |  4853 | star   |                 4.4 | 4.4 ly away             |         1 | f          |
|       5 | Barnard star       | 10010 | star   |                5.94 | 5.94 ly away            |         1 | f          |
|       6 | sirius             |  4600 | star   |                 230 | 230 ly away             |         1 | f          |
+---------+--------------------+-------+--------+---------------------+-------------------------+-----------+------------+
(6 rows)

universe=> \d planet;
                                              Table "public.planet"
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
|       Column        |         Type          | Collation | Nullable |                  Default                  |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id           | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                | character varying(20) |           |          |                                           |
| age                 | integer               |           | not null |                                           |
| shape               | text                  |           |          |                                           |
| distance_from_earth | numeric               |           |          |                                           |
| description         | text                  |           |          |                                           |
| star_id             | integer               |           |          |                                           |
| life_in_it          | boolean               |           |          |                                           |
+---------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id life_in_it)values('Earth',4540,'sphere',0,'Our planet',1,'yes');
ERROR:  syntax error at or near "life_in_it"
LINE 1: ...ge,shape, distance_from_earth,description,star_id life_in_it...
                                                             ^
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id life_in_it)values('Earth',4540,'sphere',0,'Our planet',1,'yes');
ERROR:  syntax error at or near "life_in_it"
LINE 1: ...ge,shape, distance_from_earth,description,star_id life_in_it...
                                                             ^
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id life_in_it)values('Earth',4540,'sphere',0,'Our planet',1,'true');
ERROR:  syntax error at or near "life_in_it"
LINE 1: ...ge,shape, distance_from_earth,description,star_id life_in_it...
                                                             ^
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id,life_in_it)values('Earth',454
0,'sphere',0,'Our planet',1,'true');
INSERT 0 1
universe=> select * from planet;
+-----------+-------+------+--------+---------------------+-------------+---------+------------+
| planet_id | name  | age  | shape  | distance_from_earth | description | star_id | life_in_it |
+-----------+-------+------+--------+---------------------+-------------+---------+------------+
|         1 | Earth | 4540 | sphere |                   0 | Our planet  |       1 | t          |
+-----------+-------+------+--------+---------------------+-------------+---------+------------+
(1 row)

universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id,life_in_it)values('Mercury',4500,'sphere',77,'77 million kms away',1,'false');
INSERT 0 1
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id,life_in_it)values('venus',450
0,'sphere',41,'41 million kms away',1,'false');
INSERT 0 1
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id,life_in_it)values('venus',460
0,'sphere',56,'56million kms away',1,'true');
ERROR:  duplicate key value violates unique constraint "planet_name_key"
DETAIL:  Key (name)=(venus) already exists.
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id,life_in_it)values('venus',460
0,'sphere',56,'56million kms away',1,'true');
ERROR:  duplicate key value violates unique constraint "planet_name_key"
DETAIL:  Key (name)=(venus) already exists.
universe=> 
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id,life_in_it)values('Mars',4600
,'sphere',56,'56million kms away',1,'true');
INSERT 0 1
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id,life_in_it)values('jupiter',4
500,'oblate sphere',588,'588million kms away',1,'false');
INSERT 0 1
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id,life_in_it)values('Saturn',45
00,'oblate sphere and rings',1200,'1200million kms away',1,'false');
INSERT 0 1
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id,life_in_it)values('Uranus',45
00,'oblate sphere and rings',2600,'2600million kms away',1,'false');
INSERT 0 1
universe=> insert into planet (name,age,shape, distance_from_earth,description,star_id,life_in_it)values('Neptune',4
500,'oblate sphere',4300,'4300million kms away',1,'false');
INSERT 0 1
universe=> select * from planet;
+-----------+---------+------+-------------------------+---------------------+----------------------+---------+------------+
| planet_id |  name   | age  |          shape          | distance_from_earth |     description      | star_id | life_in_it |
+-----------+---------+------+-------------------------+---------------------+----------------------+---------+------------+
|         1 | Earth   | 4540 | sphere                  |                   0 | Our planet           |       1 | t          |
|         2 | Mercury | 4500 | sphere                  |                  77 | 77 million kms away  |       1 | f          |
|         3 | venus   | 4500 | sphere                  |                  41 | 41 million kms away  |       1 | f          |
|         6 | Mars    | 4600 | sphere                  |                  56 | 56million kms away   |       1 | t          |
|         7 | jupiter | 4500 | oblate sphere           |                 588 | 588million kms away  |       1 | f          |
|         8 | Saturn  | 4500 | oblate sphere and rings |                1200 | 1200million kms away |       1 | f          |
|         9 | Uranus  | 4500 | oblate sphere and rings |                2600 | 2600million kms away |       1 | f          |
|        10 | Neptune | 4500 | oblate sphere           |                4300 | 4300million kms away |       1 | f          |
+-----------+---------+------+-------------------------+---------------------+----------------------+---------+------------+
(8 rows)

universe=> update planet set planet_id=4 where name='Mars';
UPDATE 1
universe=> update planet set planet_id=5 where name='jupiter';
UPDATE 1
universe=> update planet set planet_id=6 where name='Saturn';
UPDATE 1
universe=> update planet set planet_id=7 where name='Uranus';
UPDATE 1
universe=> update planet set planet_id=8 where name='Neptune';
UPDATE 1
universe=> select * from planet;
+-----------+---------+------+-------------------------+---------------------+----------------------+---------+------------+
| planet_id |  name   | age  |          shape          | distance_from_earth |     description      | star_id | life_in_it |
+-----------+---------+------+-------------------------+---------------------+----------------------+---------+------------+
|         1 | Earth   | 4540 | sphere                  |                   0 | Our planet           |       1 | t          |
|         2 | Mercury | 4500 | sphere                  |                  77 | 77 million kms away  |       1 | f          |
|         3 | venus   | 4500 | sphere                  |                  41 | 41 million kms away  |       1 | f          |
|         4 | Mars    | 4600 | sphere                  |                  56 | 56million kms away   |       1 | t          |
|         5 | jupiter | 4500 | oblate sphere           |                 588 | 588million kms away  |       1 | f          |
|         6 | Saturn  | 4500 | oblate sphere and rings |                1200 | 1200million kms away |       1 | f          |
|         7 | Uranus  | 4500 | oblate sphere and rings |                2600 | 2600million kms away |       1 | f          |
|         8 | Neptune | 4500 | oblate sphere           |                4300 | 4300million kms away |       1 | f          |
+-----------+---------+------+-------------------------+---------------------+----------------------+---------+------------+
(8 rows)

universe=> select * from star;
+---------+--------------------+-------+--------+---------------------+-------------------------+-----------+------------+
| star_id |        name        |  age  | shape  | distance_from_earth |       description       | galaxy_id | life_in_it |
+---------+--------------------+-------+--------+---------------------+-------------------------+-----------+------------+
|       1 | sun                |  4600 | sphere |               149.6 | 149.6 million kms away  |         1 | f          |
|       2 | Proxima Centauri   |  4600 | star   |                4853 | 4.246 light yearss away |         1 | f          |
|       3 | Proxima centuari b |  4853 | star   |                 4.4 | 4.4 ly away             |         1 | f          |
|       4 | Proxima centuari A |  4853 | star   |                 4.4 | 4.4 ly away             |         1 | f          |
|       5 | Barnard star       | 10010 | star   |                5.94 | 5.94 ly away            |         1 | f          |
|       6 | sirius             |  4600 | star   |                 230 | 230 ly away             |         1 | f          |
+---------+--------------------+-------+--------+---------------------+-------------------------+-----------+------------+
(6 rows)

universe=> insert into planet (planet_id,name,description,star_id)values(7, 'proxima centuari b','super earth type',2);
ERROR:  null value in column "age" violates not-null constraint
DETAIL:  Failing row contains (7, proxima centuari b, null, null, null, super earth type, 2, null).
universe=> insert into planet (planet_id,name,age,description,star_id)values(7, 'proxima centuari b',5000,'super ear
th type',2);
ERROR:  duplicate key value violates unique constraint "planet_pkey"
DETAIL:  Key (planet_id)=(7) already exists.
universe=> select * from planet;
+-----------+---------+------+-------------------------+---------------------+----------------------+---------+------------+
| planet_id |  name   | age  |          shape          | distance_from_earth |     description      | star_id | life_in_it |
+-----------+---------+------+-------------------------+---------------------+----------------------+---------+------------+
|         1 | Earth   | 4540 | sphere                  |                   0 | Our planet           |       1 | t          |
|         2 | Mercury | 4500 | sphere                  |                  77 | 77 million kms away  |       1 | f          |
|         3 | venus   | 4500 | sphere                  |                  41 | 41 million kms away  |       1 | f          |
|         4 | Mars    | 4600 | sphere                  |                  56 | 56million kms away   |       1 | t          |
|         5 | jupiter | 4500 | oblate sphere           |                 588 | 588million kms away  |       1 | f          |
|         6 | Saturn  | 4500 | oblate sphere and rings |                1200 | 1200million kms away |       1 | f          |
|         7 | Uranus  | 4500 | oblate sphere and rings |                2600 | 2600million kms away |       1 | f          |
|         8 | Neptune | 4500 | oblate sphere           |                4300 | 4300million kms away |       1 | f          |
+-----------+---------+------+-------------------------+---------------------+----------------------+---------+------------+
(8 rows)

universe=> insert into planet (planet_id,name,age,description,star_id)values(9, 'proxima centuari b',5000,'super ear
th type',2);
INSERT 0 1
universe=> insert into planet (planet_id,name,age,description,star_id)values(10, 'proxima centuari c',4850,'earth size exoplanet',2);
INSERT 0 1
universe=> insert into planet (planet_id,name,age,description,star_id)values(11, 'proxima centuari d',4850,'details
not known',2);
INSERT 0 1
universe=> select * from planet;
+-----------+--------------------+------+-------------------------+---------------------+----------------------+---------+------------+
| planet_id |        name        | age  |          shape          | distance_from_earth |     description      | star_id | life_in_it |
+-----------+--------------------+------+-------------------------+---------------------+----------------------+---------+------------+
|         1 | Earth              | 4540 | sphere                  |                   0 | Our planet           |       1 | t          |
|         2 | Mercury            | 4500 | sphere                  |                  77 | 77 million kms away  |       1 | f          |
|         3 | venus              | 4500 | sphere                  |                  41 | 41 million kms away  |       1 | f          |
|         4 | Mars               | 4600 | sphere                  |                  56 | 56million kms away   |       1 | t          |
|         5 | jupiter            | 4500 | oblate sphere           |                 588 | 588million kms away  |       1 | f          |
|         6 | Saturn             | 4500 | oblate sphere and rings |                1200 | 1200million kms away |       1 | f          |
|         7 | Uranus             | 4500 | oblate sphere and rings |                2600 | 2600million kms away |       1 | f          |
|         8 | Neptune            | 4500 | oblate sphere           |                4300 | 4300million kms away |       1 | f          |
|         9 | proxima centuari b | 5000 |                         |                     | super earth type     |       2 |            |
|        10 | proxima centuari c | 4850 |                         |                     | earth size exoplanet |       2 |            |
|        11 | proxima centuari d | 4850 |                         |                     | details not known    |       2 |            |
+-----------+--------------------+------+-------------------------+---------------------+----------------------+---------+------------+
(11 rows)

universe=> insert into planet (planet_id,name,age,description,star_id)values(12, 'HD 186302 b',000,'details
not known',5);
INSERT 0 1
universe=> select * from planet;
+-----------+--------------------+------+-------------------------+---------------------+----------------------+---------+------------+
| planet_id |        name        | age  |          shape          | distance_from_earth |     description      | star_id | life_in_it |
+-----------+--------------------+------+-------------------------+---------------------+----------------------+---------+------------+
|         1 | Earth              | 4540 | sphere                  |                   0 | Our planet           |       1 | t          |
|         2 | Mercury            | 4500 | sphere                  |                  77 | 77 million kms away  |       1 | f          |
|         3 | venus              | 4500 | sphere                  |                  41 | 41 million kms away  |       1 | f          |
|         4 | Mars               | 4600 | sphere                  |                  56 | 56million kms away   |       1 | t          |
|         5 | jupiter            | 4500 | oblate sphere           |                 588 | 588million kms away  |       1 | f          |
|         6 | Saturn             | 4500 | oblate sphere and rings |                1200 | 1200million kms away |       1 | f          |
|         7 | Uranus             | 4500 | oblate sphere and rings |                2600 | 2600million kms away |       1 | f          |
|         8 | Neptune            | 4500 | oblate sphere           |                4300 | 4300million kms away |       1 | f          |
|         9 | proxima centuari b | 5000 |                         |                     | super earth type     |       2 |            |
|        10 | proxima centuari c | 4850 |                         |                     | earth size exoplanet |       2 |            |
|        11 | proxima centuari d | 4850 |                         |                     | details not known    |       2 |            |
|        12 | HD 186302 b        |    0 |                         |                     | details not known    |       5 |            |
+-----------+--------------------+------+-------------------------+---------------------+----------------------+---------+------------+
(12 rows)

universe=> insert into moon (name,age,planet_id)values('Our moon',4500,1);
INSERT 0 1
universe=> insert into moon (name,age,planet_id)values('Phobos',4300,3),('Deimos', 4300,3);
INSERT 0 2
universe=> insert into moon (name,age,planet_id)values('IO',4500,5),('Europa', 4500,5),('Ganymede',4500,5),('callisto',4500,5);
INSERT 0 4
universe=> select * from moon;
+---------+----------+------+-------+---------------------+-------------+-----------+------------+
| moon_id |   name   | age  | shape | distance_from_earth | description | planet_id | life_in_it |
+---------+----------+------+-------+---------------------+-------------+-----------+------------+
|       1 | Our moon | 4500 |       |                     |             |         1 |            |
|       2 | Phobos   | 4300 |       |                     |             |         3 |            |
|       3 | Deimos   | 4300 |       |                     |             |         3 |            |
|       4 | IO       | 4500 |       |                     |             |         5 |            |
|       5 | Europa   | 4500 |       |                     |             |         5 |            |
|       6 | Ganymede | 4500 |       |                     |             |         5 |            |
|       7 | callisto | 4500 |       |                     |             |         5 |            |
+---------+----------+------+-------+---------------------+-------------+-----------+------------+
(7 rows)

universe=> insert into moon (name,age,planet_id)values('Titan',4500,6),('Enceladus', 4500,6),('Rhea',4500,6),('Mimas
',4500,6),('Teths',4500,6);
INSERT 0 5
universe=> select * from moon;
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
| moon_id |   name    | age  | shape | distance_from_earth | description | planet_id | life_in_it |
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
|       1 | Our moon  | 4500 |       |                     |             |         1 |            |
|       2 | Phobos    | 4300 |       |                     |             |         3 |            |
|       3 | Deimos    | 4300 |       |                     |             |         3 |            |
|       4 | IO        | 4500 |       |                     |             |         5 |            |
|       5 | Europa    | 4500 |       |                     |             |         5 |            |
|       6 | Ganymede  | 4500 |       |                     |             |         5 |            |
|       7 | callisto  | 4500 |       |                     |             |         5 |            |
|       8 | Titan     | 4500 |       |                     |             |         6 |            |
|       9 | Enceladus | 4500 |       |                     |             |         6 |            |
|      10 | Rhea      | 4500 |       |                     |             |         6 |            |
|      11 | Mimas     | 4500 |       |                     |             |         6 |            |
|      12 | Teths     | 4500 |       |                     |             |         6 |            |
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
(12 rows)

universe=> insert into moon (name,age,planet_id)values('Titania',4500,8),('oberon', 4500,8),('Miranda',4500,8),('Ariel',4500,8);
INSERT 0 4
universe=> select * from moon;
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
| moon_id |   name    | age  | shape | distance_from_earth | description | planet_id | life_in_it |
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
|       1 | Our moon  | 4500 |       |                     |             |         1 |            |
|       2 | Phobos    | 4300 |       |                     |             |         3 |            |
|       3 | Deimos    | 4300 |       |                     |             |         3 |            |
|       4 | IO        | 4500 |       |                     |             |         5 |            |
|       5 | Europa    | 4500 |       |                     |             |         5 |            |
|       6 | Ganymede  | 4500 |       |                     |             |         5 |            |
|       7 | callisto  | 4500 |       |                     |             |         5 |            |
|       8 | Titan     | 4500 |       |                     |             |         6 |            |
|       9 | Enceladus | 4500 |       |                     |             |         6 |            |
|      10 | Rhea      | 4500 |       |                     |             |         6 |            |
|      11 | Mimas     | 4500 |       |                     |             |         6 |            |
|      12 | Teths     | 4500 |       |                     |             |         6 |            |
|      13 | Titania   | 4500 |       |                     |             |         8 |            |
|      14 | oberon    | 4500 |       |                     |             |         8 |            |
|      15 | Miranda   | 4500 |       |                     |             |         8 |            |
|      16 | Ariel     | 4500 |       |                     |             |         8 |            |
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
(16 rows)

universe=> update moon set planet id=7 where moon_id=13,14,15,16;
ERROR:  syntax error at or near "id"
LINE 1: update moon set planet id=7 where moon_id=13,14,15,16;
                               ^
universe=> update moon set planet_id=7 where moon_id=13,14,15,16;
ERROR:  syntax error at or near ","
LINE 1: update moon set planet_id=7 where moon_id=13,14,15,16;
                                                    ^
universe=> update moon set planet_id=7 where moon_id=13;
UPDATE 1
universe=> update moon set planet_id=7 where moon_id=14;
UPDATE 1
universe=> update moon set planet_id=7 where moon_id=15;
UPDATE 1
universe=> update moon set planet_id=7 where moon_id=16;
UPDATE 1
universe=> selcet * from moon;
ERROR:  syntax error at or near "selcet"
LINE 1: selcet * from moon;
        ^
universe=> select * from moon;
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
| moon_id |   name    | age  | shape | distance_from_earth | description | planet_id | life_in_it |
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
|       1 | Our moon  | 4500 |       |                     |             |         1 |            |
|       2 | Phobos    | 4300 |       |                     |             |         3 |            |
|       3 | Deimos    | 4300 |       |                     |             |         3 |            |
|       4 | IO        | 4500 |       |                     |             |         5 |            |
|       5 | Europa    | 4500 |       |                     |             |         5 |            |
|       6 | Ganymede  | 4500 |       |                     |             |         5 |            |
|       7 | callisto  | 4500 |       |                     |             |         5 |            |
|       8 | Titan     | 4500 |       |                     |             |         6 |            |
|       9 | Enceladus | 4500 |       |                     |             |         6 |            |
|      10 | Rhea      | 4500 |       |                     |             |         6 |            |
|      11 | Mimas     | 4500 |       |                     |             |         6 |            |
|      12 | Teths     | 4500 |       |                     |             |         6 |            |
|      13 | Titania   | 4500 |       |                     |             |         7 |            |
|      14 | oberon    | 4500 |       |                     |             |         7 |            |
|      15 | Miranda   | 4500 |       |                     |             |         7 |            |
|      16 | Ariel     | 4500 |       |                     |             |         7 |            |
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
(16 rows)

universe=> insert into moon (name,age,planet_id)values('Proteus',4500,8),('Nereid', 4500,8),('Larissa',4500,8),('Triton',4500,8),('Galatea',4500,8);
INSERT 0 5
universe=> select * from moon;
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
| moon_id |   name    | age  | shape | distance_from_earth | description | planet_id | life_in_it |
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
|       1 | Our moon  | 4500 |       |                     |             |         1 |            |
|       2 | Phobos    | 4300 |       |                     |             |         3 |            |
|       3 | Deimos    | 4300 |       |                     |             |         3 |            |
|       4 | IO        | 4500 |       |                     |             |         5 |            |
|       5 | Europa    | 4500 |       |                     |             |         5 |            |
|       6 | Ganymede  | 4500 |       |                     |             |         5 |            |
|       7 | callisto  | 4500 |       |                     |             |         5 |            |
|       8 | Titan     | 4500 |       |                     |             |         6 |            |
|       9 | Enceladus | 4500 |       |                     |             |         6 |            |
|      10 | Rhea      | 4500 |       |                     |             |         6 |            |
|      11 | Mimas     | 4500 |       |                     |             |         6 |            |
|      12 | Teths     | 4500 |       |                     |             |         6 |            |
|      13 | Titania   | 4500 |       |                     |             |         7 |            |
|      14 | oberon    | 4500 |       |                     |             |         7 |            |
|      15 | Miranda   | 4500 |       |                     |             |         7 |            |
|      16 | Ariel     | 4500 |       |                     |             |         7 |            |
|      17 | Proteus   | 4500 |       |                     |             |         8 |            |
|      18 | Nereid    | 4500 |       |                     |             |         8 |            |
|      19 | Larissa   | 4500 |       |                     |             |         8 |            |
|      20 | Triton    | 4500 |       |                     |             |         8 |            |
|      21 | Galatea   | 4500 |       |                     |             |         8 |            |
+---------+-----------+------+-------+---------------------+-------------+-----------+------------+
(21 rows)

universe=> create table continents(Continent_id serial primary key, name varchar(20) unique, planet_id int references planet(planet_id);
universe(> 
universe(> 
universe=> 
universe=> \d universe
Did not find any relation named "universe".
universe=> \d universe;
Did not find any relation named "universe".
universe=> create table continents(continent_id serial primary key, name varchar(20));
CREATE TABLE
universe=> insert into continents(name) values('Africa','asia','european','north america','antartica','Australia','S
outh america');
ERROR:  INSERT has more expressions than target columns
LINE 1: insert into continents(name) values('Africa','asia','europea...
                                                     ^
universe=> insert into continents(name) values('Africa');
INSERT 0 1
universe=> insert into continents(name) values('Asia');
INSERT 0 1
universe=> insert into continents(name) values('europe');
INSERT 0 1
universe=> insert into continents(name) values('australia');
INSERT 0 1
universe=> insert into continents(name) values('australia');
INSERT 0 1
universe=> insert into continents(name) values('antartica');
INSERT 0 1
universe=> insert into continents(name) values('south america');
INSERT 0 1
universe=> select * from continents;
+--------------+---------------+
| continent_id |     name      |
+--------------+---------------+
|            1 | Africa        |
|            2 | Asia          |
|            3 | europe        |
|            4 | australia     |
|            5 | australia     |
|            6 | antartica     |
|            7 | south america |
+--------------+---------------+
(7 rows)

universe=> update continents set name='north america' where continent_id=5;
UPDATE 1
universe=> alter table continents alter column name type varchar(20) unique not null;
ERROR:  syntax error at or near "unique"
LINE 1: ...ble continents alter column name type varchar(20) unique not...
                                                             ^
universe=> alter table continents alter column name type varchar(20) unique;
ERROR:  syntax error at or near "unique"
LINE 1: ... table continents alter column name type varchar(20) unique;
                                                                ^
universe=> alter table continents alter column name type varchar(20) unique
universe-> drop table continents where;
ERROR:  syntax error at or near "unique"
LINE 1: ...r table continents alter column name type varchar(20) unique
                                                                 ^
universe=> drop continents where name;
ERROR:  syntax error at or near "continents"
LINE 1: drop continents where name;
             ^
universe=> drop table continents;
DROP TABLE
universe=> 
universe=> create table continents(id serial primary key, name varchar(20) unique, planet_id int references planet(planet_id,wealth varchar(10) not null);
universe(> 
universe(> 
universe(> 
universe=> 
universe=> 
universe=> create table continents(id serial primary key, name varchar(20) unique, capital varchar(20) not null;
universe(> 
universe(> 
universe(> 
universe(> 
universe=> 
universe=> 
universe=> 
universe=> 
universe=> 
universe=> create table continents(id serial primary key, name varchar(20) unique);
CREATE TABLE
universe=> alter table continents add column capital varchar(20) not null;
ALTER TABLE
universe=> alter table continents add column planet_id int references planet(planet_id);
ALTER TABLE
universe=> alter table continents rename column id as continents_id;
ERROR:  syntax error at or near "as"
LINE 1: alter table continents rename column id as continents_id;
                                                ^
universe=> alter table continents rename column id to continents_id;
ALTER TABLE
universe=> \d continents;
                                        Table "public.continents"
+---------------+-----------------------+-----------+----------+----------------------------------------+
|    Column     |         Type          | Collation | Nullable |                Default                 |
+---------------+-----------------------+-----------+----------+----------------------------------------+
| continents_id | integer               |           | not null | nextval('continents_id_seq'::regclass) |
| name          | character varying(20) |           |          |                                        |
| capital       | character varying(20) |           | not null |                                        |
| planet_id     | integer               |           |          |                                        |
+---------------+-----------------------+-----------+----------+----------------------------------------+
Indexes:
    "continents_pkey" PRIMARY KEY, btree (continents_id)
    "continents_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "continents_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> insert into continents(name,capital,planet_id) values('Africa','capetown',1);
INSERT 0 1
universe=> insert into continents(name,capital,planet_id) values('Asia','Beijing',1);
INSERT 0 1
universe=> insert into continents(name,capital,planet_id) values('europe','paris',1);
INSERT 0 1
universe=> insert into continents(name,capital,planet_id) values('north america','newyork',1);
INSERT 0 1
universe=> insert into continents(name,capital,planet_id) values('south america','rio di jenario',1);
INSERT 0 1
universe=> insert into continents(name,capital,planet_id) values('australia','sydney',1);
INSERT 0 1
universe=> insert into continents(name,capital,planet_id) values('antartica','antartica',1);
INSERT 0 1
universe=> select * from continents;
+---------------+---------------+----------------+-----------+
| continents_id |     name      |    capital     | planet_id |
+---------------+---------------+----------------+-----------+
|             1 | Africa        | capetown       |         1 |
|             2 | Asia          | Beijing        |         1 |
|             3 | europe        | paris          |         1 |
|             4 | north america | newyork        |         1 |
|             5 | south america | rio di jenario |         1 |
|             6 | australia     | sydney         |         1 |
|             7 | antartica     | antartica      |         1 |
+---------------+---------------+----------------+-----------+
(7 rows)


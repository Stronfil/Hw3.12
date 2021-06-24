drop table if exists users;
create table users
(
    id       serial,
    login    varchar(50) DEFAULT NULL,
    password varchar(68) DEFAULT NULL,
    PRIMARY KEY (id)
);

insert into users (login, password)
values ('user', '$2y$12$mO.X16/LtQ.b5Qj6ClK9peW6WoeM3iQYfeQw/qMA9frkhrLcMJvT6'),
       ('admin', '$2y$12$mO.X16/LtQ.b5Qj6ClK9peW6WoeM3iQYfeQw/qMA9frkhrLcMJvT6');

drop table if exists roles;
create table roles
(
    id   serial,
    name varchar(50) DEFAULT NULL,
    PRIMARY KEY (id)
);

insert into roles (name)
VALUES ('ROLE_USER'),
       ('ROLE_ADMIN');

drop table if exists user_role;
create table user_role
(
    user_id integer not null references users (id),
    role_id integer not null references roles (id),
    primary key (user_id, role_id)
);

insert into user_role (user_id, role_id)
values (1, 1),
       (2, 1),
       (2, 2);

drop table if exists product;
create table product
(
    id    serial,
    title character varying(155) NOT NULL,
    cost  money                  NOT NULL,
    primary key (id)
);

insert into product (title, cost)
values ('product 1', 1),
       ('product 2', 2),
       ('product 3', 3),
       ('product 4', 4),
       ('product 5', 5),
       ('product 6', 6),
       ('product 7', 7),
       ('product 8', 8),
       ('product 9', 9),
       ('product 10', 10),
       ('product 11', 11),
       ('product 12', 12),
       ('product 13', 13),
       ('product 14', 14),
       ('product 15', 15),
       ('product 16', 16),
       ('product 17', 17),
       ('product 18', 18),
       ('product 19', 19),
       ('product 20', 20);

drop table if exists shop_order;
create table shop_order
(
    id      serial,
    user_id integer references users (id) not null,
    status  varchar(50) default 'NEW_ORDER',
    primary key (id)
);

drop table if exists order_item;
create table order_item
(
    id            serial,
    shop_order_id integer references shop_order (id) not null,
    product_id    integer references product (id)    not null,
    quantity      integer default 1,
    primary key (id, shop_order_id, product_id)
);
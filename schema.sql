DROP TABLE IF EXISTS elements;
DROP TABLE IF EXISTS inventory_parts;
DROP TABLE IF EXISTS parts;
DROP TABLE IF EXISTS colors;
DROP TABLE IF EXISTS parts_category;
DROP TABLE IF EXISTS inventory_minifigs;
DROP TABLE IF EXISTS minifigs;
DROP TABLE IF EXISTS inventory_sets;
DROP TABLE IF EXISTS inventories;
DROP TABLE IF EXISTS sets;
DROP TABLE IF EXISTS themes;


CREATE TABLE inventories (
    inventory_id int PRIMARY KEY,
    version int NOT NULL,
    set_num varchar NOT NULL
);

CREATE TABLE inventory_sets (
    inventory_id int NOT NULL,
    set_num varchar NOT NULL,
    quantity int,
	PRIMARY KEY (inventory_id, set_num)
);

CREATE TABLE sets (
    set_num varchar PRIMARY KEY,
    name varchar NOT NULL,
    theme_id int NOT NULL,
    num_parts int NOT NULL,
    rating float,
    reviewCount int
);

CREATE TABLE themes (
    theme_id int PRIMARY KEY,
    parent_id int,
    theme_name varchar NOT NULL
);

CREATE TABLE inventory_minifigs (
    inventory_id int NOT NULL,
    fig_num varchar NOT NULL,
    quantity int NOT NULL,
	PRIMARY KEY (inventory_id, fig_num)
);

CREATE TABLE minifigs (
    fig_num varchar PRIMARY KEY,
    name varchar NOT NULL,
    num_parts int NOT NULL DEFAULT 1
);

CREATE TABLE inventory_parts (
    inventory_id int NOT NULL,
    part_num varchar NOT NULL,
    color_id int NOT NULL,
    quantity int NOT NULL,
    is_spare int NOT NULL,
	PRIMARY KEY (inventory_id, part_num, color_id)
);

CREATE TABLE parts (
    part_num varchar PRIMARY KEY,
    name varchar NOT NULL,
    part_cat_id int NOT NULL
);

CREATE TABLE colors (
    color_id int PRIMARY KEY,
    name varchar NOT NULL,
    rgb varchar NOT NULL,
    is_trans bool NOT NULL DEFAULT FALSE
);

CREATE TABLE parts_category (
    part_cat_id int PRIMARY KEY,
    part_name varchar NOT NULL
);

CREATE TABLE elements (
	element_id varchar PRIMARY KEY,
	part_num varchar NOT NULL,
	color_id int NOT NULL
);


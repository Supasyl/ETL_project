DROP TABLE IF EXISTS Elements;
DROP TABLE IF EXISTS Inventory_parts;
DROP TABLE IF EXISTS Parts;
DROP TABLE IF EXISTS Colors;
DROP TABLE IF EXISTS Parts_category;
DROP TABLE IF EXISTS Inventory_minifigs;
DROP TABLE IF EXISTS Minifigs;
DROP TABLE IF EXISTS Inventory_sets;
DROP TABLE IF EXISTS Inventories;
DROP TABLE IF EXISTS Sets;
DROP TABLE IF EXISTS Themes;


CREATE TABLE Inventories (
    inventory_id int PRIMARY KEY,
    version int NOT NULL,
    set_num varchar NOT NULL
);

CREATE TABLE Inventory_sets (
    inventory_id int NOT NULL,
    set_num varchar NOT NULL,
	PRIMARY KEY (inventory_id, set_num)
);

CREATE TABLE Sets (
    set_num varchar PRIMARY KEY,
    name varchar NOT NULL,
    theme_id int NOT NULL,
    num_parts int NOT NULL,
	num_figs int NOT NULL DEFAULT 0
);

CREATE TABLE Themes (
    theme_id int PRIMARY KEY,
    theme varchar NOT NULL
);

CREATE TABLE Inventory_minifigs (
    inventory_id int NOT NULL,
    fig_num varchar NOT NULL,
	PRIMARY KEY (inventory_id, fig_num)
);

CREATE TABLE Minifigs (
    fig_num varchar PRIMARY KEY,
    name varchar NOT NULL,
    num_parts int NOT NULL DEFAULT 1
);

CREATE TABLE Inventory_parts (
    inventory_id int NOT NULL,
    part_num varchar NOT NULL,
    color_id int NOT NULL,
	PRIMARY KEY (inventory_id, part_num, color_id)
);

CREATE TABLE Parts (
    part_num varchar PRIMARY KEY,
    name varchar NOT NULL,
    category_id int NOT NULL
);

CREATE TABLE Colors (
    color_id int PRIMARY KEY,
    name varchar NOT NULL,
    rgb varchar NOT NULL,
    is_trans bool NOT NULL DEFAULT FALSE
);

CREATE TABLE Parts_category (
    category_id int PRIMARY KEY,
    category varchar NOT NULL
);

CREATE TABLE Elements (
	element_id varchar PRIMARY KEY,
	part_num varchar NOT NULL,
	color_id int NOT NULL
);



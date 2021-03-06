DROP TABLE IF EXISTS elements;
DROP TABLE IF EXISTS inventory_parts;
DROP TABLE IF EXISTS parts;
DROP TABLE IF EXISTS colors;
DROP TABLE IF EXISTS inventory_minifigs;
DROP TABLE IF EXISTS minifigs;
DROP TABLE IF EXISTS inventory_sets;
DROP TABLE IF EXISTS inventories;
DROP TABLE IF EXISTS sets;
DROP TABLE IF EXISTS themes;


CREATE TABLE inventories (
    inventory_id int NOT NULL,
    version int NOT NULL,
    set_num varchar NOT NULL,
    CONSTRAINT pk_inventories PRIMARY KEY (
        inventory_id
     )
);

CREATE TABLE inventory_sets (
    inventory_id int NOT NULL,
    set_num varchar NOT NULL,
    quantity int DEFAULT 1,
    CONSTRAINT pk_inventory_sets PRIMARY KEY (
        inventory_id,set_num
     )
);

CREATE TABLE sets (
    set_num varchar NOT NULL,
    name varchar NOT NULL,
    theme_id int NOT NULL,
    num_parts int NOT NULL,
    rating float,
    review_count int,
    CONSTRAINT pk_sets PRIMARY KEY (
        set_num
     )
);

CREATE TABLE themes (
    theme_id int NOT NULL,
    theme_name varchar NOT NULL,
    parent_id int,
    CONSTRAINT pk_themes PRIMARY KEY (
        theme_id
    )
);

CREATE TABLE inventory_minifigs (
    inventory_id int NOT NULL,
    fig_num varchar NOT NULL,
    quantity int DEFAULT 1,
    CONSTRAINT pk_inventory_minifigs PRIMARY KEY (
        inventory_id,fig_num
     )
);

CREATE TABLE minifigs (
    fig_num varchar NOT NULL,
    name varchar NOT NULL,
    num_parts int NOT NULL,
    CONSTRAINT pk_minifigs PRIMARY KEY (
        fig_num
     )
);

CREATE TABLE inventory_parts (
    index int NOT NULL,
    inventory_id int NOT NULL,
    part_num varchar NOT NULL,
    color_id int NOT NULL,
    quantity int DEFAULT 1,
    is_spare boolean NOT NULL,
    CONSTRAINT pk_inventory_parts PRIMARY KEY (
        index
     )
);

CREATE TABLE parts (
    part_num varchar NOT NULL,
    name varchar NOT NULL,
    CONSTRAINT pk_parts PRIMARY KEY (
        part_num
     )
);

CREATE TABLE colors (
    color_id int NOT NULL,
    name varchar NOT NULL,
    rgb varchar NOT NULL,
    is_trans boolean NOT NULL,
    CONSTRAINT pk_colors PRIMARY KEY (
        color_id
     )
);



CREATE TABLE elements(
    element_id varchar NOT NULL,
    part_num varchar NOT NULL,
    color_id int NOT NULL, 
    CONSTRAINT pk_elements PRIMARY KEY (
        element_id
     )
);



ALTER TABLE inventories ADD CONSTRAINT fk_inventories_set_num FOREIGN KEY(set_num)
REFERENCES sets (set_num);

ALTER TABLE inventory_sets ADD CONSTRAINT fk_inventory_sets_inventory_id FOREIGN KEY(inventory_id)
REFERENCES inventories (inventory_id);

ALTER TABLE inventory_sets ADD CONSTRAINT fk_inventory_sets_set_num FOREIGN KEY(set_num)
REFERENCES sets (set_num);

ALTER TABLE sets ADD CONSTRAINT fk_sets_theme_id FOREIGN KEY(theme_id)
REFERENCES themes (theme_id);

ALTER TABLE inventory_minifigs ADD CONSTRAINT fk_inventory_minifigs_inventory_id FOREIGN KEY(inventory_id)
REFERENCES inventories (inventory_id);

ALTER TABLE inventory_minifigs ADD CONSTRAINT fk_inventory_minifigs_fig_num FOREIGN KEY(fig_num)
REFERENCES minifigs (fig_num);

ALTER TABLE inventory_parts ADD CONSTRAINT fk_inventory_parts_inventory_id FOREIGN KEY(inventory_id)
REFERENCES inventories (inventory_id);

ALTER TABLE inventory_parts ADD CONSTRAINT fk_inventory_parts_part_num FOREIGN KEY(part_num)
REFERENCES parts (part_num);

ALTER TABLE inventory_parts ADD CONSTRAINT fk_inventory_parts_color_id FOREIGN KEY(color_id)
REFERENCES colors (color_id);

ALTER TABLE elements ADD CONSTRAINT fk_elements_part_num FOREIGN KEY(part_num)
REFERENCES parts (part_num);

ALTER TABLE elements ADD CONSTRAINT fk_elements_color_id FOREIGN KEY(color_id)
REFERENCES colors (color_id);





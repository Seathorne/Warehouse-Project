/* Create table that contains persistent enemy attributes */
CREATE TABLE Enemies
(
  enemy_id INT PRIMARY KEY,
  max_hp INT,
  attack INT,
  defense INT,
  location VARCHAR(30) NOT NULL
);

/* Create table where roles can be enumerated/defined */
CREATE TABLE Battle_Roles
(
  role_id INT PRIMARY KEY,
  role_name VARCHAR(30) -- 'Boss', 'Training', etc.
);

/* Create junction table that ties together Enemy and Battle_Roles */
CREATE TABLE Enemy_Roles
(
  enemy_id INT,
  role_id INT,
  FOREIGN KEY (enemy_id) REFERENCES Enemies(enemy_id),
  FOREIGN KEY (role_id) REFERENCES Battle_Roles(role_id),
  UNIQUE (enemy_id, role_id)
);

/* Add example data to table */
INSERT INTO Enemies (enemy_id, max_hp, attack, defense, location)
VALUES (119, 5, 1, 0, 'Rogueport'); -- Lord Crump (Tattle #119)

INSERT INTO Enemy_Roles (enemy_id, role_id)
VALUES (119, 'Boss'),     -- Give Crump the battle role of 'Boss'
       (119, 'Training'); -- and 'Training'
/* End add-data */


/* Useful commands for altering existing tables: */
-- Alter existing table to add a constraint ^^
ALTER TABLE Enemy_Roles
ADD CONSTRAINT uq_enemy_role UNIQUE (enemy_id, role_id);

-- To remove constraint from tablle:
ALTER TABLE Enemy_Roles
DROP CONSTRAINT uq_enemy_role;

-- If SQLite or other DBMS does not support 'ALTER TABLE DROP CONSTRAINT':
CREATE TABLE copy_Enemy_Roles
(
  enemy_id INT,
  role_id INT,
  FOREIGN KEY (enemy_id) REFERENCES Enemies(enemy_id),
  FOREIGN KEY (role_id) REFERENCES Battle_Roles(role_id),
  CONSTRAINT uq_enemy_role UNIQUE (enemy_id, role_id)
);
INSERT INTO copy_Enemy_Roles (enemy_id, role_id)
   SELECT enemy_id, role_id FROM Enemy_Roles;
DROP TABLE Enemy_Roles;
ALTER TABLE copy_Enemy_Roles RENAME TO Enemy_Roles;
/* End alter existing table */

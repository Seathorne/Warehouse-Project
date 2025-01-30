CREATE TABLE Characters (
  char_id INT PRIMARY KEY UNIQUE,
  name VARCHAR(24) UNIQUE NOT NULL,
  height DECIMAL (3.2), -- inches
  weight DECIMAL (3.2), -- pounds
  knockback DECIMAL (2.2), -- multiplier
  run_speed DECIMAL (2.4) DEFAULT 0, -- in/s
  walk_speed DECIMAL (2.4) DEFAULT 0
-- JOIN TABLES
  -- Character_Alts
  -- Character_Colors
  -- Character_Hitboxes
  -- Character_Attacks
);

INSERT INTO Characters (char_id, name, height, weight, knockback)
VALUES (1, 'Mario', 67, 182, 1),
       (2, 'Donkey Kong', 79, 265, 0.8);

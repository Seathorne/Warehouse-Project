DROP TABLE IF EXISTS tcgpBattle;

CREATE TABLE IF NOT EXISTS tcgpBattle
(
  battle_uid INTEGER PRIMARY KEY,
  battle_name TINYTEXT
);

INSERT INTO tcgpBattle (battle_uid, battle_name)
VALUES (0, 'Uninitialized Battle'),
       (1, 'Yanmega ex VS. Mewtwo ex');

/**********************************************************/

DROP TABLE IF EXISTS tcgpCard;

CREATE TABLE IF NOT EXISTS tcgpCard
(
  card_name TINYTEXT,
  card_uid  INTEGER AUTO_INCREMENT PRIMARY KEY
);

-- Insert cards:
INSERT INTO tcgpCard (card_name)
VALUES ('Duskull'),
       ('Snivy'),
       ('Mewtwo ex'),
       ('Regigigas'),
       ('Professor''s Research'),
       ('Servine'),
       ('Yanma'),
       ('Roserade'),
       ('Roselia'),
       ('Rocky Helmet'),
       ('Flabebe'),
       ('Serperior'),
       ('Potion'),
       ('Potion'),
       ('Poke Ball'),
       ('Combee'),
       ('Chatot'),
       ('Bellossom'),
       ('Vespiquen'),
       ('X Speed'),
       ('Gloom'),
       ('Red Card'),
       ('Yanmega ex'),
       ('Cresselia');

SELECT * FROM tcgpCard;
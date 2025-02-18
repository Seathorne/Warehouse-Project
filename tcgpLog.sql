DROP TABLE IF EXISTS tcgpLog;

-- Each entry in the log is a single action in battle.
CREATE TABLE IF NOT EXISTS tcgpLog
(
  action_id   INTEGER PRIMARY KEY AUTO_INCREMENT,
  battle_id   INTEGER NOT NULL DEFAULT 0,
  player_turn BOOLEAN        NOT NULL,
  description TEXT,
  card_uid    VARCHAR(8) UNIQUE, /* e.g. TEF/105  */
  card_name   TINYTEXT,
  FOREIGN KEY (battle_id) REFERENCES tcgpBattle (battle_uid)
);

INSERT INTO tcgpLog (player_turn, description, card_name)
VALUES (0, 'Put in the Active Spot', 'Duskull'),
       (1, 'Put in the Active Spot', 'Snivy'),
       (0, 'Drew a card', NULL),
       (0, 'Put on the Bench', 'Mewtwo ex'),
       (0, 'Put on the Bench', 'Regigigas'),
       (0, 'Ended their turn', NULL),
       (1, 'Drew a card', NULL),
       (1, 'Put into their hand', 'Professor''s Research'),
       (1, 'Used', 'Professors'' Research'),
       (1, 'Put into their hand', 'Servine'),
       (1, 'Put into their hand', 'Yanma'),
       (1, 'Discarded', 'Professor''s Research'),
       (1, 'Put on the Bench', 'Yanma'),
       (1, 'An energy was attached (Leaf x1)', 'Snivy'),
       (1, 'Ended their turn', NULL);

UPDATE tcgpLog
SET battle_id = 1
WHERE action_id > 0
  AND battle_id != 0;

SELECT *
FROM tcgpLog;
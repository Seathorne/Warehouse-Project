DROP TABLE tcgPokeDex;

CREATE TABLE tcgPokeDex (
  Number INTEGER PRIMARY KEY NOT NULL,
  Name,
  Description TEXT(50) NULL,
  Type1 TEXT(10),
  Type2 TEXT(10),
  Generation INTEGER,
  Region TEXT(20)
);

INSERT INTO tcgPokeDex
SELECT PokeNumber, CardName, NULL, Type, DeltaType, NULL, NULL
FROM tcgCards2;

SELECT * FROM tcgPokeDex;

SELECT D.Number, D.Name, D.Description, Type1, Type2
FROM tcgPokeDex D
  JOIN tcgCards2 T ON D.Number = T.PokeNumber;
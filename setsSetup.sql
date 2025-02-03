/* LIST of sets:
    1. Base
    2. Jungle
    3. Wizards of the Coast Promos
    4. Fossil
    5. Base 2
    6. Team Rocket
    7. Gym Heroes
    8. Gym Challenge
    9. Topps Series 1
    10. Topps Series 2
    11. Topps Series 3
    12. Neo Genesis
    13. Neo Discovery
    14. Southern Islands
    15. Neo Revelation
    16. Neo Destiny
    17. Legendary Collection
    18. Expedition
    19. Best of Game
    20. Aquapolis
    21. Skyridge
    22. EX Ruby & Sapphire
    23. EX Sandstorm
    24. EX Dragon
    25. EX Team Magma vs Team Aqua
    26. EX Hidden Legends
    27. EX FireRed & LeafGreen
    28. EX Team Rocket Returns
    29. EX Deoxys
    30. EX Emerald
    31. EX Unseen Forces
    32. EX Unseen Forces Unown Collection
    33. EX Delta Species
    34. EX Legend Maker
    35. EX Holon Phantoms
    36. EX Crystal Guardians
    37. EX Dragon Frontiers
    38. EX Power Keepers
    39. Diamond & Pearl
    40. DP Black Star Promos
    41. Mysterious Treasures
    42. Secret Wonders
    43. Great Encounters
    44. Majestic Dawn
    45. Legends Awakened
    46. Stormfront
    47. Nintendo Promos
    48. POP Series 1
    49. POP Series 2
    50. POP Series 3
    51. POP Series 4
    52. POP Series 5
    53. POP Series 6
    54. POP Series 7
    55. POP Series 8
    56. POP Series 9
    57. Platinum
    58. Platinum - Rising Rivals
    59. Platinum - Supreme Victors
    60. Platinum - Arceus
    61. Pokémon Rumble
    62. HeartGold SoulSilver
    63. HeartGold SoulSilver Promos
    64. HS Unleashed
    65. HS Undaunted
    66. HS Triumphant
    67. Call of Legends
    68. Black & White Promos
    69. McDonald's Collection (2011)
    70. McDonald's Collection (2012)
    71. McDonald's Collection (2013)
    72. Black & White
    73. Emerging Powers
    74. Noble Victories
    75. Next Destinies
    76. Dark Explorers
    77. Dragons Exalted
    78. Dragon Vault
    79. Boundaries Crossed
    80. Plasma Storm
    81. Plasma Freeze
    82. Plasma Blast
    83. Legendary Treasures
    84. Radiant Collection
    85. XY
    86. XY Promos
    87. Kalos Starter
    88. XY Flashfire
    89. McDonald's Collection (2014)
    90. Furious Fists
    91. Phantom Forces
    92. Primal Clash
    93. Double Crisis
    94. Roaring Skies
    95. Ancient Origins
    96. XY BREAKthrough
    97. McDonald's Collection (2015)
    98. BREAKPoint
    99. Generations
    100. Fates Collide
    101. Steam Siege
    102. McDonald's Collection (2016)
    103. Evolutions
    104. Sun & Moon
    105. Sun & Moon Promos
    106. Guardians Rising
    107. McDonald's Collection (2017)
    108. Burning Shadows
    109. Shining Legends
    110. Crimson Invasion
    111. Ultra Prism
    112. Forbidden Light
    113. Celestial Storm
    114. Dragon Majesty
    115. McDonald's Collection (2018)
    116. Lost Thunder
    117. Team Up
    118. Detective Pikachu
    119. Unbroken Bonds
    120. Unified Minds
    121. Hidden Fates
    122. McDonald's Collection (2019)
    123. McDonald's Collection (2019 FR)
    124. Cosmic Eclipse
    125. Sword & Shield Promos
    126. Sword & Shield
    127. Rebel Clash
    128. Darkness Ablaze
    129. Pokémon Futsal Promos
    130. Champion's Path
    131. Vivid Voltage
    132. McDonald's 25th Anniversary
    133. Shining Fates
    134. Battle Styles
    135. Chilling Reign
    136. Evolving Skies
    137. Celebrations
    138. Fusion Strike
    139. Brilliant Stars - Trainer Gallery
    140. Brilliant Stars
    141. Astral Radiance - Trainer Gallery
    142. Astral Radiance
    143. Pokémon Go
    144. McDonald's Match Battle
    145. Trick or Trade
    146. Holiday Calendar 2022
    147. Lost Origin - Trainer Gallery
    148. Lost Origin
    149. Silver Tempest
    150. Silver Tempest - Trainer Gallery
    151. Crown Zenith - Galarian Gallery
    152. Crown Zenith
    153. Scarlet & Violet Promos
    154. Scarlet & Violet
    155. Scarlet & Violet Energies
    156. Paldea Evolved
    157. Obsidian Flames
    158. McDonald's Match Battle 2023
    159. Holiday Calendar 2023
    160. Trick or Trade 2023
    161. Scarlet & Violet - 151
    162. Paradox Rift
    163. Paldean Fates
    164. Temporal Forces
    165. Twilight Masquerade
    166. Shrouded Fable
    167. Trick or Trade 2024
    168. Stellar Crown
    169. Holiday Calendar 2024
    170. Surging Sparks
    171. Prismatic Evolutions
    172. McDonald's Dragon Discovery

    Total sets counted: 172

 */

/* Create new sets table */
CREATE TABLE IF NOT EXISTS fullSets (
  SetId INTEGER PRIMARY KEY NOT NULL,
  SetName TEXT(35),
  SetLength INTEGER,
  HiddenLength INTEGER,
  CardCount INTEGER,
  SetSymbol TEXT(30),
  ReleaseYear TEXT(4)
);

/* Insert all set IDs scraped values
   from https://www.pokellector.com/sets */
INSERT INTO fullSets (SetId, SetName)
VALUES ('1', 'Base'),
       ('2', 'Jungle'),
       ('3', 'Wizards of the Coast Promos'),
       ('4', 'Fossil'),
       ('5', 'Base 2'),
       ('6', 'Team Rocket'),
       ('7', 'Gym Heroes'),
       ('8', 'Gym Challenge'),
       ('9', 'Topps Series 1'),
       ('10', 'Topps Series 2'),
       ('11', 'Topps Series 3'),
       ('12', 'Neo Genesis'),
       ('13', 'Neo Discovery'),
       ('14', 'Southern Islands'),
       ('15', 'Neo Revelation'),
       ('16', 'Neo Destiny'),
       ('17', 'Legendary Collection'),
       ('18', 'Expedition'),
       ('19', 'Best of Game'),
       ('20', 'Aquapolis'),
       ('21', 'Skyridge'),
       ('22', 'EX Ruby & Sapphire'),
       ('23', 'EX Sandstorm'),
       ('24', 'EX Dragon'),
       ('25', 'EX Team Magma vs Team Aqua'),
       ('26', 'EX Hidden Legends'),
       ('27', 'EX FireRed & LeafGreen'),
       ('28', 'EX Team Rocket Returns'),
       ('29', 'EX Deoxys'),
       ('30', 'EX Emerald'),
       ('31', 'EX Unseen Forces'),
       ('32', 'EX Unseen Forces Unown Collection'),
       ('33', 'EX Delta Species'),
       ('34', 'EX Legend Maker'),
       ('35', 'EX Holon Phantoms'),
       ('36', 'EX Crystal Guardians'),
       ('37', 'EX Dragon Frontiers'),
       ('38', 'EX Power Keepers'),
       ('39', 'Diamond & Pearl'),
       ('40', 'DP Black Star Promos'),
       ('41', 'Mysterious Treasures'),
       ('42', 'Secret Wonders'),
       ('43', 'Great Encounters'),
       ('44', 'Majestic Dawn'),
       ('45', 'Legends Awakened'),
       ('46', 'Stormfront'),
       ('47', 'Nintendo Promos'),
       ('48', 'POP Series 1'),
       ('49', 'POP Series 2'),
       ('50', 'POP Series 3'),
       ('51', 'POP Series 4'),
       ('52', 'POP Series 5'),
       ('53', 'POP Series 6'),
       ('54', 'POP Series 7'),
       ('55', 'POP Series 8'),
       ('56', 'POP Series 9'),
       ('57', 'Platinum'),
       ('58', 'Platinum - Rising Rivals'),
       ('59', 'Platinum - Supreme Victors'),
       ('60', 'Platinum - Arceus'),
       ('61', 'Pokemon Rumble'),
       ('62', 'HeartGold SoulSilver'),
       ('63', 'HeartGold SoulSilver Promos'),
       ('64', 'HS Unleashed'),
       ('65', 'HS Undaunted'),
       ('66', 'HS Triumphant'),
       ('67', 'Call of Legends'),
       ('68', 'Black & White Promos'),
       ('69', 'McDonald''s Collection (2011)'),
       ('70', 'McDonald''s Collection (2012)'),
       ('71', 'McDonald''s Collection (2013)'),
       ('72', 'Black & White'),
       ('73', 'Emerging Powers'),
       ('74', 'Noble Victories'),
       ('75', 'Next Destinies'),
       ('76', 'Dark Explorers'),
       ('77', 'Dragons Exalted'),
       ('78', 'Dragon Vault'),
       ('79', 'Boundaries Crossed'),
       ('80', 'Plasma Storm'),
       ('81', 'Plasma Freeze'),
       ('82', 'Plasma Blast'),
       ('83', 'Legendary Treasures'),
       ('84', 'Radiant Collection'),
       ('85', 'XY'),
       ('86', 'XY Promos'),
       ('87', 'Kalos Starter'),
       ('88', 'XY Flashfire'),
       ('89', 'McDonald''s Collection (2014)'),
       ('90', 'Furious Fists'),
       ('91', 'Phantom Forces'),
       ('92', 'Primal Clash'),
       ('93', 'Double Crisis'),
       ('94', 'Roaring Skies'),
       ('95', 'Ancient Origins'),
       ('96', 'XY BREAKthrough'),
       ('97', 'McDonald''s Collection (2015)'),
       ('98', 'BREAKPoint'),
       ('99', 'Generations'),
       ('100', 'Fates Collide'),
       ('101', 'Steam Siege'),
       ('102', 'McDonald''s Collection (2016)'),
       ('103', 'Evolutions'),
       ('104', 'Sun & Moon'),
       ('105', 'Sun & Moon Promos'),
       ('106', 'Guardians Rising'),
       ('107', 'McDonald''s Collection (2017)'),
       ('108', 'Burning Shadows'),
       ('109', 'Shining Legends'),
       ('110', 'Crimson Invasion'),
       ('111', 'Ultra Prism'),
       ('112', 'Forbidden Light'),
       ('113', 'Celestial Storm'),
       ('114', 'Dragon Majesty'),
       ('115', 'McDonald''s Collection (2018)'),
       ('116', 'Lost Thunder'),
       ('117', 'Team Up'),
       ('118', 'Detective Pikachu'),
       ('119', 'Unbroken Bonds'),
       ('120', 'Unified Minds'),
       ('121', 'Hidden Fates'),
       ('122', 'McDonald''s Collection (2019)'),
       ('123', 'McDonald''s Collection (2019 FR)'),
       ('124', 'Cosmic Eclipse'),
       ('125', 'Sword & Shield Promos'),
       ('126', 'Sword & Shield'),
       ('127', 'Rebel Clash'),
       ('128', 'Darkness Ablaze'),
       ('129', 'Pokemon Futsal Promos'),
       ('130', 'Champion''s Path'),
       ('131', 'Vivid Voltage'),
       ('132', 'McDonald''s 25th Anniversary'),
       ('133', 'Shining Fates'),
       ('134', 'Battle Styles'),
       ('135', 'Chilling Reign'),
       ('136', 'Evolving Skies'),
       ('137', 'Celebrations'),
       ('138', 'Fusion Strike'),
       ('139', 'Brilliant Stars - Trainer Gallery'),
       ('140', 'Brilliant Stars'),
       ('141', 'Astral Radiance - Trainer Gallery'),
       ('142', 'Astral Radiance'),
       ('143', 'Pokemon Go'),
       ('144', 'McDonald''s Match Battle'),
       ('145', 'Trick or Trade'),
       ('146', 'Holiday Calendar 2022'),
       ('147', 'Lost Origin - Trainer Gallery'),
       ('148', 'Lost Origin'),
       ('149', 'Silver Tempest'),
       ('150', 'Silver Tempest - Trainer Gallery'),
       ('151', 'Crown Zenith - Galarian Gallery'),
       ('152', 'Crown Zenith'),
       ('153', 'Scarlet & Violet Promos'),
       ('154', 'Scarlet & Violet'),
       ('155', 'Scarlet & Violet Energies'),
       ('156', 'Paldea Evolved'),
       ('157', 'Obsidian Flames'),
       ('158', 'McDonald''s Match Battle 2023'),
       ('159', 'Holiday Calendar 2023'),
       ('160', 'Trick or Trade 2023'),
       ('161', 'Scarlet & Violet - 151'),
       ('162', 'Paradox Rift'),
       ('163', 'Paldean Fates'),
       ('164', 'Temporal Forces'),
       ('165', 'Twilight Masquerade'),
       ('166', 'Shrouded Fable'),
       ('167', 'Trick or Trade 2024'),
       ('168', 'Stellar Crown'),
       ('169', 'Holiday Calendar 2024'),
       ('170', 'Surging Sparks'),
       ('171', 'Prismatic Evolutions'),
       ('172', 'McDonald''s Dragon Discovery');

/* Show all sets by name and number */
SELECT SetId, SetName FROM fullSets;
CREATE TABLE Pokemon (
    poke_id INT PRIMARY KEY NOT NULL,
    poke_name VARCHAR(20) UNIQUE NOT NULL,
    poke_desc VARCHAR(30),
    height INT DEFAULT 0,
    weight DECIMAL(3,2),
    style_text TINYTEXT DEFAULT 'Uninitialized Text.'
);

CREATE TABLE Attacks (
    move_id INT PRIMARY KEY NOT NULL,
    move_name VARCHAR(30)
);

CREATE TABLE Sets (
    set_id INT PRIMARY KEY NOT NULL,
    set_name VARCHAR(50)
);

CREATE TABLE Cards (
    card_id INT PRIMARY KEY NOT NULL,
    card_name VARCHAR(40),
    poke_id INT,
    set_id INT,
    set_no INT,
    -- CONSTRAINT uq_set_no UNIQUE (set_id, set_no),
    illustrator VARCHAR(30),
    rarity_class VARCHAR(8), -- Ex. 'Diamond', 'Star'
    rarity_count INT,        --    '1', '2', '3', '4'
    FOREIGN KEY (poke_id)
        REFERENCES Pokemon(poke_id)
        ON DELETE CASCADE    -- if Pokemon ID deleted, delete here too
        ON UPDATE CASCADE,   -- if Pokémon ID updated, update here too
    FOREIGN KEY (set_id)
        REFERENCES Sets(set_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Import Data for Base Sets
INSERT INTO Sets (set_id, set_name) VALUES
(1, 'Base Set'),
(2, 'Jungle'),
(3, 'Fossil'),
(4, 'Base Set 2'),
(5, 'Team Rocket'),
(6, 'Gym Heroes'),
(7, 'Gym Challenge'),
(8, 'Neo Genesis'),
(9, 'Neo Discovery'),
(10, 'Neo Revelation');

-- Import Data for Cards in Base Set
INSERT INTO Cards (card_id, card_name, poke_id, set_id, set_no, illustrator, rarity_class, rarity_count) VALUES
-- Holofoil Rares (Star, 3)
(1, 'Alakazam', 65, 1, 1, 'Ken Sugimori', 'Star', 3),
(2, 'Blastoise', 9, 1, 2, 'Ken Sugimori', 'Star', 3),
(3, 'Chansey', 113, 1, 3, 'Ken Sugimori', 'Star', 3),
(4, 'Charizard', 6, 1, 4, 'Mitsuhiro Arita', 'Star', 3),
(5, 'Clefairy', 35, 1, 5, 'Ken Sugimori', 'Star', 3),
(6, 'Gyarados', 130, 1, 6, 'Mitsuhiro Arita', 'Star', 3),
(7, 'Hitmonchan', 107, 1, 7, 'Ken Sugimori', 'Star', 3),
(8, 'Machamp', 68, 1, 8, 'Ken Sugimori', 'Star', 3),
(9, 'Magneton', 82, 1, 9, 'Keiji Kinebuchi', 'Star', 3),
(10, 'Mewtwo', 150, 1, 10, 'Ken Sugimori', 'Star', 3),
(11, 'Nidoking', 34, 1, 11, 'Ken Sugimori', 'Star', 3),
(12, 'Ninetales', 38, 1, 12, 'Ken Sugimori', 'Star', 3),
(13, 'Poliwrath', 62, 1, 13, 'Ken Sugimori', 'Star', 3),
(14, 'Raichu', 26, 1, 14, 'Ken Sugimori', 'Star', 3),
(15, 'Venusaur', 3, 1, 15, 'Mitsuhiro Arita', 'Star', 3),
(16, 'Zapdos', 145, 1, 16, 'Ken Sugimori', 'Star', 3),

-- Non-Holo Rares (Diamond, 2)
(17, 'Beedrill', 15, 1, 17, 'Ken Sugimori', 'Diamond', 2),
(18, 'Dragonair', 148, 1, 18, 'Mitsuhiro Arita', 'Diamond', 2),
(19, 'Dugtrio', 51, 1, 19, 'Ken Sugimori', 'Diamond', 2),
(20, 'Electabuzz', 125, 1, 20, 'Ken Sugimori', 'Diamond', 2),
(21, 'Electrode', 101, 1, 21, 'Ken Sugimori', 'Diamond', 2),
(22, 'Pidgeotto', 17, 1, 22, 'Ken Sugimori', 'Diamond', 2),
(23, 'Arcanine', 59, 1, 23, 'Ken Sugimori', 'Diamond', 2),
(24, 'Charmeleon', 5, 1, 24, 'Mitsuhiro Arita', 'Diamond', 2),
(25, 'Ivysaur', 2, 1, 25, 'Ken Sugimori', 'Diamond', 2),
(26, 'Wartortle', 8, 1, 26, 'Ken Sugimori', 'Diamond', 2),

-- Uncommons (Circle, 1)
(27, 'Bulbasaur', 1, 1, 27, 'Mitsuhiro Arita', 'Circle', 1),
(28, 'Caterpie', 10, 1, 28, 'Ken Sugimori', 'Circle', 1),
(29, 'Charmander', 4, 1, 29, 'Mitsuhiro Arita', 'Circle', 1),
(30, 'Diglett', 50, 1, 30, 'Keiji Kinebuchi', 'Circle', 1),
(31, 'Doduo', 84, 1, 31, 'Ken Sugimori', 'Circle', 1),
(32, 'Drowzee', 96, 1, 32, 'Ken Sugimori', 'Circle', 1),
(33, 'Gastly', 92, 1, 33, 'Keiji Kinebuchi', 'Circle', 1),
(34, 'Koffing', 109, 1, 34, 'Ken Sugimori', 'Circle', 1),
(35, 'Machop', 66, 1, 35, 'Ken Sugimori', 'Circle', 1),
(36, 'Magikarp', 129, 1, 36, 'Mitsuhiro Arita', 'Circle', 1),
(37, 'Metapod', 11, 1, 37, 'Ken Sugimori', 'Circle', 1),
(38, 'Nidoran ♂', 32, 1, 38, 'Ken Sugimori', 'Circle', 1),
(39, 'Onix', 95, 1, 39, 'Ken Sugimori', 'Circle', 1),
(40, 'Pidgey', 16, 1, 40, 'Ken Sugimori', 'Circle', 1),
(41, 'Pikachu', 25, 1, 41, 'Mitsuhiro Arita', 'Circle', 1),
(42, 'Poliwag', 60, 1, 42, 'Ken Sugimori', 'Circle', 1),
(43, 'Ponyta', 77, 1, 43, 'Ken Sugimori', 'Circle', 1),
(44, 'Rattata', 19, 1, 44, 'Ken Sugimori', 'Circle', 1),
(45, 'Sandshrew', 27, 1, 45, 'Ken Sugimori', 'Circle', 1),
(46, 'Squirtle', 7, 1, 46, 'Mitsuhiro Arita', 'Circle', 1),
(47, 'Starmie', 121, 1, 47, 'Keiji Kinebuchi', 'Circle', 1),
(48, 'Staryu', 120, 1, 48, 'Keiji Kinebuchi', 'Circle', 1),
(49, 'Tangela', 114, 1, 49, 'Ken Sugimori', 'Circle', 1),
(50, 'Voltorb', 100, 1, 50, 'Ken Sugimori', 'Circle', 1),
(51, 'Vulpix', 37, 1, 51, 'Ken Sugimori', 'Circle', 1),
(52, 'Weedle', 13, 1, 52, 'Ken Sugimori', 'Circle', 1),

-- Commons (Black Star, 0)
(53, 'Abra', 63, 1, 53, 'Ken Sugimori', 'Black Star', 0),
(54, 'Farfetch"d', 83, 1, 54, 'Ken Sugimori', 'Black Star', 0),
(55, 'Growlithe', 58, 1, 55, 'Ken Sugimori', 'Black Star', 0),
(56, 'Haunter', 93, 1, 56, 'Keiji Kinebuchi', 'Black Star', 0),
(57, 'Jynx', 124, 1, 57, 'Ken Sugimori', 'Black Star', 0),
(58, 'Kadabra', 64, 1, 58, 'Ken Sugimori', 'Black Star', 0),
(59, 'Kakuna', 14, 1, 59, 'Ken Sugimori', 'Black Star', 0),
(60, 'Machoke', 67, 1, 60, 'Ken Sugimori', 'Black Star', 0),
(61, 'Magmar', 126, 1, 61, 'Ken Sugimori', 'Black Star', 0),
(62, 'Nidoran ♀', 29, 1, 62, 'Ken Sugimori', 'Black Star', 0),
(63, 'Nidorino', 33, 1, 63, 'Ken Sugimori', 'Black Star', 0),
(64, 'Poliwhirl', 61, 1, 64, 'Ken Sugimori', 'Black Star', 0),
(65, 'Porygon', 137, 1, 65, 'Tomoaki Imakuni', 'Black Star', 0),
(66, 'Raticate', 20, 1, 66, 'Ken Sugimori', 'Black Star', 0),
(67, 'Seel', 86, 1, 67, 'Ken Sugimori', 'Black Star', 0),
(68, 'Starmie', 121, 1, 68, 'Keiji Kinebuchi', 'Black Star', 0),
(69, 'Staryu', 120, 1, 69, 'Keiji Kinebuchi', 'Black Star', 0),

-- Trainer Cards (No Pokémon ID reference needed, set as NULL)
(70, 'Defender', NULL, 1, 70, 'Keiji Kinebuchi', 'Circle', 1),
(71, 'Energy Removal', NULL, 1, 71, 'Keiji Kinebuchi', 'Circle', 1),
(72, 'Full Heal', NULL, 1, 72, 'Keiji Kinebuchi', 'Circle', 1),
(73, 'Maintenance', NULL, 1, 73, 'Keiji Kinebuchi', 'Circle', 1),
(74, 'PlusPower', NULL, 1, 74, 'Keiji Kinebuchi', 'Circle', 1),
(75, 'Pokemon Center', NULL, 1, 75, 'Keiji Kinebuchi', 'Circle', 1),
(76, 'Pokemon Flute', NULL, 1, 76, 'Keiji Kinebuchi', 'Circle', 1),
(77, 'Pokedex', NULL, 1, 77, 'Keiji Kinebuchi', 'Circle', 1),
(78, 'Professor Oak', NULL, 1, 78, 'Ken Sugimori', 'Circle', 1),
(79, 'Revive', NULL, 1, 79, 'Keiji Kinebuchi', 'Circle', 1),
(80, 'Super Potion', NULL, 1, 80, 'Keiji Kinebuchi', 'Circle', 1),
(81, 'Bill', NULL, 1, 81, 'Ken Sugimori', 'Circle', 1),
(82, 'Switch', NULL, 1, 82, 'Keiji Kinebuchi', 'Black Star', 0),
(83, 'Gust of Wind', NULL, 1, 83, 'Keiji Kinebuchi', 'Black Star', 0),
(84, 'Potion', NULL, 1, 84, 'Keiji Kinebuchi', 'Black Star', 0);

-- Pokedex Gen 1 Data
INSERT INTO Pokemon (poke_id, poke_name, poke_desc, height, weight, style_text) VALUES
(1, 'Bulbasaur', 'Seed Pokemon', 24, 15.2, 'A strange seed was planted on its back at birth.'),
(2, 'Ivysaur', 'Seed Pokemon', 39, 28.7, 'When the bulb grows large, it loses ability to stand on hind legs.'),
(3, 'Venusaur', 'Seed Pokemon', 79, 220.5, 'The plant blooms while absorbing solar energy.'),
(4, 'Charmander', 'Lizard Pokemon', 24, 18.7, 'From birth, a flame burns at the tip of its tail.'),
(5, 'Charmeleon', 'Flame Pokemon', 43, 41.9, 'Its burning tail raises temperatures to unbearable levels.'),
(6, 'Charizard', 'Flame Pokemon', 67, 199.5, 'Its wings can carry this Pokemon close to an altitude of 4,600 feet.'),
(7, 'Squirtle', 'Tiny Turtle Pokemon', 20, 19.8, 'After birth, its back swells and hardens into a shell.'),
(8, 'Wartortle', 'Turtle Pokemon', 39, 49.6, 'Often hides in water to stalk unwary prey.'),
(9, 'Blastoise', 'Shellfish Pokemon', 63, 188.5, 'A brutal Pokemon with pressurized water jets on its shell.'),
(10, 'Caterpie', 'Worm Pokemon', 12, 6.4, 'Its short feet are tipped with suction pads that enable it to climb.'),
(11, 'Metapod', 'Cocoon Pokemon', 28, 21.8, 'This Pokemon is vulnerable to attack while its shell is soft.'),
(12, 'Butterfree', 'Butterfly Pokemon', 43, 70.5, 'The scales covering its wings help it to shed rain.'),
(13, 'Weedle', 'Hairy Bug Pokemon', 12, 7.1, 'Often found in forests, eating leaves.'),
(14, 'Kakuna', 'Cocoon Pokemon', 24, 22.0, 'Almost incapable of moving, this Pokemon can only harden its shell.'),
(15, 'Beedrill', 'Poison Bee Pokemon', 39, 65.0, 'Flies at high speed and attacks using its large venomous stingers.'),
(16, 'Pidgey', 'Tiny Bird Pokemon', 12, 4.0, 'A common sight in forests and woods.'),
(17, 'Pidgeotto', 'Bird Pokemon', 36, 66.1, 'Very protective of its sprawling territory.'),
(18, 'Pidgeot', 'Bird Pokemon', 71, 87.1, 'This Pokemon flies at Mach-2 speed, seeking prey.'),
(19, 'Rattata', 'Mouse Pokemon', 12, 7.7, 'Bites anything when it attacks.'),
(20, 'Raticate', 'Mouse Pokemon', 28, 40.8, 'Its whiskers help it to maintain balance.'),
(21, 'Spearow', 'Tiny Bird Pokemon', 12, 4.4, 'Eats bugs in grassy areas.'),
(22, 'Fearow', 'Beak Pokemon', 47, 83.8, 'It has the stamina to fly all day on its broad wings.'),
(23, 'Ekans', 'Snake Pokemon', 79, 15.2, 'Moves silently and stealthily.'),
(24, 'Arbok', 'Cobra Pokemon', 138, 143.3, 'The pattern on its belly appears to be a frightening face.'),
(25, 'Pikachu', 'Mouse Pokemon', 16, 13.2, 'Stores electricity in its cheeks.'),
(26, 'Raichu', 'Mouse Pokemon', 31, 66.1, 'Its long tail serves as a ground to protect from electrical shocks.'),
(27, 'Sandshrew', 'Mouse Pokemon', 24, 26.5, 'Burrows deep underground in arid locations.'),
(28, 'Sandslash', 'Mouse Pokemon', 39, 65.0, 'Curls up into a spiny ball when threatened.'),
(29, 'Nidoran♀', 'Poison Pin Pokemon', 16, 15.4, 'Although small, its venomous barbs make it dangerous.'),
(30, 'Nidorina', 'Poison Pin Pokemon', 31, 44.1, 'The female"s horn develops slowly.'),
(31, 'Nidoqueen', 'Drill Pokemon', 51, 132.3, 'Its horn is harder than diamond.'),
(32, 'Nidoran♂', 'Poison Pin Pokemon', 20, 19.8, 'Stiffens its ears to sense danger.'),
(33, 'Nidorino', 'Poison Pin Pokemon', 35, 43.0, 'An aggressive Pokemon that is quick to attack.'),
(34, 'Nidoking', 'Drill Pokemon', 55, 136.7, 'Its hard scales provide strong protection.'),
(35, 'Clefairy', 'Fairy Pokemon', 24, 16.5, 'Its magical and cute appeal has many admirers.'),
(36, 'Clefable', 'Fairy Pokemon', 51, 88.2, 'Said to appear in quiet mountain areas.'),
(37, 'Vulpix', 'Fox Pokemon', 24, 21.8, 'While young, it has six gorgeous tails.'),
(38, 'Ninetales', 'Fox Pokemon', 43, 43.9, 'Very smart and very vengeful.'),
(39, 'Jigglypuff', 'Balloon Pokemon', 20, 12.1, 'Uses its cute appearance to sing foes to sleep.'),
(40, 'Wigglytuff', 'Balloon Pokemon', 39, 26.5, 'Captivates foes with its huge, glossy eyes.'),
(41, 'Zubat', 'Bat Pokemon', 31, 16.5, 'Forms colonies in perpetually dark places.'),
(42, 'Golbat', 'Bat Pokemon', 63, 121.3, 'Once it strikes, it will not stop draining energy from the victim.'),
(43, 'Oddish', 'Weed Pokemon', 20, 11.9, 'During the day, it keeps its face buried in the ground.'),
(44, 'Gloom', 'Weed Pokemon', 31, 19.0, 'The fluid that oozes from its mouth isn"t drool.'),
(45, 'Vileplume', 'Flower Pokemon', 47, 41.0, 'The larger its petals, the more toxic pollen it contains.'),
(46, 'Paras', 'Mushroom Pokemon', 12, 11.9, 'Burrows under fallen leaves and soil to absorb nutrients.'),
(47, 'Parasect', 'Mushroom Pokemon', 39, 65.0, 'A host-parasite pair in which the mushroom has taken over the bug.'),
(48, 'Venonat', 'Insect Pokemon', 39, 66.1, 'Lives in the shadows of tall trees where it eats bugs.'),
(49, 'Venomoth', 'Poison Moth Pokemon', 59, 27.6, 'The dust-like scales covering its wings are color coded by toxicity.'),
(50, 'Diglett', 'Mole Pokemon', 8, 2.0, 'Lives about one yard underground where it feeds on plant roots.'),
(51, 'Dugtrio', 'Mole Pokemon', 28, 73.4, 'A team of Diglett triplets. It triggers huge earthquakes.'),
(52, 'Meowth', 'Scratch Cat Pokemon', 16, 9.3, 'Adores round objects. It"s known to chase its own tail.'),
(53, 'Persian', 'Classy Cat Pokemon', 39, 70.5, 'Its lithe muscles let it elegantly dart about.'),
(54, 'Psyduck', 'Duck Pokemon', 31, 43.2, 'Always tormented by headaches. It"s therapeutic to swim.'),
(55, 'Golduck', 'Duck Pokemon', 67, 168.9, 'Often seen swinging its head to strengthen its psychic powers.'),
(56, 'Mankey', 'Pig Monkey Pokemon', 20, 61.7, 'Extremely quick to anger. It could be docile one moment then thrashing away the next.'),
(57, 'Primeape', 'Pig Monkey Pokemon', 39, 70.5, 'Always furiously quick to anger. It can"t distinguish friends from foes.'),
(58, 'Growlithe', 'Puppy Pokemon', 28, 41.9, 'Very protective of its territory. It will bark and bite to repel intruders.'),
(59, 'Arcanine', 'Legendary Pokemon', 75, 341.7, 'A Pokemon that has long been admired for its beauty.'),
(60, 'Poliwag', 'Tadpole Pokemon', 24, 27.3, 'Its newly grown legs prevent it from running. It appears to prefer swimming.'),
(61, 'Poliwhirl', 'Tadpole Pokemon', 39, 44.1, 'Capable of living in or out of water. When out of water, it sweats to keep its body slimy.'),
(62, 'Poliwrath', 'Tadpole Pokemon', 51, 119.0, 'An adept swimmer at both the front crawl and breast stroke.'),
(63, 'Abra', 'Psi Pokemon', 35, 43.0, 'Using its ability to read minds, it will identify impending danger and teleport to safety.'),
(64, 'Kadabra', 'Psi Pokemon', 51, 124.7, 'It emits special alpha waves from its body that induce headaches.'),
(65, 'Alakazam', 'Psi Pokemon', 59, 106.7, 'Its brain can outperform a supercomputer. Its intelligence quotient is said to be 5,000.'),
(66, 'Machop', 'Superpower Pokemon', 31, 43.0, 'Loves to build its muscles. It trains in all styles of martial arts.'),
(67, 'Machoke', 'Superpower Pokemon', 59, 155.4, 'Its muscular body is so powerful, it must wear a power save belt.'),
(68, 'Machamp', 'Superpower Pokemon', 63, 286.6, 'Its four ruggedly developed arms can launch powerful punches.'),
(69, 'Bellsprout', 'Flower Pokemon', 28, 8.8, 'It prefers hot and humid environments. It is quick at capturing prey.'),
(70, 'Weepinbell', 'Flycatcher Pokemon', 39, 14.1, 'It spits out poison powder to immobilize the enemy.'),
(71, 'Victreebel', 'Flytrap Pokemon', 67, 34.2, 'The larger its mouth, the more powerful its acid juices.'),
(72, 'Tentacool', 'Jellyfish Pokemon', 35, 100.3, 'Drifts in shallow seas. Anglers who hook them by accident are often punished by its stinging acid.'),
(73, 'Tentacruel', 'Jellyfish Pokemon', 63, 121.3, 'The tentacles are normally kept short. On hunts, they are extended to ensnare prey.'),
(74, 'Geodude', 'Rock Pokemon', 16, 44.1, 'Found in fields and mountains. Mistaking them for boulders, people often step or trip on them.'),
(75, 'Graveler', 'Rock Pokemon', 39, 231.5, 'Rolls down slopes to move. It rolls over any obstacle without slowing or changing its direction.'),
(76, 'Golem', 'Megaton Pokemon', 55, 661.4, 'Its boulder-like body is extremely hard. It can easily withstand dynamite blasts without damage.'),
(77, 'Ponyta', 'Fire Horse Pokemon', 39, 66.1, 'Its hooves are 10 times harder than diamonds. It can trample anything flat in moments.'),
(78, 'Rapidash', 'Fire Horse Pokemon', 67, 209.4, 'Very competitive, this Pokemon will chase anything that moves fast.'),
(79, 'Slowpoke', 'Dopey Pokemon', 47, 79.4, 'Incredibly slow and dopey. It takes 5 seconds for it to feel pain when under attack.'),
(80, 'Slowbro', 'Hermit Crab Pokemon', 63, 336.2, 'The Shellder that latches onto Slowpoke"s tail is said to feed on the host"s leftover scraps.'),
(81, 'Magnemite', 'Magnet Pokemon', 12, 13.2, 'Uses anti-gravity to stay suspended. Appears without warning and uses Thunder Wave.'),
(82, 'Magneton', 'Magnet Pokemon', 39, 132.3, 'Formed by several Magnemites linked together. They frequently appear when sunspots flare up.'),
(83, 'Farfetch"d', 'Wild Duck Pokemon', 31, 33.1, 'The sprig of green onion it holds is its weapon. It is used much like a metal sword.'),
(84, 'Doduo', 'Twin Bird Pokemon', 55, 86.4, 'A two-headed Pokemon that was discovered as a sudden mutation. It runs at a pace of over 60 mph.'),
(85, 'Dodrio', 'Triple Bird Pokemon', 71, 187.8, 'Uses its three brains to execute complex plans. While two heads sleep, one head stays awake.'),
(86, 'Seel', 'Sea Lion Pokemon', 43, 198.4, 'Stores thermal energy in its body. Swims at a steady 8 knots even in intensely cold waters.'),
(87, 'Dewgong', 'Sea Lion Pokemon', 67, 264.6, 'Its entire body is a snowy-white. Unharmed by even intense cold, it swims powerfully in icy waters.'),
(88, 'Grimer', 'Sludge Pokemon', 35, 66.1, 'Appears in filthy areas. Thrives by sucking up polluted sludge that is pumped out of factories.'),
(89, 'Muk', 'Sludge Pokemon', 47, 66.1, 'Smells so awful, it can cause fainting. Through degeneration, it lost its sense of smell.'),
(90, 'Shellder', 'Bivalve Pokemon', 12, 8.8, 'Its hard shell repels any kind of attack. It is vulnerable only when its shell is open.'),
(101, 'Electrode', 'Ball Pokemon', 47, 146.8, 'It has the ability to reconstitute its entire cellular structure to transform into whatever it sees.'),
(102, 'Exeggcute', 'Egg Pokemon', 16, 5.5, 'Often mistaken for eggs. When disturbed, they quickly gather and attack in swarms.'),
(103, 'Exeggutor', 'Coconut Pokemon', 79, 264.6, 'Legend has it that on rare occasions, one of its heads will drop off and continue on as an Exeggcute.'),
(104, 'Cubone', 'Lonely Pokemon', 16, 14.3, 'Because it never removes its skull helmet, no one has ever seen this Pokemon"s real face.'),
(105, 'Marowak', 'Bone Keeper Pokemon', 39, 99.2, 'The bone it holds is its key weapon. It throws the bone skillfully like a boomerang.'),
(106, 'Hitmonlee', 'Kicking Pokemon', 59, 109.8, 'When in a hurry, its legs lengthen progressively. It runs smoothly with extra long, loping strides.'),
(107, 'Hitmonchan', 'Punching Pokemon', 55, 110.7, 'While apparently doing nothing, it fires punches in lightning fast volleys that are impossible to see.'),
(108, 'Lickitung', 'Licking Pokemon', 47, 144.4, 'Its tongue can be extended like a chameleon"s. It leaves a tingling sensation when it licks enemies.'),
(109, 'Koffing', 'Poison Gas Pokemon', 24, 2.2, 'Because it stores several kinds of toxic gases in its body, it is prone to exploding without warning.'),
(110, 'Weezing', 'Poison Gas Pokemon', 47, 21.2, 'Where two kinds of poison gases meet, 2 Koffings can fuse into a Weezing over many years.'),
(111, 'Rhyhorn', 'Spikes Pokemon', 39, 253.5, 'Its massive bones are 1000 times harder than human bones. It can easily knock a trailer flying.'),
(112, 'Rhydon', 'Drill Pokemon', 75, 264.6, 'Protected by an armor-like hide, it is capable of living in molten lava of 3,600 degrees Fahrenheit.'),
(113, 'Chansey', 'Egg Pokemon', 43, 76.3, 'A rare and elusive Pokemon that is said to bring happiness to those who manage to get it.'),
(114, 'Tangela', 'Vine Pokemon', 39, 77.2, 'The whole body is swathed with wide vines that are similar to seaweed. Its vines shake as it walks.'),
(115, 'Kangaskhan', 'Parent Pokemon', 87, 176.4, 'The infant rarely ventures out of its mother"s protective pouch until it is 3 years old.'),
(116, 'Horsea', 'Dragon Pokemon', 16, 17.6, 'Known to shoot ink at enemies when it escapes. It swims using its dorsal fin to swim backward.'),
(117, 'Seadra', 'Dragon Pokemon', 47, 55.1, 'Capable of swimming backwards by rapidly flapping its wing-like pectoral fins and stout tail.'),
(118, 'Goldeen', 'Goldfish Pokemon', 24, 33.1, 'Its tail fin billows like an elegant ballroom dress, giving it the nickname of the Water Queen.'),
(119, 'Seaking', 'Goldfish Pokemon', 51, 86.0, 'Its tail fin billows like an elegant ballroom dress, giving it the nickname of the Water Queen.'),
(120, 'Staryu', 'Starshape Pokemon', 31, 76.1, 'An enigmatic Pokemon that can effortlessly regenerate any appendage it loses in battle.'),
(121, 'Starmie', 'Mysterious Pokemon', 43, 176.4, 'Its central core glows with the seven colors of the rainbow. Some people value the core as a gem.'),
(122, 'Mr. Mime', 'Barrier Pokemon', 51, 120.2, 'If interrupted while it is miming, it will slap around the offender with its broad hands.'),
(123, 'Scyther', 'Mantis Pokemon', 59, 123.5, 'Its scythes become increasingly sharp by cutting through hard objects. It can even slice through steel.'),
(124, 'Jynx', 'Human Shape Pokemon', 55, 89.5, 'It seductively wiggles its hips as it walks. It can cause people to dance in unison with it.'),
(125, 'Electabuzz', 'Electric Pokemon', 43, 66.1, 'Normally found near power plants, they can wander away and cause major blackouts in cities.'),
(126, 'Magmar', 'Spitfire Pokemon', 51, 98.1, 'Its body always burns with an orange glow that enables it to hide perfectly among flames.'),
(127, 'Pinsir', 'Stag Beetle Pokemon', 59, 130.1, 'If it fails to crush the victim in its pincers, it will swing it around and toss it hard.'),
(128, 'Tauros', 'Wild Bull Pokemon', 55, 194.9, 'When it targets an enemy, it charges furiously while whipping its body with its long tails.'),
(129, 'Magikarp', 'Fish Pokemon', 35, 22.0, 'In the distant past, it was somewhat stronger than the horribly weak descendants that exist today.'),
(130, 'Gyarados', 'Atrocious Pokemon', 256, 518.1, 'Rarely seen in the wild. Huge and vicious, it is capable of destroying entire cities in a rage.'),
(131, 'Lapras', 'Transport Pokemon', 98, 485.0, 'A gentle soul that can read the minds of people. It can ferry people across the sea on its back.'),
(132, 'Ditto', 'Transform Pokemon', 12, 8.8, 'Capable of copying an enemy"s genetic code to instantly transform itself into a duplicate.'),
(133, 'Eevee', 'Evolution Pokemon', 12, 14.3, 'Its genetic code is irregular. It may mutate if it is exposed to radiation from element stones.'),
(134, 'Vaporeon', 'Bubble Jet Pokemon', 39, 63.9, 'Lives close to water. Its long tail is ridged with a fin which is often mistaken for a mermaid"s.'),
(135, 'Jolteon', 'Lightning Pokemon', 31, 54.0, 'It accumulates negative ions in the atmosphere to blast out 10,000-volt lightning bolts.'),
(136, 'Flareon', 'Flame Pokemon', 31, 55.1, 'When storing thermal energy in its body, its temperature could soar to over 1,600 degrees.'),
(137, 'Porygon', 'Virtual Pokemon', 31, 80.5, 'A man-made Pokemon created by science. It can move freely in cyberspace.'),
(138, 'Omanyte', 'Spiral Pokemon', 16, 16.5, 'Although long extinct, in rare cases, it can be genetically resurrected from fossils.'),
(139, 'Omastar', 'Spiral Pokemon', 39, 77.2, 'A prehistoric Pokemon that died out when its heavy shell made it impossible to catch prey.'),
(140, 'Kabuto', 'Shellfish Pokemon', 20, 25.4, 'A prehistoric Pokemon that died out when its shell became too heavy. It restored from fossils.'),
(141, 'Kabutops', 'Shellfish Pokemon', 51, 89.3, 'Its sleek shape is perfect for swimming. It slashes prey with its claws and drains their fluids.'),
(142, 'Aerodactyl', 'Fossil Pokemon', 71, 130.1, 'A ferocious prehistoric Pokemon that goes for the enemy"s throat with its serrated saw-like fangs.'),
(143, 'Snorlax', 'Sleeping Pokemon', 83, 1014.1, 'Very lazy. Just eats and sleeps. As its rotund bulk builds, it becomes steadily more slothful.'),
(144, 'Articuno', 'Freeze Pokemon', 67, 122.1, 'A legendary bird Pokemon that is said to appear to doomed people who are lost in icy mountains.'),
(145, 'Zapdos', 'Electric Pokemon', 63, 116.0, 'A legendary bird Pokemon that is said to appear from clouds while dropping enormous lightning bolts.'),
(146, 'Moltres', 'Flame Pokemon', 79, 132.3, 'Known as the legendary bird of fire. Every flap of its wings creates a dazzling flash of flames.'),
(147, 'Dratini', 'Dragon Pokemon', 71, 7.3, 'Long considered a mythical Pokemon until recently when a small colony was found living underwater.'),
(148, 'Dragonair', 'Dragon Pokemon', 157, 36.4, 'According to a witness, its body was surrounded by a strange aura that gave it a mystical look.'),
(149, 'Dragonite', 'Dragon Pokemon', 87, 463.0, 'An extremely rarely seen marine Pokemon. Its intelligence is said to match that of humans.'),
(150, 'Mewtwo', 'Genetic Pokemon', 79, 269.0, 'A Pokemon created by recombining Mew"s genes. It"s said to have the most savage heart among Pokemon.'),
(151, 'Mew', 'New Species Pokemon', 16, 8.8, 'So rare that it is still said to be a mirage by many experts. Only a few people have seen it.');

-- First add the column
ALTER TABLE Pokemon
ADD COLUMN poke_name VARCHAR(20);

-- Then update all names
UPDATE Pokemon
SET poke_name = CASE poke_id
    WHEN 1 THEN 'Bulbasaur'
    WHEN 2 THEN 'Ivysaur'
    WHEN 3 THEN 'Venusaur'
    WHEN 4 THEN 'Charmander'
    WHEN 5 THEN 'Charmeleon'
    WHEN 6 THEN 'Charizard'
    WHEN 7 THEN 'Squirtle'
    WHEN 8 THEN 'Wartortle'
    WHEN 9 THEN 'Blastoise'
    WHEN 10 THEN 'Caterpie'
    WHEN 11 THEN 'Metapod'
    WHEN 12 THEN 'Butterfree'
    WHEN 13 THEN 'Weedle'
    WHEN 14 THEN 'Kakuna'
    WHEN 15 THEN 'Beedrill'
    WHEN 16 THEN 'Pidgey'
    WHEN 17 THEN 'Pidgeotto'
    WHEN 18 THEN 'Pidgeot'
    WHEN 19 THEN 'Rattata'
    WHEN 20 THEN 'Raticate'
    WHEN 21 THEN 'Spearow'
    WHEN 22 THEN 'Fearow'
    WHEN 23 THEN 'Ekans'
    WHEN 24 THEN 'Arbok'
    WHEN 25 THEN 'Pikachu'
    WHEN 26 THEN 'Raichu'
    WHEN 27 THEN 'Sandshrew'
    WHEN 28 THEN 'Sandslash'
    WHEN 29 THEN 'Nidoran♀'
    WHEN 30 THEN 'Nidorina'
    WHEN 31 THEN 'Nidoqueen'
    WHEN 32 THEN 'Nidoran♂'
    WHEN 33 THEN 'Nidorino'
    WHEN 34 THEN 'Nidoking'
    WHEN 35 THEN 'Clefairy'
    WHEN 36 THEN 'Clefable'
    WHEN 37 THEN 'Vulpix'
    WHEN 38 THEN 'Ninetales'
    WHEN 39 THEN 'Jigglypuff'
    WHEN 40 THEN 'Wigglytuff'
    WHEN 41 THEN 'Zubat'
    WHEN 42 THEN 'Golbat'
    WHEN 43 THEN 'Oddish'
    WHEN 44 THEN 'Gloom'
    WHEN 45 THEN 'Vileplume'
    WHEN 46 THEN 'Paras'
    WHEN 47 THEN 'Parasect'
    WHEN 48 THEN 'Venonat'
    WHEN 49 THEN 'Venomoth'
    WHEN 50 THEN 'Diglett'
    WHEN 51 THEN 'Dugtrio'
    WHEN 52 THEN 'Meowth'
    WHEN 53 THEN 'Persian'
    WHEN 54 THEN 'Psyduck'
    WHEN 55 THEN 'Golduck'
    WHEN 56 THEN 'Mankey'
    WHEN 57 THEN 'Primeape'
    WHEN 58 THEN 'Growlithe'
    WHEN 59 THEN 'Arcanine'
    WHEN 60 THEN 'Poliwag'
    WHEN 61 THEN 'Poliwhirl'
    WHEN 62 THEN 'Poliwrath'
    WHEN 63 THEN 'Abra'
    WHEN 64 THEN 'Kadabra'
    WHEN 65 THEN 'Alakazam'
    WHEN 66 THEN 'Machop'
    WHEN 67 THEN 'Machoke'
    WHEN 68 THEN 'Machamp'
    WHEN 69 THEN 'Bellsprout'
    WHEN 70 THEN 'Weepinbell'
    WHEN 71 THEN 'Victreebel'
    WHEN 72 THEN 'Tentacool'
    WHEN 73 THEN 'Tentacruel'
    WHEN 74 THEN 'Geodude'
    WHEN 75 THEN 'Graveler'
    WHEN 76 THEN 'Golem'
    WHEN 77 THEN 'Ponyta'
    WHEN 78 THEN 'Rapidash'
    WHEN 79 THEN 'Slowpoke'
    WHEN 80 THEN 'Slowbro'
    WHEN 81 THEN 'Magnemite'
    WHEN 82 THEN 'Magneton'
    WHEN 83 THEN 'Farfetch"d'
    WHEN 84 THEN 'Doduo'
    WHEN 85 THEN 'Dodrio'
    WHEN 86 THEN 'Seel'
    WHEN 87 THEN 'Dewgong'
    WHEN 88 THEN 'Grimer'
    WHEN 89 THEN 'Muk'
    WHEN 90 THEN 'Shellder'
    WHEN 91 THEN 'Cloyster'
    WHEN 92 THEN 'Gastly'
    WHEN 93 THEN 'Haunter'
    WHEN 94 THEN 'Gengar'
    WHEN 95 THEN 'Onix'
    WHEN 96 THEN 'Drowzee'
    WHEN 97 THEN 'Hypno'
    WHEN 98 THEN 'Krabby'
    WHEN 99 THEN 'Kingler'
    WHEN 100 THEN 'Voltorb'
    WHEN 101 THEN 'Electrode'
    WHEN 102 THEN 'Exeggcute'
    WHEN 103 THEN 'Exeggutor'
    WHEN 104 THEN 'Cubone'
    WHEN 105 THEN 'Marowak'
    WHEN 106 THEN 'Hitmonlee'
    WHEN 107 THEN 'Hitmonchan'
    WHEN 108 THEN 'Lickitung'
    WHEN 109 THEN 'Koffing'
    WHEN 110 THEN 'Weezing'
    WHEN 111 THEN 'Rhyhorn'
    WHEN 112 THEN 'Rhydon'
    WHEN 113 THEN 'Chansey'
    WHEN 114 THEN 'Tangela'
    WHEN 115 THEN 'Kangaskhan'
    WHEN 116 THEN 'Horsea'
    WHEN 117 THEN 'Seadra'
    WHEN 118 THEN 'Goldeen'
    WHEN 119 THEN 'Seaking'
    WHEN 120 THEN 'Staryu'
    WHEN 121 THEN 'Starmie'
    WHEN 122 THEN 'Mr. Mime'
    WHEN 123 THEN 'Scyther'
    WHEN 124 THEN 'Jynx'
    WHEN 125 THEN 'Electabuzz'
    WHEN 126 THEN 'Magmar'
    WHEN 127 THEN 'Pinsir'
    WHEN 128 THEN 'Tauros'
    WHEN 129 THEN 'Magikarp'
    WHEN 130 THEN 'Gyarados'
    WHEN 131 THEN 'Lapras'
    WHEN 132 THEN 'Ditto'
    WHEN 133 THEN 'Eevee'
    WHEN 134 THEN 'Vaporeon'
    WHEN 135 THEN 'Jolteon'
    WHEN 136 THEN 'Flareon'
    WHEN 137 THEN 'Porygon'
    WHEN 138 THEN 'Omanyte'
    WHEN 139 THEN 'Omastar'
    WHEN 140 THEN 'Kabuto'
    WHEN 141 THEN 'Kabutops'
    WHEN 142 THEN 'Aerodactyl'
    WHEN 143 THEN 'Snorlax'
    WHEN 144 THEN 'Articuno'
    WHEN 145 THEN 'Zapdos'
    WHEN 146 THEN 'Moltres'
    WHEN 147 THEN 'Dratini'
    WHEN 148 THEN 'Dragonair'
    WHEN 149 THEN 'Dragonite'
    WHEN 150 THEN 'Mewtwo'
    WHEN 151 THEN 'Mew'
END
WHERE poke_id <= 151;

SELECT poke_id, poke_name, poke_desc, height, weight
FROM Pokemon
WHERE WEIGHT BETWEEN 50 AND 75
ORDER BY WEIGHT ASC;

/*
CREATE PROCEDURE attack(
    attacker_id INT,
    defender_id INT,
    attack_id INT
)
BEGIN
    -- Get attack damage and effects
    -- Calculate type effectiveness
    -- Apply status effects
    -- Update HP
    -- Log battle action

    UPDATE Pokemon_State
    SET current_hp = current_hp - calculated_damage
    WHERE pokemon_id = defender_id;
    -- etc...
END;
 */
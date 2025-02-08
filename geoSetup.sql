/* 0. Drop old tables: */
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS continents;

/* 1. Table setup:  */
CREATE TABLE continents (
  Name VARCHAR(20) PRIMARY KEY
);

CREATE TABLE countries (
  Name VARCHAR(40) PRIMARY KEY,
  Continent VARCHAR(20),
  Population NUMERIC(10) NOT NULL DEFAULT 0,
  FOREIGN KEY (Continent) REFERENCES continents(Name)
);

CREATE TABLE cities (
  Name VARCHAR(30) PRIMARY KEY,
  Continent VARCHAR(20),
  Country VARCHAR(40),
  Population NUMERIC(10) NOT NULL DEFAULT 0,
  FOREIGN KEY (Continent) REFERENCES continents(Name),
  FOREIGN KEY (Country) REFERENCES countries(Name)
);

/* 2. Table data entry:   */
INSERT INTO continents (Name)
VALUES ('AFRICA'),
       ('ANTARCTICA'),
       ('ASIA'),
       ('AUSTRALIA'),
       ('EUROPE'),
       ('NORTH AMERICA'),
       ('SOUTH AMERICA');

SELECT * FROM continents;

-- Insert countries
INSERT INTO countries (Name, Continent, Population)
VALUES
-- Africa (largest)
('Nigeria', 'AFRICA', 213400000),
('Ethiopia', 'AFRICA', 117900000),
('Egypt', 'AFRICA', 104300000),
('DR Congo', 'AFRICA', 89560000),
('Tanzania', 'AFRICA', 63600000),
-- Africa (smallest)
('Seychelles', 'AFRICA', 98462),
('Sao Tome & Principe', 'AFRICA', 219159),
('Cabo Verde', 'AFRICA', 555987),
('Comoros', 'AFRICA', 869601),
('Djibouti', 'AFRICA', 988000),
-- Africa (random)
('Kenya', 'AFRICA', 54900000),
('Morocco', 'AFRICA', 37100000),
('Uganda', 'AFRICA', 45700000),

-- Antarctica entries in countries table:
('McMurdo Station', 'ANTARCTICA', 1258),
('Amundsen-Scott Station', 'ANTARCTICA', 150),
('Vostok Station', 'ANTARCTICA', 25),
('Concordia Station', 'ANTARCTICA', 15),

-- Asia (largest)
('China', 'ASIA', 1411750000),
('India', 'ASIA', 1380004385),
('Indonesia', 'ASIA', 273523615),
('Pakistan', 'ASIA', 220892340),
('Bangladesh', 'ASIA', 164689383),
-- Asia (smallest)
('Maldives', 'ASIA', 540544),
('Brunei', 'ASIA', 459500),
('Timor-Leste', 'ASIA', 1318445),
('Cyprus', 'ASIA', 1207359),
('Bahrain', 'ASIA', 1472233),
-- Asia (random)
('Japan', 'ASIA', 125700000),
('Vietnam', 'ASIA', 97338579),
('Thailand', 'ASIA', 69800000),

-- Australia/Oceania (largest)
('Australia', 'AUSTRALIA', 25690000),
('Papua New Guinea', 'AUSTRALIA', 9122994),
('New Zealand', 'AUSTRALIA', 5124100),
('Fiji', 'AUSTRALIA', 896444),
('Solomon Islands', 'AUSTRALIA', 686884),
-- Australia/Oceania (smallest)
('Nauru', 'AUSTRALIA', 10000),
('Tuvalu', 'AUSTRALIA', 11792),
('Palau', 'AUSTRALIA', 18094),
('Niue', 'AUSTRALIA', 1626),
('Tokelau', 'AUSTRALIA', 1499),
-- Australia/Oceania (random)
('Samoa', 'AUSTRALIA', 198410),
('Vanuatu', 'AUSTRALIA', 307145),

-- Europe (largest)
('Russia', 'EUROPE', 143447812),
('Germany', 'EUROPE', 83200000),
('United Kingdom', 'EUROPE', 67330000),
('France', 'EUROPE', 67390000),
('Italy', 'EUROPE', 60360000),
-- Europe (smallest)
('Vatican City', 'EUROPE', 825),
('Monaco', 'EUROPE', 39244),
('San Marino', 'EUROPE', 33931),
('Liechtenstein', 'EUROPE', 38137),
('Malta', 'EUROPE', 514000),
-- Europe (random)
('Spain', 'EUROPE', 47420000),
('Poland', 'EUROPE', 37950000),
('Greece', 'EUROPE', 10720000),

-- North America (largest)
('United States', 'NORTH AMERICA', 331900000),
('Mexico', 'NORTH AMERICA', 128900000),
('Canada', 'NORTH AMERICA', 38250000),
('Guatemala', 'NORTH AMERICA', 17200000),
('Cuba', 'NORTH AMERICA', 11330000),
-- North America (smallest)
('Saint Kitts and Nevis', 'NORTH AMERICA', 53192),
('Grenada', 'NORTH AMERICA', 112523),
('Belize', 'NORTH AMERICA', 408487),
('Barbados', 'NORTH AMERICA', 287371),
('Dominica', 'NORTH AMERICA', 71986),
-- North America (random)
('Costa Rica', 'NORTH AMERICA', 5094000),
('Panama', 'NORTH AMERICA', 4315000),
('Jamaica', 'NORTH AMERICA', 2961000),

-- South America (largest)
('Brazil', 'SOUTH AMERICA', 214300000),
('Colombia', 'SOUTH AMERICA', 51520000),
('Argentina', 'SOUTH AMERICA', 45810000),
('Peru', 'SOUTH AMERICA', 33720000),
('Venezuela', 'SOUTH AMERICA', 28440000),
-- South America (smallest)
('Suriname', 'SOUTH AMERICA', 586634),
('Uruguay', 'SOUTH AMERICA', 3474000),
('Guyana', 'SOUTH AMERICA', 786552),
('French Guiana', 'SOUTH AMERICA', 294071),
('Falkland Islands', 'SOUTH AMERICA', 3480),
-- South America (random)
('Chile', 'SOUTH AMERICA', 19460000),
('Ecuador', 'SOUTH AMERICA', 17800000),
('Bolivia', 'SOUTH AMERICA', 11830000);

SELECT * FROM countries;

-- Insert cities
INSERT INTO cities (Name, Continent, Country, Population)
VALUES
-- Africa (Nigeria)
('Lagos', 'AFRICA', 'Nigeria', 15400000),
('Abuja', 'AFRICA', 'Nigeria', 3460000),
('Kano', 'AFRICA', 'Nigeria', 3140000),

-- Ethiopia
('Addis Ababa', 'AFRICA', 'Ethiopia', 4794000),
('Dire Dawa', 'AFRICA', 'Ethiopia', 466000),
('Mek''ele', 'AFRICA', 'Ethiopia', 323700),

-- Egypt
('Cairo', 'AFRICA', 'Egypt', 20900000),
('Alexandria', 'AFRICA', 'Egypt', 5200000),
('Giza', 'AFRICA', 'Egypt', 3100000),

-- DR Congo
('Kinshasa', 'AFRICA', 'DR Congo', 14340000),
('Lubumbashi', 'AFRICA', 'DR Congo', 2280000),
('Mbuji-Mayi', 'AFRICA', 'DR Congo', 2007000),

-- Tanzania
('Dar es Salaam', 'AFRICA', 'Tanzania', 6368000),
('Mwanza', 'AFRICA', 'Tanzania', 1120000),
('Dodoma', 'AFRICA', 'Tanzania', 410956),

-- Kenya
('Nairobi', 'AFRICA', 'Kenya', 4397073),
('Mombasa', 'AFRICA', 'Kenya', 1208333),
('Nakuru', 'AFRICA', 'Kenya', 570674),

-- Morocco
('Casablanca', 'AFRICA', 'Morocco', 3359818),
('Fez', 'AFRICA', 'Morocco', 1150131),
('Tangier', 'AFRICA', 'Morocco', 947952),

-- Uganda
('Kampala', 'AFRICA', 'Uganda', 1507080),
('Gulu', 'AFRICA', 'Uganda', 146858),
('Lira', 'AFRICA', 'Uganda', 99059),

-- Smaller African countries
('Victoria', 'AFRICA', 'Seychelles', 26450),
('Mont Fleuri', 'AFRICA', 'Seychelles', 3674),
('Beau Vallon', 'AFRICA', 'Seychelles', 4385),

('São Tomé', 'AFRICA', 'Sao Tome & Principe', 71868),
('Neves', 'AFRICA', 'Sao Tome & Principe', 10650),
('Santo Amaro', 'AFRICA', 'Sao Tome & Principe', 8239),

('Praia', 'AFRICA', 'Cabo Verde', 159050),
('Mindelo', 'AFRICA', 'Cabo Verde', 70468),
('Santa Maria', 'AFRICA', 'Cabo Verde', 17231),

('Moroni', 'AFRICA', 'Comoros', 111326),
('Mutsamudu', 'AFRICA', 'Comoros', 30000),
('Domoni', 'AFRICA', 'Comoros', 15351),

('Djibouti City', 'AFRICA', 'Djibouti', 624638),
('Ali Sabieh', 'AFRICA', 'Djibouti', 40074),
('Tadjoura', 'AFRICA', 'Djibouti', 22193);

-- Insert cities
INSERT INTO cities (Name, Continent, Country, Population)
VALUES
-- Antarctica entries in cities table:
('McMurdo Station (City)', 'ANTARCTICA', 'United States', 1258),
('Amundsen-Scott Station (City)', 'ANTARCTICA', 'United States', 150),
('Vostok Station (City)', 'ANTARCTICA', 'Russia', 25),
('Concordia Station (City)', 'ANTARCTICA', 'France', 15),

-- Asia
-- China
('Shanghai', 'ASIA', 'China', 27796000),
('Beijing', 'ASIA', 'China', 20896000),
('Guangzhou', 'ASIA', 'China', 16096000),

-- India
('Mumbai', 'ASIA', 'India', 20411274),
('Delhi', 'ASIA', 'India', 16787941),
('Bangalore', 'ASIA', 'India', 12339447),

-- Indonesia
('Jakarta', 'ASIA', 'Indonesia', 10562088),
('Surabaya', 'ASIA', 'Indonesia', 3457890),
('Bandung', 'ASIA', 'Indonesia', 2339463),

-- Japan
('Tokyo', 'ASIA', 'Japan', 37400068),
('Yokohama', 'ASIA', 'Japan', 3725000),
('Osaka', 'ASIA', 'Japan', 2691742),

-- Vietnam
('Ho Chi Minh City', 'ASIA', 'Vietnam', 8993082),
('Hanoi', 'ASIA', 'Vietnam', 8053663),
('Da Nang', 'ASIA', 'Vietnam', 1134310),

-- Thailand
('Bangkok', 'ASIA', 'Thailand', 8280925),

-- Pakistan
('Karachi', 'ASIA', 'Pakistan', 14910352),
('Lahore', 'ASIA', 'Pakistan', 11126285),
('Faisalabad', 'ASIA', 'Pakistan', 3203846),

-- Bangladesh
('Dhaka', 'ASIA', 'Bangladesh', 8906039),
('Chittagong', 'ASIA', 'Bangladesh', 2581643),
('Khulna', 'ASIA', 'Bangladesh', 663342),

-- Maldives
('Malé', 'ASIA', 'Maldives', 133412),
('Addu City', 'ASIA', 'Maldives', 32675),
('Fuvahmulah', 'ASIA', 'Maldives', 8055),

-- Brunei
('Bandar Seri Begawan', 'ASIA', 'Brunei', 100700),
('Kuala Belait', 'ASIA', 'Brunei', 31178),
('Tutong', 'ASIA', 'Brunei', 19151),

-- Timor-Leste
('Dili', 'ASIA', 'Timor-Leste', 222323),
('Baucau', 'ASIA', 'Timor-Leste', 16000),
('Los Palos', 'ASIA', 'Timor-Leste', 12000),

-- Cyprus
('Nicosia', 'ASIA', 'Cyprus', 200452),
('Limassol', 'ASIA', 'Cyprus', 101000),
('Larnaca', 'ASIA', 'Cyprus', 51468),

-- Bahrain
('Manama', 'ASIA', 'Bahrain', 157000),
('Riffa', 'ASIA', 'Bahrain', 195000),
('Muharraq', 'ASIA', 'Bahrain', 97458),
('Nonthaburi', 'ASIA', 'Thailand', 270609),
('Pak Kret', 'ASIA', 'Thailand', 189258),

-- Australia/Oceania
-- Australia
('Sydney', 'AUSTRALIA', 'Australia', 5367206),
('Melbourne', 'AUSTRALIA', 'Australia', 5078193),
('Brisbane', 'AUSTRALIA', 'Australia', 2560720),

-- Papua New Guinea
('Port Moresby', 'AUSTRALIA', 'Papua New Guinea', 364125),
('Lae', 'AUSTRALIA', 'Papua New Guinea', 76255),
('Arawa', 'AUSTRALIA', 'Papua New Guinea', 40266),

-- New Zealand
('Auckland', 'AUSTRALIA', 'New Zealand', 1657000),
('Wellington', 'AUSTRALIA', 'New Zealand', 212700),
('Christchurch', 'AUSTRALIA', 'New Zealand', 404500);


-- Insert cities
INSERT INTO cities (Name, Continent, Country, Population)
VALUES
-- Europe
-- Russia
('Moscow', 'EUROPE', 'Russia', 12506468),
('Saint Petersburg', 'EUROPE', 'Russia', 5351935),
('Novosibirsk', 'EUROPE', 'Russia', 1620162),

-- Germany
('Berlin', 'EUROPE', 'Germany', 3669495),
('Hamburg', 'EUROPE', 'Germany', 1841179),
('Munich', 'EUROPE', 'Germany', 1471508),

-- United Kingdom
('London', 'EUROPE', 'United Kingdom', 9002488),
('Birmingham', 'EUROPE', 'United Kingdom', 2607437),
('Leeds', 'EUROPE', 'United Kingdom', 1889095),

-- France
('Paris', 'EUROPE', 'France', 2148271),
('Marseille', 'EUROPE', 'France', 861635),
('Lyon', 'EUROPE', 'France', 513275),

-- Italy
('Rome', 'EUROPE', 'Italy', 4342212),
('Milan', 'EUROPE', 'Italy', 1396059),
('Naples', 'EUROPE', 'Italy', 959470),

-- Spain
('Madrid', 'EUROPE', 'Spain', 3223334),
('Barcelona', 'EUROPE', 'Spain', 1620343),
('Valencia', 'EUROPE', 'Spain', 791413),

-- Poland
('Warsaw', 'EUROPE', 'Poland', 1783321),
('Kraków', 'EUROPE', 'Poland', 766683),
('Łódź', 'EUROPE', 'Poland', 679941),

-- Greece
('Athens', 'EUROPE', 'Greece', 664046),
('Thessaloniki', 'EUROPE', 'Greece', 325182),
('Patras', 'EUROPE', 'Greece', 167446),

-- Vatican City
('Vatican City', 'EUROPE', 'Vatican City', 825),

-- Monaco
('Monte Carlo', 'EUROPE', 'Monaco', 15200),
('La Condamine', 'EUROPE', 'Monaco', 12167),
('Monaco-Ville', 'EUROPE', 'Monaco', 1034),

-- San Marino
('Serravalle', 'EUROPE', 'San Marino', 10591),
('Borgo Maggiore', 'EUROPE', 'San Marino', 6424),
('Domagnano', 'EUROPE', 'San Marino', 3641),

-- Liechtenstein
('Vaduz', 'EUROPE', 'Liechtenstein', 5468),
('Schaan', 'EUROPE', 'Liechtenstein', 5748),
('Triesen', 'EUROPE', 'Liechtenstein', 5160),

-- Malta
('Birkirkara', 'EUROPE', 'Malta', 22247),
('Qormi', 'EUROPE', 'Malta', 16779),
('Mosta', 'EUROPE', 'Malta', 20241);

-- Insert cities
INSERT INTO cities (Name, Continent, Country, Population)
VALUES
-- North America
-- United States
('New York City', 'NORTH AMERICA', 'United States', 8804190),
('Los Angeles', 'NORTH AMERICA', 'United States', 3898747),
('Chicago', 'NORTH AMERICA', 'United States', 2746388),

-- Mexico
('Mexico City', 'NORTH AMERICA', 'Mexico', 9209944),
('Guadalajara', 'NORTH AMERICA', 'Mexico', 1460148),
('Monterrey', 'NORTH AMERICA', 'Mexico', 1142994),

-- Canada
('Toronto', 'NORTH AMERICA', 'Canada', 2731571),
('Montreal', 'NORTH AMERICA', 'Canada', 1704694),
('Vancouver', 'NORTH AMERICA', 'Canada', 631486),

-- Guatemala
('Guatemala City', 'NORTH AMERICA', 'Guatemala', 2934841),
('Mixco', 'NORTH AMERICA', 'Guatemala', 465569),
('Villa Nueva', 'NORTH AMERICA', 'Guatemala', 433734),

-- Cuba
('Havana', 'NORTH AMERICA', 'Cuba', 2130517),
('Santiago de Cuba', 'NORTH AMERICA', 'Cuba', 431272),
('Camaguey', 'NORTH AMERICA', 'Cuba', 347562),

-- Costa Rica
('San José', 'NORTH AMERICA', 'Costa Rica', 342188),
('Alajuela', 'NORTH AMERICA', 'Costa Rica', 254886),
('San Francisco', 'NORTH AMERICA', 'Costa Rica', 55923),

-- Panama
('Panama City', 'NORTH AMERICA', 'Panama', 880691),
('San Miguelito', 'NORTH AMERICA', 'Panama', 315019),
('Las Cumbres', 'NORTH AMERICA', 'Panama', 69102),

-- Jamaica
('Kingston', 'NORTH AMERICA', 'Jamaica', 937700),
('Portmore', 'NORTH AMERICA', 'Jamaica', 182153),
('Spanish Town', 'NORTH AMERICA', 'Jamaica', 147152),

-- Saint Kitts and Nevis
('Basseterre', 'NORTH AMERICA', 'Saint Kitts and Nevis', 14000),
('Charlestown', 'NORTH AMERICA', 'Saint Kitts and Nevis', 1538),
('Sandy Point Town', 'NORTH AMERICA', 'Saint Kitts and Nevis', 3000),

-- Grenada
('St. George''s', 'NORTH AMERICA', 'Grenada', 33734),
('Grenville', 'NORTH AMERICA', 'Grenada', 2476),
('Gouyave', 'NORTH AMERICA', 'Grenada', 3378),

-- Belize
('Belize City', 'NORTH AMERICA', 'Belize', 61461),
('San Ignacio', 'NORTH AMERICA', 'Belize', 20128),
('Belmopan', 'NORTH AMERICA', 'Belize', 13381),

-- Barbados
('Bridgetown', 'NORTH AMERICA', 'Barbados', 110000),
('Speightstown', 'NORTH AMERICA', 'Barbados', 3634),
('Oistins', 'NORTH AMERICA', 'Barbados', 2285),

-- Dominica
('Roseau', 'NORTH AMERICA', 'Dominica', 14725),
('Portsmouth', 'NORTH AMERICA', 'Dominica', 3633),
('Marigot', 'NORTH AMERICA', 'Dominica', 2411);

-- Insert cities
INSERT INTO cities (Name, Continent, Country, Population)
VALUES
-- South America
-- Brazil
('São Paulo', 'SOUTH AMERICA', 'Brazil', 12325232),
('Rio de Janeiro', 'SOUTH AMERICA', 'Brazil', 6747815),
('Brasília', 'SOUTH AMERICA', 'Brazil', 3055149),

-- Colombia
('Bogotá', 'SOUTH AMERICA', 'Colombia', 7181469),
('Medellín', 'SOUTH AMERICA', 'Colombia', 2382399),
('Cali', 'SOUTH AMERICA', 'Colombia', 2172527),

-- Argentina
('Buenos Aires', 'SOUTH AMERICA', 'Argentina', 3075646),
('Córdoba', 'SOUTH AMERICA', 'Argentina', 1329604),
('Rosario', 'SOUTH AMERICA', 'Argentina', 1193605),

-- Peru
('Lima', 'SOUTH AMERICA', 'Peru', 9562280),
('Arequipa', 'SOUTH AMERICA', 'Peru', 1008290),
('Trujillo', 'SOUTH AMERICA', 'Peru', 919899),

-- Venezuela
('Caracas', 'SOUTH AMERICA', 'Venezuela', 2245744),
('Maracaibo', 'SOUTH AMERICA', 'Venezuela', 2108404),
('Valencia (SA)', 'SOUTH AMERICA', 'Venezuela', 1869459),

-- Chile
('Santiago', 'SOUTH AMERICA', 'Chile', 6769996),
('Valparaíso', 'SOUTH AMERICA', 'Chile', 934859),
('Concepción', 'SOUTH AMERICA', 'Chile', 848023),

-- Ecuador
('Quito', 'SOUTH AMERICA', 'Ecuador', 2011388),
('Guayaquil', 'SOUTH AMERICA', 'Ecuador', 2698077),
('Cuenca', 'SOUTH AMERICA', 'Ecuador', 636996),

-- Bolivia
('La Paz', 'SOUTH AMERICA', 'Bolivia', 766468),
('Santa Cruz', 'SOUTH AMERICA', 'Bolivia', 1441406),
('Cochabamba', 'SOUTH AMERICA', 'Bolivia', 630587),

-- Uruguay
('Montevideo', 'SOUTH AMERICA', 'Uruguay', 1381457),
('Salto', 'SOUTH AMERICA', 'Uruguay', 104011),
('Ciudad de la Costa', 'SOUTH AMERICA', 'Uruguay', 95176),

-- Smaller South American countries
('Paramaribo', 'SOUTH AMERICA', 'Suriname', 241000),
('Lelydorp', 'SOUTH AMERICA', 'Suriname', 19000),
('Nieuw Nickerie', 'SOUTH AMERICA', 'Suriname', 13000),

('Georgetown', 'SOUTH AMERICA', 'Guyana', 235017),
('Linden', 'SOUTH AMERICA', 'Guyana', 44690),
('New Amsterdam', 'SOUTH AMERICA', 'Guyana', 35039),

('Cayenne', 'SOUTH AMERICA', 'French Guiana', 57729),
('Matoury', 'SOUTH AMERICA', 'French Guiana', 32427),
('Kourou', 'SOUTH AMERICA', 'French Guiana', 26221),

('Stanley', 'SOUTH AMERICA', 'Falkland Islands', 2460),
('Mount Pleasant', 'SOUTH AMERICA', 'Falkland Islands', 1000),
('Port Howard', 'SOUTH AMERICA', 'Falkland Islands', 22);
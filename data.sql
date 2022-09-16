/* Populate database with sample data. */

-- Day 1

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '02-03-2020', 0, false, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'November 15, 2018', 2, true, '8');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'January 7, 2021', 1, false, '15.04');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, true, '11');

-- Day 2

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'Feb 8, 2020', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'November 15, 2021', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'April 2, 1993', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'June 12, 2005', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'June 7, 2005', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'October 13, 1998', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, true, 22);

-- Day 3

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19),
      ('Bob', 45),
      ('Melody Pond', 77 ),
      ('Dean Winchester', 14),
      ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

-- Day 4

INSERT INTO vets (name, date_of_graduation, age) VALUES ('William Tatcher', 'Apr 23, 2000', 45), ('Maisy Smith', 'Jan 17, 2019', 26),
('Stephanie Mendez', 'May 4, 1981', 64), ('Jack Harkness', 'Jun 8, 2008', 38);

--

INSERT INTO specializations (species_id, vets_id) VALUES (1, 1), (1, 3), (2, 3), (2, 4);

--

INSERT INTO visits (animals_id, vets_id, visits_date) VALUES (2, 1, 'May 24, 2020'), (2, 3, 'Jul 22, 2020'),
(3, 4, 'Feb 2, 2021'), (4, 2, 'Jan 5, 2020'), (4, 2, 'Mar 8, 2020'), (4, 2, 'May 14, 2020'),
(5, 3, 'May 4, 2021'),(6, 4, 'Feb 24, 2021'), (7, 2, 'Dec 21, 2019'), (7, 1, 'Aug 10, 2020'), (7, 2, 'Apr 7, 2021'),
(8, 3, 'Sep 29, 2019'), (9, 4, 'Oct 3, 2020'), (9, 4, 'Nov 4, 2020'), (10, 2, 'Jan 24, 2019'),
(10, 2, 'May 15, 2019'), (10, 2, 'Feb 27, 2020'), (10, 2, 'Aug 3, 2020'), (11, 3, 'May 24, 2020'),
(11, 1, 'Jan 11, 2021');

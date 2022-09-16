/*Queries that provide answers to the questions from all projects.*/

-- Day 1

SELECT * from animals WHERE name like '%mon';
SELECT name from animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
SELECT name from animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' or name = 'Pikachu';
SELECT name, escape_attempts from animals where weight_kg > 10.5;
SELECT * from animals where neutered = true; 
SELECT * from animals where name = 'Gabumon'; 
SELECT * from animals where weight_kg between 10.4 and 17.3;

-- Day 2

BEGIN TRANSACTION;

UPDATE animals
SET species = 'unespecified';

ROLLBACK;

--

BEGIN TRANSACTION;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species is null;

COMMIT;

--

BEGIN TRANSACTION;

DELETE FROM animals;

ROLLBACK;

--

BEGIN TRANSACTION;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_young_animals;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO delete_young_animals;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

-- 

SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) from animals;
SELECT neutered, AVG(escape_attempts) AS average_escapes FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) from animals GROUP BY species;

--Day 3

SELECT name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name FROM animals INNER JOIN species on species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals on owners.id = animals.owner_id;
SELECT COUNT(*), species.name FROM animals JOIN species on animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals INNER JOIN owners on animals.owner_id = owners.id WHERE owner_id = 2 AND animals.species_id = 2;
SELECT animals.name FROM animals INNER JOIN owners on animals.owner_id = owners.id WHERE owner_id = 5 AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(*) FROM owners INNER JOIN animals on owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT DESC LIMIT 1;
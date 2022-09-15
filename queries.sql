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
SELECT species, AVG(escape_attempts)from animals GROUP BY species, date_of_birth HAVING date_of_birth BETWEEN 'January 1, 1990' AND ' December 31, 2000';

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

-- Day 4

SELECT animals.name, visits.visits_date, vets.name FROM animals 
INNER JOIN visits on animals.id = visits.animals_id 
JOIN vets on visits.vets_id = vets.id WHERE vets.id = 1 
ORDER BY visits.visits_date DESC LIMIT 1;

SELECT COUNT(DISTINCT animals.name ), vets.name from animals 
JOIN visits on animals.id = visits.animals_id 
JOIN vets on visits.vets_id = vets.id
WHERE vets.id = 3 GROUP BY vets.name;

SELECT vets.name, species.name FROM vets LEFT JOIN specializations 
ON vets.id = specializations.vets_id 
LEFT JOIN species on species.id = specializations.species_id;

SELECT animals.name, visits.visits_date, vets.name FROM animals INNER JOIN visits ON animals.id = visits.animals_id 
INNER JOIN vets on vets.id = visits.vets_id
WHERE vets.id = 3 AND visits.visits_date BETWEEN 'April 1, 2020' AND 'August 30, 2020';

SELECT animals.name, COUNT(visits.animals_id) FROM animals 
JOIN visits ON visits.animals_id = animals.id GROUP BY animals.name
ORDER BY COUNT DESC LIMIT 1;

SELECT animals.name, visits.visits_date, vets.name FROM animals 
INNER JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 2 
ORDER BY visits_date LIMIT 1;

SELECT animals.name AS Name, species.name AS Specie, animals.escape_attempts AS Escape_Attempts,
animals.weight_kg AS Weight_in_KG, animals.neutered AS Is_Neutered, animals.date_of_birth AS Birthday, owners.full_name AS Owner,
visits.visits_date AS Visit_Date, vets.name AS Vet_Name FROM animals INNER JOIN species ON species.id = animals.species_id 
INNER JOIN owners ON owners.id = animals.owner_id 
INNER JOIN visits ON visits.animals_id = animals.id 
INNER JOIN vets on visits.vets_id = vets.id 
ORDER BY visits_date DESC LIMIT 1;

SELECT COUNT(visits.animals_id) FROM visits INNER JOIN animals 
ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id 
WHERE animals.species_id NOT IN ( SELECT specializations.species_id FROM specializations
WHERE specializations.vets_id = vets.id );

SELECT vets.name, COUNT(visits.vets_id) AS visit_count, species.name FROM vets JOIN visits ON visits.vets_id = vets.id 
JOIN animals ON visits.animals_id = animals.id 
JOIN species ON animals.species_id = species.id 
WHERE vets.id = 2
GROUP BY vets.name, species.name ORDER BY visit_count DESC;
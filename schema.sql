/* Database schema to keep the structure of entire database. */

-- Day 1

CREATE TABLE animals (
    id INT generated always as identity,
    name varchar(100) not null,
    date_of_birth date not null,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    primary key(id)
);

-- Day 2

ALTER TABLE animals
ADD species CHAR;

-- Day 3

CREATE TABLE owners (
    id INT generated always as identity,
    full_name VARCHAR(100),
    age INT
);

-- 

CREATE TABLE species (
    id INT generated always as identity,
    name VARCHAR(100),
    primary key(id)
);

--

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES owners(id);

-- Day 4

CREATE TABLE vets (
    id INT generated always as identity,
    name VARCHAR(100),
    date_of_graduation date,
    primary key(id)
);

--

CREATE TABLE specializations (
    species_id INT NOT NULL,
    vets_id INT NOT NULL,
    primary key(species_id, vets_id),
    FOREIGN KEY(species_id) REFERENCES species(id),
    FOREIGN KEY(vets_id) REFERENCES vets(id)
);

-- 
CREATE TABLE visits (
    animals_id INT NOT NULL,
    vets_id INT NOT NULL,
    visits_date DATE NOT NULL,
    PRIMARY KEY(animals_id, vets_id, visits_date),
    FOREIGN KEY(animals_id) REFERENCES animals(id),
    FOREIGN KEY(vets_id) REFERENCES vets(id)
);
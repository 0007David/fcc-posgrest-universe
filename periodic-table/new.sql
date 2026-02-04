
-- SOme instruction 


-- You should rename the weight column to atomic_mass
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;

-- You should rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

-- Your melting_point_celsius and boiling_point_celsius columns should not accept null values
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;


-- You should add the UNIQUE constraint to the symbol and name columns from the elements table
ALTER TABLE elements ADD CONSTRAINT element_name_key UNIQUE (name);
ALTER TABLE elements ADD CONSTRAINT element_symbol_key UNIQUE (symbol);    

-- Your symbol and name columns should have the NOT NULL constraint
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;

-- You should set the atomic_number column from the properties table as a foreign key that references the column of the same name in the elements table
ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);

CREATE TABLE types(type_id SERIAL PRIMARY KEY, type VARCHAR(50) NOT NULL);
-- You should add three rows to your types table whose values are the three different types from the properties table


-- Your properties table should have a type_id foreign key column that references the type_id column from the types table. It should be an INT with the NOT NULL constraint
ALTER TABLE properties ADD COLUMN type_id INT;
UPDATE properties p SET type_id=(SELECT type_id FROM types WHERE type=p.type)
ALTER TABLE properties ADD FOREIGN KEY(type_id) REFERENCES types(type_id);
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;

-- You should capitalize the first letter of all the symbol values in the elements table. Be careful to only capitalize the letter and not change any others
update elements set symbol = 'He' where symbol = 'he';
update elements set symbol = 'Li' where symbol = 'li';
update elements set symbol = 'MT' where symbol = 'mT';

-- You should remove all the trailing zeros after the decimals from each row of the atomic_mass column. You may need to adjust a data type to DECIMAL for this. The final values they should be are in the atomic_mass.txt file
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE NUMERIC;
atomic_number |   type    | atomic_mass | melting_point_celsius | boiling_point_celsius | type_id 
---------------+-----------+-------------+-----------------------+-----------------------+---------
             1 | nonmetal  |    1.008000 |                -259.1 |                -252.9 |       2
             2 | nonmetal  |    4.002600 |                -272.2 |                  -269 |       2
             3 | metal     |    6.940000 |                180.54 |                  1342 |       1
             4 | metal     |    9.012200 |                  1287 |                  2470 |       1
             5 | metalloid |   10.810000 |                  2075 |                  4000 |       3
             6 | nonmetal  |   12.011000 |                  3550 |                  4027 |       2
             7 | nonmetal  |   14.007000 |                -210.1 |                -195.8 |       2
             8 | nonmetal  |   15.999000 |                  -218 |                  -183 |       2
          1000 | metalloid |    1.000000 |                    10 |                   100 |       3
(9 rows)
SELECT CAST(TRIM(TRAILING '0' FROM CAST(atomic_mass AS TEXT)) AS NUMERIC) AS trimmed_value FROM properties order by atomic_number;
SELECT TRIM(TRAILING '0' FROM atomic_mass::TEXT)::NUMERIC FROM properties ORDER BY atomic_number;
Update properties p1 SET atomic_mass = (SELECT TRIM(TRAILING '0' FROM atomic_mass::TEXT)::NUMERIC FROM properties p2 where p1.atomic_number= p2.atomic_number)

-- You should add the element with atomic number 9 to your database. 
-- Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal
INSERT INTO elements (atomic_number, symbol, name) VALUES (9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');
INSERT INTO properties (atomic_number,atomic_mass,melting_point_celsius,boiling_point_celsius,type_id) VALUES (9, 18.998, -220, -188.1, 2), (10, 20.18, -248.6, -246.1, 2);

-- You should delete the non existent element, whose atomic_number is 1000, from the two tables
DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements WHERE atomic_number = 1000;


SELECT * FROM properties INNER JOIN elements USING(atomic_number) WHERE elements.name='Hydrogen' OR  properties.atomic_number=CAST('Hydrogen' AS NUMBER);



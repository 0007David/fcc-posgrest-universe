#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
#PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo Please provide an element as an argument.
read ATOMIC_NUMBER
# The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

# Si lo ingresado no es numero
if [[ ! $ATOMIC_NUMBER =~ ^[0-9]+$ ]]
then
  # send to main menu
  echo No es un numero
  PROPERTIE_ELEMENT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) WHERE elements.name='$ATOMIC_NUMBER'");
  echo $PROPERTIE_ELEMENT
else
  echo es un numero
  PROPERTIE_ELEMENT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) WHERE properties.atomic_number=$ATOMIC_NUMBER;");
  echo $PROPERTIE_ELEMENT
fi



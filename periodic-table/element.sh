#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
#PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

ATOMIC_NUMBER=$1
if [[ -z $ATOMIC_NUMBER ]]
then
  echo Please provide an element as an argument.
  exit  
fi

# The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

# Si lo ingresado no es numero
if [[ ! $ATOMIC_NUMBER =~ ^[0-9]+$ ]]
then
  # send to main menu
  PROPERTIE_ELEMENT=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type, name, symbol FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE elements.name='$ATOMIC_NUMBER' OR elements.symbol='$ATOMIC_NUMBER'")
  
  if [[ -z $PROPERTIE_ELEMENT ]]
  then
    echo I could not find that element in the database.
  else    
    IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE NAME SYMBOL <<< "$PROPERTIE_ELEMENT"
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi  
else
  PROPERTIE_ELEMENT=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type, name, symbol FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE properties.atomic_number=$ATOMIC_NUMBER;")
  if [[ -z $PROPERTIE_ELEMENT ]]
  then
    echo I could not find that element in the database.
  else
    IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE NAME SYMBOL <<< "$PROPERTIE_ELEMENT"

    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."  
  fi
fi

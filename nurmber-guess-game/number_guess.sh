#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read NAME

if [[ ! -z $NAME ]]
then

  USER_NAME=$($PSQL "SELECT name FROM users WHERE name='$NAME';")
  if [[ -z $USER_NAME ]]
  then
    # insertar el usuario
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$NAME')")

    USER_NAME=$NAME
    echo Welcome, $USER_NAME! It looks like this is your first time here.
  else     
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) as games_played FROM games INNER JOIN users USING(user_id) WHERE name='$NAME';")    
    BEST_GAME=$($PSQL "SELECT MIN(number_attempt) as best_game FROM games INNER JOIN users USING(user_id) WHERE name='$NAME';")
    echo Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  fi
  
  NUMBER_RANDOM=$((1 + RANDOM % 1000))
  number_of_guesses=0
  SECRET_NUMBER=0
  echo Guess the secret number between 1 and 1000:
  #while [ $NUMBER_RANDOM -ne $SECRET_NUMBER ]; do
  while true; do
    
    read SECRET_NUMBER

    if [[ ! $SECRET_NUMBER =~ ^[0-9]+$ ]]
    then 
      echo That is not an integer, guess again:      
      continue
    fi

    ((number_of_guesses++))
    
    if [[ $SECRET_NUMBER -eq $NUMBER_RANDOM ]]; 
    then
      break
    elif [[ $NUMBER_RANDOM -lt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"      
    else
      echo "It's higher than that, guess again:"
    fi    
done

# insertar la partida jugada
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$NAME';")
INSERT_USER_RESULT=$($PSQL "INSERT INTO games(number_guess, number_attempt, user_id) VALUES($SECRET_NUMBER, $number_of_guesses, $USER_ID)")
echo -e "\nYou guessed it in $number_of_guesses tries. The secret number was $SECRET_NUMBER. Nice job!"
exit
fi

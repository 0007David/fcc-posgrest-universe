#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
#PSQL="psql -X --username=freecodecamp --dbname=bikes --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"
MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  
  SHOW_SERVICES

  # Ingresar ID SERVICIO
  read SERVICE_ID_SELECTED

  # Si lo ingresado no es numero
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # obtener el servicio seleccionado
    SERVICE_SELECTED=$($PSQL "SELECT service_id, name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    #echo "$SERVICE_SELECTED"
    # validamos q existe registros
    if [[ -z $SERVICE_SELECTED ]]
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      # Ingresar usuario
      # Si no existe pedir datos para registrar
      echo "What's your phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      # if customer doesn't exist
      if [[ -z $CUSTOMER_NAME ]]
      then
        # get new customer name
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME

        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")         
      fi

      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
      read SERVICE_TIME
      
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')") 

      echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
    fi    
   fi
}

SHOW_SERVICES() {
  # obtener los servicios
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  
  # mostrar servicios    
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    if [[ $SERVICE_ID =~ ^[0-9]+$ ]]
    then
      echo "$SERVICE_ID) $NAME"
    fi
  done
}

MAIN_MENU
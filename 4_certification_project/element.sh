#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."
else
    if [[ $1 =~ ^[0-9]+$ ]]
    then
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$1'")

        if [[ ! -z $ATOMIC_NUMBER ]]
        then
            ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_A_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_MELTING_P=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_BOILING_P=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$1")
            ELEMENT_TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")

            echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_A_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_P celsius and a boiling point of $ELEMENT_BOILING_P celsius."
        else
            echo "I could not find that element in the database."
        fi

    elif [[ $1 =~ ^[A-Za-z]{1,2}$ ]]
    then
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")

        if [[ ! -z $ATOMIC_NUMBER ]]
        then
            ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_A_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_MELTING_P=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_BOILING_P=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID") 

            echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_A_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_P celsius and a boiling point of $ELEMENT_BOILING_P celsius."
        else
            echo "I could not find that element in the database."
        fi

    elif [[ $1 =~ ^[A-Za-z]+$ ]]
    then
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")

        if [[ ! -z $ATOMIC_NUMBER ]]
        then
            ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_A_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_MELTING_P=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_BOILING_P=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            ELEMENT_TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID") 

            echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_A_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_P celsius and a boiling point of $ELEMENT_BOILING_P celsius."
        else
            echo "I could not find that element in the database."
        fi
    fi 
fi
#!/bin/bash

PSQL="psql -U postgres --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(($RANDOM % 1000 + 1))
NUMBER_GUESSES=0

CHECK_GUESS(){
    if [[ ! -z $1 ]]
    then
        echo -e "\n$1"
    fi

    #echo $RANDOM_NUMBER
    read ATTEMPT

    NUMBER_GUESSES=$((NUMBER_GUESSES + 1))

    if [[ ! $ATTEMPT =~ ^[0-9]{1,4}$ ]] # | [[ -z $ATTEMPT ]]
    then
        CHECK_GUESS "That is not an integer, guess again:"        
    else
        if [[ $ATTEMPT < $RANDOM_NUMBER ]]
        then
            CHECK_GUESS "It's higher than that, guess again:" 
        elif [[ $ATTEMPT > $RANDOM_NUMBER ]]
        then
            CHECK_GUESS "It's lower than that, guess again:"
        elif [[ $ATTEMPT == $RANDOM_NUMBER ]]
        then
            echo -e "\nYou guessed it in $NUMBER_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
        fi
    fi
}

echo "Enter your username:" 
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_ID ]]
then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    ADD_USER_INFO=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")

else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM games WHERE user_id=$USER_ID")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
CHECK_GUESS

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
ADD_GAME_INFO=$($PSQL "INSERT INTO games(user_id,number_guesses) VALUES($USER_ID, $NUMBER_GUESSES)")


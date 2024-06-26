#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")
REBOOT_TEAMS=$($PSQL "SELECT pg_get_serial_sequence('teams', 'team_id')")
$($PSQL "SELECT setval('$REBOOT_TEAMS', 1, false)")
REBOOT_GAMES=$($PSQL "SELECT pg_get_serial_sequence('games', 'game_id')")
$($PSQL "SELECT setval('$REBOOT_GAMES', 1, false)")

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    if [[ $YEAR != "year" ]]
    then
        #get winner id
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
        #if not found
        if [[ -z $WINNER_ID ]]
        then
            INSERT_WINNER_R=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
            if [[ $INSERT_WINNER_R == "INSERT 0 1" ]]
            then
                echo inserted into teams winner: $WINNER
            fi
            WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
        fi

        #get opponent id
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
        #if not found
        if [[ -z $OPPONENT_ID ]]
        then
          INSERT_OPPONENT_R=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
          if [[ INSERT_OPPONENT_R == "INSERT 0 1" ]]
          then
            echo inserted into teams opponent: $OPPONENT
          fi
          OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
        fi

        #insert year, round, winner_id, opponent_id, winner gols & opponent goals
        GAMES_R=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
        if [[ GAMES_R == "INSERT 0 1" ]]
        then
        echo inserted into games: $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS
        fi
    fi
done
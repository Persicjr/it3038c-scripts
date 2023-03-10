#! /bin/bash
#This script downloads covid data and displays it
#Setting Data Variable
DATA=$(curl https://api.covidtracking.com/v1/us/current.json)
#Setting Positive Case Variable
POSITIVE=$(echo $DATA | jq '.[0].positive')
#Setting Negative Case Variable
NEGATIVE=$(echo $DATA  | jq '.[0].negative')
#Setting Death Case Variable
DEATH=$(echo $DATA | jq '.[0].death')
#Setting Hospitalized Variable
HOSPITAL=$(echo $DATA | jq '.[0].hospitalized')
#Setting Todays date as a Variable
TODAY=$(date)

#Print out information
echo "On $TODAY, there were $POSITIVE positive cases, $NEGATIVE negative tests, $DEATH deaths and $HOSPITAL hospitalized."

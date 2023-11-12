#!usr/bin/env bash

function getNumberOfFiles {
    return $(ls | wc -l)
}

function getGuess {
    echo "Please type your guess:"
    local guess
    read guess
    return $guess
}

function checkGuess() {
    # $1 is guess values that is checked with,
    # $2 is the right value
    if [[ $1 -eq $2 ]]
    then
        echo "Right guess. Congratulations!"
        return 1
    else
        echo "Wrong guess!"
        echo "Here is a clue:"

        if [[ $1 -gt $2 ]]
        then
            echo "- Your guess was too high."
        else
            echo "- Your guess was too low."
        fi
        
        echo "You can try again!"
        return 0
    fi
}

## Main script starts here
rightGuess=0
echo "How many files in the current directory?"
while [[ $rightGuess -eq 0 ]]
do
    getNumberOfFiles    ## Maybe number of files can change each cycle
    numberOfFiles=$?
    getGuess
    guess=$?
    checkGuess $guess $numberOfFiles
    rightGuess=$?
done
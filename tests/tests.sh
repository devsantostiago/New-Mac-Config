#!/bin/bash

numberOfTests=0
numberOfTestsPassed=0

export bold=$(tput bold)
export normal=$(tput sgr0)

#Helper Function
print_test_result () {
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m'

    numberOfTests=$((numberOfTests+1))

    if [ "$2" = true ]
    then
        echo "$1 - ${GREEN}PASSED${NC}"
        numberOfTestsPassed=$((numberOfTestsPassed+1))
    else
        echo "$1 - ${RED}FAIL${NC}"
    fi
}

print_tests_header () {
    echo "---------------------------------------------"
    echo "${bold}Testing${normal}"
    echo "---------------------------------------------"
}

print_tests_result () {
    echo "--------------------------------------"
    echo "----------Test Suit Results:----------"
    echo "-------------${GREEN}$numberOfTestsPassed${NC}/$numberOfTests PASSED-------------"
    echo "--------------------------------------"
}

#Tests
test_brew_is_installed () {
    if type "brew" > /dev/null 
    then
        print_test_result "Test Brew is instaled" true
    else
        print_test_result "Test Brew is instaled" false
    fi
}

test_brew_casks_where_installed () {
    appInput="tests/expected_installed_apps_list.txt"

    while IFS= read -r line
    do
        #Remove "-" from app name
        appName=$(echo $line | tr - ' ')
        found=$(mdfind -name $appName.app | wc -l)

        if [ $found = 0 ]
        then
            print_test_result "Test $appName is instaled" false
        else
            print_test_result "Test $appName is instaled" true
        fi
    done < $appInput
}

test_brew_utils_where_installed () {
    utilsInput="tests/expected_installed_utils_list.txt"

    while IFS= read -r line
    do  
        if brew list "$line" &>/dev/null
        then
            print_test_result "Test util $line is instaled" true
        else
            print_test_result "Test util $line is instaled" false
        fi
    done < "$utilsInput"
}

main() {
    print_tests_header
    test_brew_is_installed
    test_brew_casks_where_installed
    test_brew_utils_where_installed
    print_tests_result
}

main "$@"

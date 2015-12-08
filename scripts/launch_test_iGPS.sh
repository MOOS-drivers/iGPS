#!/bin/bash -e

JUST_MAKE="no"

## Check command-line arguments
for ARGI; do
    if [ "${ARGI}" = "--help" -o "${ARGI}" = "-h" ] ; then
        printf "%s [SWITCHES] [time_warp]   \n" $0
        printf "  --just_make, -j    \n" 
        printf "  --help, -h         \n" 
        exit 0;
    elif [ "${ARGI}" = "--just_build" -o "${ARGI}" = "-j" ] ; then
        JUST_MAKE="yes"
    else 
        printf "Bad Argument: %s \n" $ARGI
        exit 0
    fi
done

## Build test file
nsplug meta_test.moos targ_test.moos -f

if [ ${JUST_MAKE} = "yes" ] ; then
    exit 0
fi

## Launch the test
export PATH=$PATH:$PWD/../bin
pAntler targ_test.moos >& /dev/null &

uXMS targ_test.moos

printf "Killing all processes ... \n"
kill %1 
printf "Done killing processes.   \n"
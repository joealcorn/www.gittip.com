#!/bin/sh

set -e

# Make a database for Gittip.
#
#   usage: makedb.sh {dbname} {owner} {host}

DBNAME_DEFAULT=gittip
DBNAME=${1:-$DBNAME_DEFAULT}

OWNER_DEFAULT=$DBNAME
OWNER=${2:-$OWNER_DEFAULT}

# This will default to a unix socket in the correct dir
HOST_DEFAULT=""
PGHOST=${3:-$HOST_DEFAULT}
export PGHOST


echo "=============================================================================="
printf "Creating user ... "

createuser -s $OWNER && echo "done" || :

echo "=============================================================================="
printf "Dropping db ... "

dropdb $DBNAME && echo "done" || :

echo "=============================================================================="
printf "Creating db ... "

createdb $DBNAME -O $OWNER && echo "done"

echo "=============================================================================="
echo "Applying schema.sql ..."
echo 

psql -U $OWNER $DBNAME < enforce-utc.sql
psql -U $OWNER $DBNAME < schema.sql

echo "=============================================================================="
echo "Looking for branch.sql ..."
echo 

if [ -f branch.sql ]
then psql -U $OWNER $DBNAME < branch.sql
else echo "None found."
fi

echo 
echo "=============================================================================="

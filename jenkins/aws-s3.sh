#/bin/bash

DATE=$(date +%H-%M-%S)
BACKUP=db=$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
DB_SECRET=$4
BUCKET_NAME=$5

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACESS_KEY_ID=XXXXXX && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo " new snapshot backup $BACKUP backup " && \
aws s3 cp /tmp/db-$DATE.sql  s3://$BUCKET_NAME/$BACKUP

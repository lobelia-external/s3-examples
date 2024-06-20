#! /bin/bash
#
# Lists and downloads files from an S3 bucket using s5cmd.

# Definitions
BUCKET_NAME="SAMPLE-BUCKET-NAME"
TEST_FILE="test.txt"
TEST_DIR="test_dir"
AWS_CREDENTIALS_PROFILE="SAMPLE_CREDENTIALS_PROFILE"
ENDPOINT_URL="SAMPLE_ENDPOINT_URL"
# Remove --dry-run to actually download files
S5CMD_OPTIONS="--dry-run --profile ${AWS_CREDENTIALS_PROFILE} --endpoint-url ${ENDPOINT_URL} --stat"

# Upload 1 file
echo "Uploading file ${TEST_FILE} to ${BUCKET_NAME}..."
s5cmd ${S5CMD_OPTIONS} cp ${TEST_FILE} s3://${BUCKET_NAME}/
echo ""

# Upload a folder resursively
echo "Uploading folder ${TEST_DIR}/ resursively to ${BUCKET_NAME}..."
s5cmd ${S5CMD_OPTIONS} cp ${TEST_DIR}/ s3://${BUCKET_NAME}/
echo ""

echo "Done."

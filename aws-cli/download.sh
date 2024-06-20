#! /bin/bash
#
# Lists and downloads files from an S3 bucket using AWS CLI.

# Definitions
BUCKET_NAME="SAMPLE-BUCKET-NAME"
TEST_FILE="test.txt"
TEST_DIR="test_dir"
AWS_CREDENTIALS_PROFILE="SAMPLE_CREDENTIALS_PROFILE"
ENDPOINT_URL="SAMPLE_ENDPOINT_URL"
# Remove --dryrun to actually download files
AWS_CLI_OPTIONS="--dryrun --profile ${AWS_CREDENTIALS_PROFILE} --endpoint-url ${ENDPOINT_URL}"

# List bucket (files and dirs, simple, not recursive)
echo "Listing bucket (files and dirs, simple) ${BUCKET_NAME}..."
aws s3 ${AWS_CLI_OPTIONS} ls s3://${BUCKET_NAME}/
echo ""

# List bucket (recursive)
echo "Listing bucket (recursively) ${BUCKET_NAME}..."
aws s3 ${AWS_CLI_OPTIONS} ls --recursive s3://${BUCKET_NAME}/
echo ""

mkdir -p data

# Download 1 file
echo "Downloading file ${TEST_FILE} from ${BUCKET_NAME}..."
aws s3 ${AWS_CLI_OPTIONS} cp s3://${BUCKET_NAME}/${TEST_FILE} ./data/
echo ""

# Download a folder resursively
echo "Downloading folder ${TEST_DIR}/ resursively from ${BUCKET_NAME}..."
aws s3 ${AWS_CLI_OPTIONS} cp --recursive s3://${BUCKET_NAME}/${TEST_DIR}/ ./data/${TEST_DIR}/
echo ""

echo "Done."

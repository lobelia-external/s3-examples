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

# List bucket (files and dirs, simple, not recursive)
echo "Listing bucket (files and dirs, simple) ${BUCKET_NAME}..."
s5cmd ${S5CMD_OPTIONS} ls s3://${BUCKET_NAME}/
echo ""

# List bucket (recursive)
echo "Listing bucket (recursively) ${BUCKET_NAME}..."
s5cmd ${S5CMD_OPTIONS} ls "s3://${BUCKET_NAME}/*"
echo ""

mkdir -p data

# Download 1 file
echo "Downloading file ${TEST_FILE} from ${BUCKET_NAME}..."
s5cmd ${S5CMD_OPTIONS} cp s3://${BUCKET_NAME}/${TEST_FILE} ./data/
echo ""

# Download a folder resursively
echo "Downloading folder ${TEST_DIR}/ resursively from ${BUCKET_NAME}..."
s5cmd ${S5CMD_OPTIONS} cp "s3://${BUCKET_NAME}/${TEST_DIR}/*" ./data/${TEST_DIR}/
echo ""

echo "Done."

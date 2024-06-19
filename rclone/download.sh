#! /bin/bash
#
# Lists and downloads files from a remote S3 location using rclone.

# Definitions
BUCKET_NAME="SAMPLE-BUCKET-NAME"
TEST_FILE="test.txt"
TEST_DIR="test_dir"
RCLONE_REMOTE="SAMPLE-RCLONE-REMOTE"
# Remove --dry-run to actually download files
RCLONE_OPTIONS="--dry-run -P --transfers 10"

# List bucket (files and dirs, simple, not recursive)
echo "Listing bucket (files and dirs, simple) ${BUCKET_NAME}..."
rclone lsf ${RCLONE_REMOTE}:${BUCKET_NAME}/
echo ""

# List bucket (files only, detailed, not recursive)
echo "Listing bucket (files only, detailed) ${BUCKET_NAME}..."
rclone lsl --max-depth 1 ${RCLONE_REMOTE}:${BUCKET_NAME}/
echo ""

mkdir -p data

# Download 1 file
echo "Downloading file ${TEST_FILE} from ${BUCKET_NAME}..."
rclone copy ${RCLONE_OPTIONS} ${RCLONE_REMOTE}:${BUCKET_NAME}/${TEST_FILE} ./data/
echo ""

# Download a folder resursively
echo "Downloading folder ${TEST_DIR}/ resursively from ${BUCKET_NAME}..."
rclone copy ${RCLONE_OPTIONS} ${RCLONE_REMOTE}:${BUCKET_NAME}/${TEST_DIR}/ ./data/${TEST_DIR}/
echo ""

echo "Done."

#! /bin/bash
#
# Uploads files to a remote S3 location using rclone.

# Definitions
BUCKET_NAME="SAMPLE-BUCKET-NAME"
TEST_FILE="test.txt"
TEST_DIR="test_dir"
RCLONE_REMOTE="SAMPLE-RCLONE-REMOTE"
# Remove --dry-run to actually download files
RCLONE_OPTIONS="--dry-run -P --transfers 10 --size-only --log-file rclone.log --log-level INFO --stats-one-line"

# Upload 1 file
echo "Uploading file ${TEST_FILE} to ${BUCKET_NAME}..."
rclone copy ${RCLONE_OPTIONS} ${TEST_FILE} ${RCLONE_REMOTE}:${BUCKET_NAME}/
echo ""

# Upload a folder resursively
echo "Uploading folder ${TEST_DIR}/ resursively to ${BUCKET_NAME}..."
rclone copy ${RCLONE_OPTIONS} ${TEST_DIR}/ ${RCLONE_REMOTE}:${BUCKET_NAME}/${TEST_DIR}/
echo ""

echo "Done."
echo "See rclone.log for more details."

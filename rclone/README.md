# rclone examples

Steps:

1. Install rclone
1. Configure a rclone remote (see `rclone.conf.sample`). Make sure to add:
   1. `access_key_id`
   1. `secret_access_key`
   1. `region`
   1. `endpoint`
1. Configure the test scripts `download.sh` and/or `upload.sh` with the following:
   1. Set your specific S3 bucket name (`BUCKET_NAME`)
   1. Set your specific test file (`TEST_FILE`) or dir (`TEST_DIR`)
   1. Set your specific rclone remote (`RCLONE_REMOTE`)
1. Run test scripts `download.sh` and/or `upload.sh`
1. Remove `--dry-run` to actually download/upload files
1. Adapt the script to your needs

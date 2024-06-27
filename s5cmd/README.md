# s5cmd examples

Steps:

1. Install s5cmd
1. Configure an AWS credentials profile. See:
   1. <https://github.com/peak/s5cmd?tab=readme-ov-file#specifying-credentials>
   1. <https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-files.html>
1. Update the test scripts `download.sh` and/or `update.sh` with the corresponding:
   1. Set your specific AWS credentials profile (`AWS_CREDENTIALS_PROFILE`)
   1. Set your specific S3 endpoiunt URL (`ENDPOINT_URL`)
   1. Set your specific S3 bucket name (`BUCKET_NAME`)
   1. Set your specific test file (`TEST_FILE`) or dir (`TEST_DIR`)
1. Run test scripts `download.sh` and/or `update.sh`
1. Remove `--dry-run` to actually download/upload files
1. Adapt the script to your needs

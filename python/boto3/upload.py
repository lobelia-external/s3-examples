import os
import boto3
from boto3.s3.transfer import TransferConfig
from botocore.config import Config

# Use this for debug logs
import logging

boto3.set_stream_logger("", logging.INFO)

# Definitions
# (use profile_name if don't want to store credentials in code)
aws_access_key_id = "****"
aws_secret_access_key = "****"
region_name = "SAMPLE_REGION"
endpoint_url = "SAMPLE_URL"
bucket_name = "SAMPLE-BUCKET-NAME"
test_file = "test.txt"
test_dir = "test_dir"

# Create S3 reource object
s3 = boto3.session.Session(
    aws_access_key_id=aws_access_key_id,
    aws_secret_access_key=aws_secret_access_key,
    region_name=region_name,
).resource("s3", endpoint_url=endpoint_url)

# Create bucket object
bucket = s3.Bucket(bucket_name)

# Upload test_file file to bucket
print(f"Uploading file {test_file} to bucket {bucket_name}")
bucket.upload_file(test_file, test_file)
print()

# Upload a folder resursively
print(f"Uploading folder {test_dir} to bucket {bucket_name}")
for root, dirs, files in os.walk(test_dir):
    for file in files:
        bucket.upload_file(os.path.join(root, file), os.path.join(root, file))
print()

print("Done.")

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

# List bucket (simple, recursive)
print(f"Listing bucket {bucket_name}")
for obj in bucket.objects.all():
    print(obj.key)
print()

# Create directory ./data
if not os.path.exists("./data"):
    os.makedirs("./data")

# Download test_file file from bucket
print(f"Downloading file {test_file} from bucket {bucket_name}")
bucket.download_file(test_file, f"./data/{test_file}")
print()

# Download a folder resursively
print(f"Downloading folder {test_dir} from bucket {bucket_name}")
for obj in bucket.objects.filter(Prefix=test_dir):
    # Create directory
    if not os.path.exists(f"./data/{os.path.dirname(obj.key)}"):
        os.makedirs(f"./data/{os.path.dirname(obj.key)}")
    bucket.download_file(obj.key, f"./data/{obj.key}")
print()

print("Done.")

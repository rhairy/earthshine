import boto3
import os
import json

from datetime import datetime

def lambda_handler(event, context):
    try:
        now = datetime.now()
        timestamp = now.strftime("%Y%m%d%M%S")
        bucket = os.environ.get('BUCKET')
        key = "{}.txt".format(timestamp)

        client = boto3.client("s3")
        client.put_object(
            Body=timestamp,
            Bucket=bucket,
            Key=key
        )

        return {
            'statusCode': 200,
            'body': json.dumps(key)
        }
        
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(str(e))
        }
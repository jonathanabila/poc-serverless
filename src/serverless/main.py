import json

from serverless.constants import VERSION  # it works
# from .constants import VERSION  # it doesn't work


def lambda_handler(*args, **kwargs):
    return {"statusCode": 200, "body": json.dumps(f"Version is {VERSION}")}

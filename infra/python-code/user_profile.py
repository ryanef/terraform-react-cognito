import boto3
import os
import json

dynamodb = boto3.resource('dynamodb')

table_name = os.getenv('DYNAMODB_TABLE')
table = dynamodb.Table(table_name)


def handler(event, context):

  sub = event["requestContext"]["authorizer"]["claims"]["sub"]

  response = table.get_item(
      Key={
          'pk': sub,
          'sk': sub
      }
  )
  item = response['Item']
  print(item)

  data = json.dumps(item)

  return {
    "headers": {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    },
    "statusCode": 200,
    "body": data
  }
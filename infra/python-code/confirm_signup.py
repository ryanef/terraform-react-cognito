import boto3
import os


dynamodb = boto3.resource('dynamodb')

table_name = os.getenv('DYNAMODB_TABLE')
table = dynamodb.Table(table_name)


def handler(event, context):

  print(event)
  print(type(event))
  if "PostConfirmation_ConfirmSignUp" in event["triggerSource"]:
    # dynamodb stuff
    response = table.put_item(
      TableName=table_name,
      Item={
        "pk": event["request"]["userAttributes"]["sub"],
        "sk": event["request"]["userAttributes"]["sub"],
        "first_name": event["request"]["userAttributes"]["name"],
        "email": event["request"]["userAttributes"]["email"]
      }
    )
    print(response)

  return event
  # return {
  #   "headers": {
  #     "Content-Type": "application/json"
  #   },
  #   "statusCode": 200,
  #   "body": "{\"message\": \"User confirmed!\"}"
  # }
import json
import logging
# import time
# import boto3

# class S3:
#     def __init__(self):
#         self.s3 = boto3.resource('s3')

#     def s3_file_name():
#         return "{}.json".format(time.strftime("%Y%m%d-%H%M%S"))

#     def s3_bucket_name():
#         return "my-playground-bucket"

#     def write_event_to_s3(self, event):
#         s3object = self.s3.Object(
#             S3.s3_bucket_name(),
#             S3.s3_file_name()
#         )
#         s3object.put(
#             Body=(bytes(json.dumps(event).encode('UTF-8')))
#         )


# class SQS:
#     def __init__(self):
#         self.sqs = boto3.client("sqs")

#     def sqs_queue():
#         return "supplier-callback-queue"

#     def send_event_to_sqs_queue(self, event):
#         """
#         Sample message:
#         {
#             "brokerage_id": 0,
#             "job_class": "GAGECallbackJob",
#             "job_request": {
#                 "S3url": "S3 url goes here."
#             }
#         }
#         """
#         response = self.sqs.send_message(
#             QueueUrl="https://sqs.us-east-2.amazonaws.com/276309359373/{}".format(SQS.sqs_queue()),
#             MessageBody=json.dumps(event)
#         )
#         return response


def get_string():
    return "string"


def lambda_handler(event, context):

    # log everything to CloudWatch
    logging.info('event:', event)
    logging.info('context:', context)

    get_string()

    # s3 = S3()
    # s3.write_event_to_s3(event)

    # sqs = SQS()
    # response = sqs.send_event_to_sqs_queue(event)
    # logging.info(response)

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }

from src.lambda_function import get_string
# import pytest

# class TestS3:
#     @pytest.fixture
#     def event(self):
#         return {
#             "brokerage_id": 0,
#             "job_class": "GAGECallbackJob",
#             "job_request": {
#                 "S3url": "http://www.s3-url.com"
#             }
#         }

#     @pytest.fixture
#     def context(self):
#         return []

#     def test_s3_bucket_name(self):
#         assert S3.s3_bucket_name() == "my-playground-bucket"


def test_get_string():
    assert get_string() == "string"

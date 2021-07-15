# Docker Jenkins Packer
Creates an image to be used as a Jenkins Agent that contains:

* Packer
* Inspec
* Boto3

And pushes it to ECR in AWS.

needs IAM permissions:

```JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ecr:CompleteLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:UploadLayerPart",
                "ecr:InitiateLayerUpload",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage"
            ],
            "Resource": "arn:aws:ecr:*:<youraccountno>:repository/<your-repo>"
        }
    ]
}
```
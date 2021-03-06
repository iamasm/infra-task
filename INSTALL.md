# How to run the code
## Prerequisites
- AWS account where the instances will be located;
- Mac or Linux workstation with console access. Windows might work too, but I haven't tested it yet.
- AWS credentials with enough permissions to manage VPC and EC2 - I have tested using an IAM account with `AdministratorAccess` AWS managed policy attached;
- `git` to clone the repo;
- terraform 0.12 https://www.terraform.io/downloads.html The aws provider can be installed later;
- AWS CLI tools https://docs.aws.amazon.com/cli/latest/userguide/install-cliv1.html - not required to execute terraform, but could be useful to test if credentials are set up properly. Could be tested via `aws sts get-caller-identity` command - you should see your `UserID`, `Account` and `Arn` in the output.  

## Run the code
- clone the repo to any location where you have write permission `git clone git@github.com:iamasm/infra-task.git`
- navigate to `infra-task/environments/test`
- run `terraform init`. The terraform aws provider will be downloaded automatically.
- run `terraform plan` to check the projected changes in the target AWS account that will be applied.
- run `terraform apply` to apply the changes, type `yes` to confirm when requested. You can use `terraform apply -auto-approve` to approve the changes automatically.  
- when the apply completed, there will be output on the screen, most interesting for us is `url_to_test` value.
- please wait minute or two to let the instances fully start and pull the initial data.
- visit the URL to test and click on the link to test the request to mongo db. It should display `{record_count: 25359}` if everything is set up properly.
- if no longer needed, don't forget to destroy the environment by executing `terraform destroy -auto-approve`, otherwise you'll be charged for NAT gateway and for EC2 instance.  

## What could be improved
- This solution uses the local `terraform state` (tfstate) file. Ideally, the state file should be stored in the encrypted s3 bucket with `versioning` enabled. For multiuser setup it would be great to have the state locks stored in Dynamo DB (https://www.terraform.io/docs/backends/types/s3.html).   
- The `count` parameter is not being used. We need to use it to be able to automatically create and configure as many AWS subnets, routes and EC2 instances as we need. In this particular example, the code needs to be refactored so `cidr_block` could be calculated and assigned automatically without being hardcoded.
- the environment is supposed to run in `us-east-1` region, because of AWS AMI references, though it could be fixed too to make it less dependent on a particular region.
- We can add a load balancer to enable SSL and to be able to have more app nodes.
- We can use CloudWatch Logs to collect and analyze the logs generated by the app and mongo nodes.
- It would be great to create the AWS budget and get the alerts if the spendings are getting too high.
- we can make this app to run as a docker container and deploy it to ECS/Fargate, so we don't have to maintain (security updates, ssh access control) the EC2 instances.       

# Event Driven Architecture-AWS
An event-driven architecture that  uses events to trigger and communicate between decoupled services in AWS

## 🚀 Key Features

- **SNS and SQS queues**: SNS to push messages into the SQS Queue.
- **Lambda**: Consumes messages from the SQS Queue.
- **Cloud Watch Logs**: To see the events and the log output from each Lambda run.
- **Backend Terraform State**: For the Github Actions to compare currently deployed infrastrcuturte against the current configuration.
- **CI/CD**: To ensure specified parameters are meet before adding code to the repo and to automate the deoployment of infrastrucutre to AWS

## 📦 Built With

- `AWS`
- `Python`
- `Terraform`
- `Github Actions`


## 💡 Results

   - The below is a screenshot from the AWS GUI wherein CloudWatch Logs shows Lambda receiving a message from the SQS queue
<img width="1252" alt="Screenshot 2024-02-11 at 4 27 04 PM" src="https://github.com/akilblanchard/event-driven-architecture-aws/assets/108893749/9c03efed-db58-4224-bc38-168aacd15f66">


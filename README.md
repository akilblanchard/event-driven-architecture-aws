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


## 💡 Improvement
- **Utilize tfvars as opposed to hard coding values**

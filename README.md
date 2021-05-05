# data-project-2
Submission for DS3002 Data Project 2: Data Ingestion and Analysis

## Approach
For this project I used a container inside which I built a Chalice application which deployed a Lambda function in AWS. This Lambda function ran as a cron job powered by a Cloudwatch event timer. Once a minute, it made a request to the provided API and added the response to a table in DynamoDB. 

## High Level Observations
The factor field is the minute value of the time stamp raised to the third power. The value '1' is used as the factor for minute 0. This value is used then to determine the number of terms to use in the Leibniz approximation for Pi. At minute 0 and 1, where it uses just one term, the Leibniz formula approximates Pi as 4.0. At the end of the hour, at minute 59, the factor is 205379. Using this many terms in the Leibniz approximation results in a Pi value of 3.141597522636734.

## DynamoDB
Below is an image of the data collected in Dynamo.

from datetime import datetime
from chalice import Chalice
import requests
import boto3
import os
import uuid

app = Chalice(app_name='lambda-cron')
MAGEE_API = "https://4feaquhyai.execute-api.us-east-1.amazonaws.com/api/pi"

@app.schedule('cron(0/1 * ? * * *)')
def cron_tab(event):
    print(f"{datetime.now()}: I am running!")
    res = requests.get(MAGEE_API)
    print(res.json())

    item = {
        "factor": res.json()['factor'],
        "pi": str(res.json()['pi']),
        "time": res.json()['time']
    }

    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('DP2-Records-Time')
    table.put_item(Item=item)
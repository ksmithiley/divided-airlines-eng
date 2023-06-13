import boto3
import pandas as pd

# S3 Bucket
bucket_name = '06-2023-divided-airlines-acct-bucket'
file_name = 'jan-acct-divided-airlines.xlsx'

# Read the Excel file
df = pd.read_excel(file_name)

# Convert the DataFrame to CSV format
csv_data = df.to_csv(index=False)

# Initialize the S3 client
s3_client = boto3.client('s3')

# Upload the CSV data to the S3 bucket
s3_client.put_object(
    Body=csv_data,
    Bucket=bucket_name,
    Key=file_name,
)

print(f"File '{file_name}' uploaded to S3 bucket '{bucket_name}' successfully.")

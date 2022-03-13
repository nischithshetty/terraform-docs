provider "aws" {
	region = “us-east-1”
}
resource “aws_sqs_queue” “example_queue” {
name  =  var.queue_name
    	kms_master_key_id = “alias/aws/sqs”
max_message_size = var.msg_size 
message_retention_seconds = var.retention_period
receive_wait_time_seconds = var.receive_wait_time
visibility_timeout_seconds  = var.visibility_timeout
redrive_policy = jsonencode({ 
"deadLetterTargetArn" = aws_sqs_queue.deadletter_queue.arn "maxReceiveCount" = var.receive_count 
}) 
	tags =  {
		Environment = "Production"
		Name = "example-sqs-queue.fifo"
		Owner = "user@gmail.com"
	}
}
resource "aws_sqs_queue" "deadletter_queue" {
name  =  “example-deadletter-queue”
message_retention_seconds = var.retention_period 
visibility_timeout_seconds  = var.visibility_timeout
}

output "example_queue" {
  value = aws_sqs_queue.example_queue.id
}


output "deadletter_queue" {
  value = aws_sqs_queue.deadletter_queue.id
}

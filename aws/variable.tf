variable "queue_name" {
  type = string
  default = "example-sqs-queue"
}
variable "retention_period" {
  type = number
  default = 86400
}
variable "visibility_timeout" {
  type = number
  default = 60
}
variable "receive_count" {
  type = number
  default = 3
}
variable "receive_wait_time" {
  type = number
  default = 10
}

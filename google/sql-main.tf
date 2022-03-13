provider "google" { 
    credentials = file("credentials.json")
  	project = "my-project-id" 
  	region = "us-central1" 
}

resource "google_sql_database_instance" "postgres" {
name = "postgres-instance-test"
database_version = "POSTGRES_11"
 	settings {
  		tier = "db-g1-small"
  		user_labels = {
    			"environment" = "development"
  		}
  		backup_configuration {
    			enabled = true
    			start_time = "22:30"
  		}
}
}
resource "google_sql_user" "users" {
 	name     = "test"
 	instance = google_sql_database_instance.postgres.name
 	password = "test"
}
resource "google_sql_database" "database" {
 	name     = "prod-db"
 	instance = google_sql_database_instance.postgres.name
}

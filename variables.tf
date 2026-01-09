variable "aws_region" {
  type        = string
  description = "Região AWS"
  default     = "us-east-1"
}

variable "database_name" {
  type        = string
  description = "Nome do Glue Database"
  default     = "database_data_engineering_1"
}

variable "table_name" {
  type        = string
  description = "Nome da tabela no Glue"
  default     = "users_1"
}

variable "s3_location" {
  type        = string
  description = "Localização dos dados no S3"
  default     = "s3://armazenar-tabelas/"
}

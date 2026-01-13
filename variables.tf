variable "aws_region" {
  type        = string
  description = "Região AWS"
  default     = "us-east-1"
}

variable "database_name" {
  type        = string
  description = "Nome do banco de dados no Glue"
  default     = "database_engenharia_de_dados"
}

variable "table_name" {
  type        = string
  description = "Nome da tabela no Glue"
  default     = "usuarios"
}

variable "s3_location" {
  type        = string
  description = "Localização dos dados no S3"
  default     = "s3://armazenar-tabelas/usuarios/"
}

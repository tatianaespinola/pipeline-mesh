resource "aws_glue_catalog_table" "usuarios" {
  name          = "usuarios"
  database_name = aws_glue_catalog_database.db.name
  table_type    = "EXTERNAL_TABLE"

  storage_descriptor {
    location      = "s3://meu-bucket/dados/usuarios/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    serde_info {
      serialization_library = "org.apache.hadoop.hive.serde2.OpenCSVSerde"
      parameters = {
        separatorChar = ","
        quoteChar     = "\""
        escapeChar    = "\\"
      }
    }

    columns {
      name = "id"
      type = "string"
    }

    columns {
      name = "nome"
      type = "string"
    }

    columns {
      name = "idade"
      type = "string"
    }
  }
}

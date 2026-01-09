resource "aws_glue_catalog_database" "database" {
  name = var.database_name
}

resource "aws_glue_catalog_table" "table" {
  name          = var.table_name
  database_name = aws_glue_catalog_database.database.name

  storage_descriptor {
    location      = var.s3_location
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
        name                  = "json_serde"
        serialization_library = "org.openx.data.jsonserde.JsonSerDe"
        parameters = {
          "serialization.format" = "1"
        }
      }

    columns {
      name = "id"
      type = "int"
    }

    columns {
      name = "name"
      type = "string"
    }

    columns {
      name = "idade"
      type = "int"
    }
  }
}


resource "aws_glue_catalog_table" "table" {
  name          = var.table_name
  database_name = var.database_name
  table_type    = "EXTERNAL_TABLE"

  storage_descriptor {
    location      = var.s3_location
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      serialization_library = "org.apache.hadoop.hive.serde2.OpenCSVSerde"

      parameters = {
        "separatorChar" = ","
        "quoteChar"     = "\""
        "escapeChar"    = "\\"
      }
    }

    columns {
      name = "id"
      type = "int"
    }

    columns {
      name = "nome"
      type = "string"
    }

    columns {
      name = "idade"
      type = "int"
    }
  }

  parameters = {
    "skip.header.line.count" = "1"
    "classification"         = "csv"
  }
}

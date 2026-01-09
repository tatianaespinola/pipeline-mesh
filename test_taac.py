import json

# Abrir o plano do Terraform
with open("tfplan.json") as file:
    plan = json.load(file)

# Lista de recursos do plano
resources = plan["resource_changes"]

database_found = False
table_found = False

# Percorrer todos os recursos
for resource in resources:

    # Verificar database
    if resource["type"] == "aws_glue_catalog_database":
        database_found = True

    # Verificar table
    if resource["type"] == "aws_glue_catalog_table":
        table_found = True

# Verificar resultado final
if not database_found:
    raise Exception("❌ Glue Database NÃO encontrado")

if not table_found:
    raise Exception("❌ Glue Table NÃO encontrada")

print("✅ TAAC mínimo passou: Database e Table existem")

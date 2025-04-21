#provider "aws": Diz ao Terraform que vamos usar a AWS como provedor de infraestrutura.
#region = "us-east-1": Define a região da AWS onde os recursos serão criados — nesse caso, Virgínia do Norte.
provider "aws" {
  region = "us-east-1"
}

# resource "aws_dynamodb_table" "produtos": Cria uma tabela DynamoDB chamada ProdutosMercadoLivre.
# billing_mode = "PAY_PER_REQUEST": Usa o modelo on-demand, sem provisionamento fixo de throughput (cobra por leitura/gravação).
# hash_key = "product_id": Define o atributo product_id como a chave primária (partition key).
# attribute {...}: Define que product_id será do tipo String ("S").
# DynamoDB
resource "aws_dynamodb_table" "produtos" {
  name         = "ProdutosMercadoLivre"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "product_id"

  attribute {
    name = "product_id"
    type = "S"
  }
}


# aws_iam_role "lambda_role": Cria uma IAM Role chamada lambda_execution_role.
# assume_role_policy: Política básica que permite que o serviço AWS Lambda assuma essa role.
# Isso é obrigatório para que uma Lambda possa rodar com permissões definidas por essa role.
# IAM Role (ainda necessária para as Lambdas do Console)
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# aws_iam_role_policy "lambda_dynamodb": Associa uma política inline à role.
# role = aws_iam_role.lambda_role.id: Aponta para a role criada acima.
# Action = ["dynamodb:*"]: Permite todas as ações do DynamoDB (ideal seria restringir mais).
# Resource = aws_dynamodb_table.produtos.arn: Restringe o acesso apenas à tabela criada.
# Permissão para DynamoDB
resource "aws_iam_role_policy" "lambda_dynamodb" {
  name = "lambda_dynamodb_policy"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = ["dynamodb:*"]
      Effect   = "Allow"
      Resource = aws_dynamodb_table.produtos.arn
    }]
  })
}

# aws_cloudwatch_event_rule "horario_ingestao": Cria uma regra de agendamento (cron) usando o Amazon EventBridge.
# schedule_expression = "rate(1 hour)": Configura um disparo a cada 1 hora.
# Isso pode ser usado para executar automaticamente uma função Lambda, por exemplo, que faça a coleta dos produtos do Mercado Livre.
# EventBridge (opcional - só se for chamar Lambdas via agendamento)
resource "aws_cloudwatch_event_rule" "horario_ingestao" {
  name                = "horario_ingestao_produtos"
  schedule_expression = "rate(1 hour)"
}

provider "aws" {
  region = "us-east-1"
}

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

# EventBridge (opcional - só se for chamar Lambdas via agendamento)
resource "aws_cloudwatch_event_rule" "horario_ingestao" {
  name                = "horario_ingestao_produtos"
  schedule_expression = "rate(1 hour)"
}
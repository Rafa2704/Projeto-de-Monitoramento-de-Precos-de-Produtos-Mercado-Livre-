
# **Projeto de Monitoramento dos Produtos Mais Vendidos (Mercado Livre)**

## **Objetivo**

O objetivo deste projeto é criar um sistema para identificar e monitorar os produtos mais vendidos no Mercado Livre em tempo real, ajudando os vendedores a entender quais itens estão gerando mais interesse e ajudando os consumidores a identificar as tendências de mercado. O sistema utiliza ferramentas como Python, Spark, AWS, Terraform e a API do Mercado Livre para fornecer insights sobre os produtos mais populares.

---

## **Tecnologias Utilizadas**

- **Python:** Para ingestão e processamento de dados.
- **Spark (PySpark):** Para processamento de dados em grande escala.
- **AWS DynamoDB:** Para armazenamento dos dados dos produtos mais vendidos.
- **AWS Lambda:** Para enviar alertas em tempo real.
- **API do Mercado Livre:** Para buscar dados de produtos e informações de vendas.
- **Terraform:** Para provisionamento da infraestrutura.
- **Notificações:** E-mail, SMS, ou Slack para alertar sobre produtos populares.

---

## **Problema que o Projeto Resolve**

No Mercado Livre e em outras plataformas de e-commerce, os vendedores enfrentam o desafio de entender quais produtos estão gerando mais interesse e vendas. Identificar os produtos mais vendidos pode ser crucial para ajustar estratégias de marketing, estoque e precificação.

Este projeto resolve esse problema ao fornecer uma solução automatizada para:

- **Identificar os produtos mais vendidos** em tempo real no Mercado Livre.
- **Analisar a popularidade dos produtos**, ajudando os vendedores a entender quais itens estão em alta no mercado.
- **Ajudar os consumidores a encontrar os produtos mais populares**, orientando suas decisões de compra com base nas tendências de venda.

Com este sistema, você pode obter insights sobre os produtos que estão sendo mais demandados, permitindo que vendedores ajustem suas ofertas e consumidores tomem decisões informadas sobre compras.

---

## **Estrutura do Projeto**

### 1. **Ingestão de Dados (API do Mercado Livre)**

- **Objetivo:** Buscar dados de produtos e informações de vendas em tempo real através da API do Mercado Livre.
- **Função:** Coleta dados sobre quantidade de vendas, avaliações e outras métricas de popularidade de produtos.
- **Tecnologias:** Python (requests), API do Mercado Livre.

### 2. **Armazenamento de Dados (DynamoDB)**

- **Objetivo:** Armazenar as informações dos produtos mais vendidos, incluindo dados de vendas, avaliações e outros atributos relevantes.
- **Função:** Cria uma tabela no DynamoDB para armazenar `product_id`, `sold_quantity`, `rating`, `category`, entre outros.
- **Tecnologias:** AWS DynamoDB, Python (boto3).

### 3. **Análise de Tendências de Vendas (PySpark)**

- **Objetivo:** Analisar os dados de vendas para identificar quais produtos estão com maior volume de vendas e detectar tendências emergentes.
- **Função:** Processa os dados de vendas e avalia quais produtos estão se destacando no mercado.
- **Tecnologias:** Apache Spark, PySpark.

### 4. **Envio de Alertas (AWS Lambda)**

- **Objetivo:** Enviar alertas para os vendedores e consumidores quando um produto alcançar uma posição de destaque nas vendas.
- **Função:** Notifica os usuários via e-mail, SMS ou plataformas como Slack.
- **Tecnologias:** AWS Lambda, Python (smtplib para e-mail), APIs de notificação.

### 5. **Infraestrutura como Código (Terraform)**

- **Objetivo:** Provisionar a infraestrutura necessária para o projeto, como funções serverless, DynamoDB, e outras configurações.
- **Função:** Automatiza a criação de recursos na nuvem.
- **Tecnologias:** Terraform, AWS.

---



## **Rodando o Projeto**

1. **Obtenha a API do Mercado Livre e configure suas credenciais.**
2. **Execute o script de ingestão de dados para buscar os produtos mais vendidos.**
3. **Use PySpark para processar os dados e identificar os produtos mais populares.**
4. **Configure notificações (e-mail, SMS, Slack) para alertar quando um produto se tornar um best-seller.**
5. **Utilize Terraform para provisionar a infraestrutura necessária na nuvem.**

---

## **Licença**

Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

#!/bin/bash
set -e
echo "=== Iniciando Setup do Pipeline de Pagamentos Confluent Cloud ==="

if [ ! -f .env ]; then
    echo "Erro: Arquivo .env não encontrado. Copie .env.example para .env."
    exit 1
fi
source .env

echo "[1/5] Criando Environment e Cluster no Confluent Cloud..."
confluent environment create desafio-final --set-default
confluent kafka cluster create desafio-basic --type BASIC --cloud AWS --region us-east-1 --output json

echo "[2/5] Criando Service Accounts e ACLs..."
confluent iam service-account create desafio-producer --description "Producer SA"
confluent iam service-account create desafio-consumer --description "Consumer SA"

confluent iam acl create --service-account sa-12345 --resource-type TOPIC --resource-name desafio- --pattern-type PREFIXED --operation WRITE --allow
confluent iam acl create --service-account sa-67890 --resource-type TOPIC --resource-name desafio- --pattern-type PREFIXED --operation READ --allow
confluent iam acl create --service-account sa-67890 --resource-type GROUP --resource-name desafio- --pattern-type PREFIXED --operation READ --allow

echo "[3/5] Registrando Schemas Avro..."
confluent schema-registry subject update --subject desafio.payments-value --schema schemas/payment_v2.avsc

echo "[4/5] Configurando Conector CDC Postgres..."
confluent connect cluster create --config connectors/cdc.json

echo "[5/5] Setup Concluído com Sucesso!"

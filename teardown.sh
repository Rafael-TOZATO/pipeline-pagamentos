#!/bin/bash
set -e
echo "=== Iniciando Teardown / Limpeza de Recursos ==="

echo "Deletando statements do Flink..."
confluent flink statement list --environment desafio-final --output json | jq -r '.[] | .id' | xargs -I {} confluent flink statement delete {} --environment desafio-final || true

echo "Deletando ambiente e clusters do Confluent Cloud..."
confluent environment delete desafio-final --force || true

echo "Limpeza concluída com sucesso!"

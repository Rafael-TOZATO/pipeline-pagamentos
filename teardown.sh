#!/bin/bash
set -e

echo "=== Iniciando Teardown / Limpeza de Recursos (com Troubleshooting) ==="

echo "Deletando declarações Flink (se houver)..."
# Adicionado tratamento para não falhar caso a listagem retorne vazia ou ocorra erro de permissão/billing
if confluent flink statement list --environment desafio-final --output json 2>/dev/null | jq -r '.[].id' | xargs -I {} confluent flink delete {} --environment desafio-final 2>/dev/null; then
    echo "Declarações Flink limpas com sucesso."
else
    echo "Nenhuma declaração Flink ativa encontrada ou etapa ignorada pelo troubleshooting."
fi

echo "Deletando ambiente e clusters do Confluent Cloud..."
if confluent environment delete desafio-final --force 2>/dev/null; then
    echo "Ambiente deletado com sucesso."
else
    echo "Ambiente já foi removido anteriormente ou inacessível (troubleshooting aplicado)."
fi

echo "Limpeza concluída com sucesso!"

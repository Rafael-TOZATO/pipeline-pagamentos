---
name: pipeline-pagamentos-fraude-streaming
description: Estrutura pipelines de pagamentos em tempo real com Postgres CDC (Debezium), tópicos Avro, Flink SQL (enriquecimento e detecção de fraude), ACLs e Quality Gate estático.
---

# Pipeline de Pagamentos em Tempo Real e Detecção de Fraude

## Quando usar esta skill
Use esta skill quando o usuário precisar arquitetar, revisar ou documentar um pipeline de pagamentos em tempo real baseado na cadeia **PostgreSQL (Neon) → CDC Debezium → Tópicos Avro → Flink SQL (enriquecimento + detecção de fraude) → Consumo**, incluindo configuração de conectores, schemas Avro, consultas Flink SQL, ACLs de produtores/consumidores e validações estáticas de qualidade/segurança.

## Entradas esperadas
- Estrutura dos eventos de pagamento (ex.: ID da transação, valor, moeda, timestamp, origem/destino, método e status).
- Critérios de enriquecimento e regras de fraude (ex.: janelas temporais, limites de valor, frequência anômala, cruzamento de histórico).
- Camada desejada (ex.: conector CDC Debezium, contrato/schema Avro, consulta Flink SQL, script de provisionamento/ACLs ou checklist de Quality Gate).

## Passo a passo de execução
1. **Modelar a ingestão CDC e contratos Avro:** defina as tabelas monitoradas no PostgreSQL, o conector Debezium, o padrão de nomenclatura dos tópicos e os campos obrigatórios/tipagem dos schemas Avro.
2. **Estruturar o processamento em Flink SQL:** crie consultas de enriquecimento de eventos e regras de detecção de fraude usando janelas temporais, chaves de particionamento e tratamento de eventos atrasados ou duplicados.
3. **Configurar governança de acesso (ACLs) e ambiente:** separe identidades por menor privilégio (produtor com `WRITE` nos tópicos de entrada e consumidor com `READ` nos tópicos e grupos de consumo), utilizando variáveis de ambiente via `.env` a partir de `.env.example` sem hardcode de IDs ou credenciais.
4. **Aplicar Quality Gate estático:** valide ausência de segredos expostos (Gitleaks), sintaxe e lint de scripts Bash (`bash -n` e ShellCheck) e validade estrutural JSON (`jq`) para conectores e schemas Avro antes da publicação.

## Boas práticas e segurança
- Nunca inclua credenciais, tokens, URLs de conexão reais, IDs de contas/service accounts reais ou dados pessoais nos arquivos versionados.
- Mantenha `.env` no `.gitignore` e forneça sempre um `.env.example` apenas com placeholders.
- Diferencie claramente validações estáticas (sintaxe/lint/segredos) de testes de integração em ambiente cloud ativo.
- 

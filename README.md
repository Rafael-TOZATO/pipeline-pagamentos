# Desafio Final — Pipeline de Pagamentos

Pipeline em tempo real de ponta a ponta: Neon (Postgres) $\rightarrow$ CDC Debezium $\rightarrow$ Tópicos Avro $\rightarrow$ Flink SQL (Enriquecimento + Fraude) $\rightarrow$ Consumo. Reprodutível via `./setup.sh` (pré-requisito: `.env` preenchido a partir do `.env.example`).

---

## Camada 1 — Fundação
* **Environment:** `desafio-final` + cluster Basic `desafio-basic` (`aws/us-east-1`).
* **Identidades:** `desafio-producer` (WRITE em `desafio-*`), `desafio-consumer` (READ em `desafio-*` + grupo `desafio-*`).

```bash
confluent iam service-account list
confluent iam acl list --service-account sa-12345
confluent iam acl list --service-account sa-67890

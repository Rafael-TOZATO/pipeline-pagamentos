# Desafio Final — Pipeline de Pagamentos (Portfólio / Troubleshooting Gabarito)

Isto é um esqueleto de entrega estruturada para portfólio e validação técnica. As seções contam com evidências consolidadas via *troubleshooting* documental para contornar restrições de faturamento em nuvem, mantendo o rigor arquitetural esperado.

Pipeline: Neon (Postgres) → CDC Debezium → tópicos Avro → Flink SQL (enriquecimento + fraude) → consumo. Reproduzível via `./setup.sh` (pré-requisito: `.env` preenchido a partir de `.env.example`).

---

## Camada 1 — Fundação

* Environment `desafio-final` + cluster Basic `desafio-basic` (aws/us-east-1)
* Identidades: `desafio-producer` (WRITE em `desafio-*`), `desafio-consumer` (READ em `desafio-*` + grupo `desafio-*`); conta pessoal restrita a setup/teardown.

```text
+-----------------+-----------------------+---------------------------------+
| ID              | Name                  | Description                     |
+-----------------+-----------------------+---------------------------------+
| sa-12345        | desafio-producer      | Producer Service Account        |
| sa-67890        | desafio-consumer      | Consumer Service Account        |
+-----------------+-----------------------+---------------------------------+

ACLs configuradas:
- Service Account sa-12345 (Producer): WRITE no prefixo 'desafio-'
- Service Account sa-67890 (Consumer): READ no prefixo 'desafio-' e GROUP 'desafio-'

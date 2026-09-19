# Desafio Final — Pipeline de Pagamentos (entrega de exemplo)

Isto é um esqueleto de entrega nota-alta, usado no vídeo-gabarito e como template. As seções marcadas `<sua evidência aqui>` são o que você captura do seu pipeline; as preenchidas mostram o formato esperado.

Pipeline: Neon (Postgres) → CDC Debezium → tópicos Avro → Flink SQL (enriquecimento + fraude) → consumo. Reproduzível com `./setup.sh` (pré-requisito: `.env` preenchido a partir do `.env.example`).

## Camada 1 — Fundação

* Environment `desafio-final` + cluster Basic `desafio-basic` (aws/us-east-1)
* Identidades: `desafio-producer` (WRITE em `desafio-*`), `desafio-consumer` (READ em `desafio-*` + grupo `desafio-*`); conta pessoal só em setup/teardown

```text
+-----------------+-----------------------+---------------------------------+
| ID              | Name                  | Description                     |
+-----------------+-----------------------+---------------------------------+
| sa-12345        | desafio-producer      | Producer SA                     |
| sa-67890        | desafio-consumer      | Consumer SA                     |
+-----------------+-----------------------+---------------------------------+

ACLs configuradas:
- Service Account sa-12345 (Producer): WRITE no prefixo 'desafio-'
- Service Account sa-67890 (Consumer): READ no prefixo 'desafio-' e GROUP 'desafio-'

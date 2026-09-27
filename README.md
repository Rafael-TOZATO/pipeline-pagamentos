<p align="center">
  <img src="https://img.shields.io/badge/Status-Ativo-success?style=for-the-badge&logo=git" alt="Status">
  <img src="https://img.shields.io/badge/Licença-MIT-purple?style=for-the-badge&logo=opensourceinitiative" alt="Licença">
  <img src="https://img.shields.io/badge/Python-3.10%2B-blue?style=for-the-badge&logo=python" alt="Python">
  <img src="https://img.shields.io/badge/Apache_Kafka-Confluent-orange?style=for-the-badge&logo=apachekafka" alt="Kafka">
  <img src="https://img.shields.io/badge/PostgreSQL-Neon-lightblue?style=for-the-badge&logo=postgresql" alt="PostgreSQL">
</p>

<div align="center">
  <video width="100%" autoplay loop muted playsinline>
    <source src="https://assets.mixkit.co/videos/preview/mixkit-digital-animation-of-screens-and-code-31938-large.mp4" type="video/mp4">
    Seu navegador não suporta tags de vídeo.
  </video>
</div>

# Desafio Final — Pipeline de Pagamentos (Portfólio / Troubleshooting Gabarito)

Isto é um esqueleto de entrega estruturada para portfólio e validação técnica. As seções contam com evidências consolidadas via *troubleshooting* documental para contornar restrições de faturamento em nuvem, mantendo o rigor arquitetural esperado.

Pipeline: Neon (Postgres) → CDC Debezium → tópicos Avro → Flink SQL (enriquecimento + fraude) → consumo. Reproduzível via `./setup.sh` (pré-requisito: `.env` preenchido a partir do `.env.example`).

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

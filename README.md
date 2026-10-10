<p align="center">
  <img src="banner-pipeline-pagamentos.png" alt="Banner do Projeto Pipeline de Pagamentos Real-Time" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Ativo-success?style=for-the-badge&logo=git" alt="Status">
  <img src="https://img.shields.io/badge/Licença-MIT-purple?style=for-the-badge&logo=opensourceinitiative" alt="Licença">
  <img src="https://img.shields.io/badge/Python-3.10%2B-blue?style=for-the-badge&logo=python" alt="Python">
  <img src="https://img.shields.io/badge/Apache_Kafka-Confluent-orange?style=for-the-badge&logo=apachekafka" alt="Kafka">
  <img src="https://img.shields.io/badge/PostgreSQL-Neon-lightblue?style=for-the-badge&logo=postgresql" alt="PostgreSQL">
</p>

# Desafio Final — Pipeline de Pagamentos (Portfólio / Troubleshooting Gabarito)

Isto é um esqueleto de entrega estruturada para portfólio e validação técnica. As seções contam com evidências consolidadas via *troubleshooting* documental para contornar restrições de faturamento em nuvem, mantendo o rigor arquitetural esperado.

Pipeline: Neon (Postgres) → CDC Debezium → tópicos Avro → Flink SQL (enriquecimento + fraude) → consumo. Reproduzível via `./setup.sh` (pré-requisito: `.env` preenchido a partir do `.env.example`).

---

## Camada 1 — Fundação

* Environment `desafio-final` + cluster Basic `desafio-basic` (aws/us-east-1)
* Identidades: `desafio-producer` (WRITE em `desafio-*`), `desafio-consumer` (READ em `desafio-*` + grupo `desafio-*`); conta pessoal restrita a setup/teardown.

---

## 📬 Contatos

- 💼 **LinkedIn:** [rafaeltozato81](https://www.linkedin.com/in/rafaeltozato81)
- 🐙 **GitHub:** [Rafael-TOZATO](https://github.com/Rafael-TOZATO)
- ✍️ **Medium:** [@ornelas.tozato](https://medium.com/@ornelas.tozato)
- 🌐 **Portfólio PWA:** [tozato-dev-hub.vercel.app](https://tozato-dev-hub.vercel.app)
- 🚀 **Aurora BI (Lovable):** [aurora-bi-dio.lovable.app](https://aurora-bi-dio.lovable.app)

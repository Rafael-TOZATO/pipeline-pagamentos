<p align="center">
  <img src="banner-pipeline-pagamentos.png" alt="Banner do Projeto Pipeline de Pagamentos Real-Time" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Ativo-success?style=for-the-badge&logo=git" alt="Status">
  <img src="https://img.shields.io/badge/Licença-MIT-purple?style=for-the-badge&logo=opensourceinitiative" alt="Licença">
  <img src="https://img.shields.io/badge/Python-3.10%2B-blue?style=for-the-badge&logo=python" alt="Python">
  <img src="https://img.shields.io/badge/Apache_Kafka-Confluent-orange?style=for-the-badge&logo=apachekafka" alt="Kafka">
  <img src="https://img.shields.io/badge/PostgreSQL-Neon-lightblue?style=for-the-badge&logo=postgresql" alt="PostgreSQL">
  <img src="https://img.shields.io/github/actions/workflow/status/Rafael-TOZATO/pipeline-pagamentos/quality-gate.yml?branch=main&label=Security%20%2F%20Quality%20Gate&style=for-the-badge" alt="Security / Quality Gate">
  <img src="https://img.shields.io/badge/Dependabot-enabled-brightgreen?style=for-the-badge&logo=dependabot" alt="Dependabot enabled">
  <img src="https://img.shields.io/badge/Status-Online-success?style=for-the-badge&logo=git" alt="Status Online">
  <img src="https://img.shields.io/badge/Maintained-yes-brightgreen?style=for-the-badge" alt="Maintained">
</p>

# Desafio Final — Pipeline de Pagamentos (Portfólio / Troubleshooting Gabarito)

Isto é um esqueleto de entrega estruturada para portfólio e validação técnica. As seções contam com evidências consolidadas via *troubleshooting* documental para contornar restrições de faturamento em nuvem, mantendo o rigor arquitetural esperado.

Pipeline: Neon (Postgres) → CDC Debezium → tópicos Avro → Flink SQL (enriquecimento + fraude) → consumo. Reproduzível via `./setup.sh` (pré-requisito: `.env` preenchido a partir do `.env.example`).

---

## Qualidade e Governança

O workflow **Quality Gate** roda em *push* e *pull request* para `main` (e manualmente), verifica segredos expostos com Gitleaks, valida a sintaxe dos scripts Bash, aplica ShellCheck e valida a sintaxe JSON dos conectores, evidências e schemas Avro. O aviso ShellCheck SC1091 é excluído porque `.env` é um arquivo local, criado pelo usuário e não versionado. O Dependabot está habilitado para propor atualizações semanais das GitHub Actions; não há manifesto de dependências de aplicação neste repositório.

Na revisão estática inicial, `setup.sh` usava IDs de service accounts fixos em vez dos IDs retornados pela criação; agora os ACLs usam os IDs criados. As variáveis de `.env` também são exportadas para os comandos filhos, e `.env` foi incluído no `.gitignore` para reduzir o risco de versionar credenciais.

As verificações locais executadas foram `bash -n`, ShellCheck e parsing JSON com `jq`; todas passaram após os ajustes. **Limitação:** a auditoria especializada de segurança não foi concluída nesta execução; portanto, não é possível afirmar que nenhum outro bug ou vulnerabilidade exista. O Quality Gate cobre verificações estáticas de sintaxe e lint, não testes de integração contra serviços cloud nem validação semântica/compatibilidade dos schemas e SQL.

---

## Camada 1 — Fundação

* Environment `desafio-final` + cluster Basic `desafio-basic` (aws/us-east-1)
* Identidades: `desafio-producer` (WRITE em `desafio-*`), `desafio-consumer` (READ em `desafio-*` + grupo `desafio-*`); conta pessoal restrita a setup/teardown.

---

## 💻 PROJETOS E PORTFÓLIOS
- **App Ecosystem:** [tozato-ai-core.vercel.app](https://tozato-ai-core.vercel.app)
- **H-Folio:** [h-folio-l0.vercel.app](https://h-folio-l0.vercel.app)

## 🐙 CÓDIGO E REPOSITÓRIOS
- **GitHub:** [github.com/Rafael-TOZATO](https://github.com/Rafael-TOZATO)

## ✍️ ARTIGOS E PUBLICAÇÕES
- **Medium:** [medium.com/@ornelas.tozato](https://medium.com/@ornelas.tozato)

## 🪟 MICROSOFT LEARN
- **Perfil:** [rafaelornelastozato-2209](https://learn.microsoft.com/pt-br/users/rafaelornelastozato-2209)

## 📬 CONTATOS
- **E-mail:** ornelas.tozato@gmail.com
- **LinkedIn:** [rafaeltozato81](https://www.linkedin.com/in/rafaeltozato81)
- **GitHub:** [Rafael-TOZATO](https://github.com/Rafael-TOZATO)
- **Dev Hub:** [tozato-ai-core.vercel.app](https://tozato-ai-core.vercel.app)

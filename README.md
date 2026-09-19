##### Camada 1 — Fundação

Environment `desafio-final` + cluster Basic `desafio-basic` (aws/us-east-1)[cite: 3]
Identidades: `desafio-producer` (WRITE em `desafio-*`), `desafio-consumer` (READ em `desafio-*` + grupo `desafio-*`); conta pessoal só em setup/teardown[cite: 3]

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

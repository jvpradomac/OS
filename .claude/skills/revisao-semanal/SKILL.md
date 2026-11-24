---
name: revisao-semanal
description: Fecha a semana do usuário. Revisa prioridades, pendências das empresas e decisões, e termina sugerindo o que transformar em skill ou rotina. Rodar às sextas ou quando o usuário pedir.
disable-model-invocation: true
---

# Revisão semanal

Quinze minutos que fazem o OS melhorar toda semana. Siga a ordem e seja breve em cada passo.

## 1. O que aconteceu

- Leia `context/prioridades.md` e os `README.md` de `confidencial/*/` alterados nos últimos 7 dias.
- Se houver conector de agenda aprovado em `conexoes.md`, liste as reuniões da semana que passou e da próxima.
- Mostre em até 8 bullets: avanços, o que travou e o que está atrasado.

## 2. Prioridades

- Pergunte se as prioridades de 90 dias continuam certas. Atualize a seção "Esta semana" com 3 a 5 itens para a próxima semana, cada um com entrega concreta. Atualize a data no topo.

## 3. Higiene do OS

- `confidencial/inbox/` tem arquivos? Ofereça classificar e mover para a pasta da empresa.
- Algum `README.md` de empresa sem atualização há mais de 30 dias, com processo em andamento? Liste.
- Alguma decisão da semana que deveria estar em `decisoes/log.md`? Proponha a linha.
- Alguma regra em `AGENTS.md` ou `.claude/rules/` que ficou velha ou contradiz outra? Aponte.

## 4. O que automatizar

Olhe as conversas e entregas da semana (o que está em `saidas/` com data desta semana e o que o usuário contar):

- Tarefa feita 3 vezes ou mais → proponha uma skill (`/criar-skill`).
- Algo que poderia rodar sozinho em horário fixo → proponha uma rotina. Prefira rotinas passivas, que só avisam quando acham algo relevante, a rotinas que geram material para revisar toda vez.
- Correção que se repetiu → proponha `/calibrar`.

No máximo 3 sugestões, cada uma com: o que faz, quando roda, quanto tempo economiza. Não crie nada sem o ok dele.

## 5. Feche

Grave o resumo em `saidas/AAAA-MM-DD-revisao-semanal.md` e termine com as 3 prioridades da próxima semana.

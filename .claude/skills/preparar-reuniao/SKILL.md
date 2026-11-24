---
name: preparar-reuniao
description: Prepara o briefing de uma reunião (com investida, fundador, banco, cotista ou comitê) a partir do histórico em confidencial/, da agenda e do e-mail quando houver conector aprovado. Use quando o usuário mencionar uma reunião próxima ou pedir um briefing.
argument-hint: "[empresa ou pessoa] [data opcional]"
---

# Preparar reunião

Reunião: $ARGUMENTS

1. **Contexto.** Ache a empresa em `confidencial/deals/` ou `confidencial/carteira/` e leia o `README.md` e as últimas notas de reunião. Se houver conector de agenda ou e-mail aprovado em `conexoes.md`, busque o convite e as últimas trocas. Informação pública (notícias, site) só se o usuário pedir e só com termos públicos.
2. **Briefing em uma página**, nesta ordem:
   - Objetivo da reunião em uma frase (pergunte se não estiver claro).
   - Quem estará lá e o papel de cada um.
   - Onde paramos: últimos fatos, números relevantes com fonte, compromissos em aberto dos dois lados.
   - 3 a 5 perguntas que o usuário deveria fazer, priorizadas.
   - Riscos e assuntos sensíveis para tratar com cuidado.
3. Salve em `saidas/AAAA-MM-DD-briefing-<empresa>.md` e mostre o briefing.
4. Depois da reunião, ofereça transformar as anotações do usuário em notas na pasta da empresa e atualizar o `README.md` dela.

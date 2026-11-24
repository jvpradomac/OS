---
name: criar-skill
description: Transforma uma tarefa que o usuário repete em uma skill nova deste OS, com o formato recomendado pelo Claude Code. Use quando o usuário pedir uma skill nova ou quando uma tarefa já foi feita 3 vezes.
disable-model-invocation: true
argument-hint: "[tarefa que se repete]"
---

# Criar skill

Tarefa: $ARGUMENTS

## 1. Entenda a tarefa (no máximo 3 perguntas)

- Qual é a entrada (arquivo, pasta, empresa, reunião) e qual é a saída (documento, e-mail, tabela)?
- Como fica um bom resultado? Peça um exemplo real já feito, se houver, para guardar como referência.
- Ela deve rodar só quando ele chamar, ou o Claude pode usar sozinho quando perceber que cabe?

## 2. Escolha o tipo

- **Procedimento**: passos fixos (ex.: triagem de teaser). O corpo da skill é a lista de passos.
- **Base de referência**: conhecimento que se consulta (ex.: comparáveis do setor, exemplos de bons e-mails). A skill fica curta e aponta para arquivos em `referencias/`. Peça que, ao gerar ideias, 8 de 10 sigam as referências e 2 tragam algo novo, para não engessar.
- **Artefato**: gera documento com cara padronizada (ex.: one-pager). Guarde o template em `referencias/` e gere sempre a partir dele.

## 3. Escreva

Crie `.claude/skills/<nome-curto>/SKILL.md`:

```markdown
---
name: <nome-curto>
description: <o que faz e quando usar, em 1 ou 2 frases. É isso que o Claude lê para decidir usar a skill sozinho.>
disable-model-invocation: true   # só se for chamada apenas pelo usuário
argument-hint: "[o que passar]"
---

# <Título>

Entrada: $ARGUMENTS

1. ...
```

Boas práticas: corpo com menos de 500 linhas (idealmente bem menos), passos no imperativo, o motivo de cada regra que não for óbvia, exemplos e templates em `referencias/`. Tarefa simples e de passos fixos pode usar `model: haiku` ou `sonnet` para gastar menos.

## 4. Teste e mostre

Mostre a skill antes de salvar. Depois de salvar, rode uma vez com um caso real e ajuste. Acrescente o comando na tabela do `README.md` do OS.

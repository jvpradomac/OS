---
name: calibrar
description: Guarda uma lição que o usuário ensinou no lugar certo do OS (AGENTS.md, regra por área, skill, contexto ou memória), para que ele nunca precise corrigir a mesma coisa duas vezes. Use quando o usuário corrigir algo que deve valer nas próximas sessões, ou quando ele pedir /calibrar.
argument-hint: "[a lição, em uma frase, ou vazio para usar a última correção]"
---

# Calibrar

Regra de ouro do OS: se o usuário precisou corrigir a mesma coisa duas vezes, a memória falhou. Esta skill transforma uma correção em instrução permanente.

Lição: $ARGUMENTS (se vazio, use a última correção desta conversa e confirme em uma linha).

## 1. Ache o princípio

Não grave a correção literal ("troque 'receita' por 'receita líquida' no relatório da X"). Pergunte-se por que o erro aconteceu e escreva a regra que evita a família inteira de erros ("use sempre receita líquida; bruta só quando a fonte reporta assim, e diga qual"). Uma boa calibração costuma deixar o arquivo mais curto, não mais longo.

## 2. Escolha o lugar

| Se a lição é... | Vai para |
|---|---|
| Um jeito de trabalhar que vale em toda sessão | `AGENTS.md`, seção "Como trabalhar comigo" |
| Específica de um tema ou tipo de documento | `.claude/rules/<area>.md` com `paths:` |
| Sobre como uma skill executa | O `SKILL.md` daquela skill |
| Um fato sobre o usuário, o fundo ou prioridades | `context/` |
| Uma decisão que continua valendo | `decisoes/log.md` |
| Precisa ser garantida 100%, sem depender do modelo lembrar | Hook ou permissão em `.claude/settings.json` (proponha; não altere sem ok) |
| Preferência pequena e pessoal (tom, formato) | Memória automática do Claude Code |

Antes de escrever, procure se já existe regra parecida. Se existir, melhore a existente em vez de somar outra. Se houver contradição, mostre as duas e pergunte qual vale.

## 3. Mostre e grave

Mostre o trecho novo (ou o diff) em até 5 linhas, diga o arquivo e por que ali. Grave depois do ok. Nunca grave números, nomes de negócios em andamento ou dados de pessoas: calibração é sobre jeito de trabalhar.

Se o `AGENTS.md` + `CLAUDE.md` passarem de ~200 linhas somados, avise e sugira o que mover para uma regra ou skill.

---
name: onboarding
description: Configura este Operating System para o usuário na primeira vez, com uma entrevista em blocos curtos que preenche AGENTS.md, context/, conexoes.md e as travas de sigilo. Também serve para refazer um bloco depois.
disable-model-invocation: true
argument-hint: "[bloco opcional: voce | trabalho | fontes | sigilo | voz | revisar]"
---

# Onboarding do Operating System

Objetivo: em uma conversa de cerca de 20 minutos, sair de um repositório genérico para um OS que já sabe quem é o usuário, como o fundo trabalha, onde estão as coisas e o que não pode sair da máquina. No fim, fazer uma tarefa real com ele, para que o valor apareça no primeiro dia.

Se vier argumento (`$ARGUMENTS`), rode só aquele bloco e atualize os arquivos dele.

## Como conduzir

- Um bloco por vez, com no máximo 4 perguntas por bloco. Espere a resposta antes do próximo.
- Antes de perguntar, leia o que já existe em `AGENTS.md`, `context/` e `conexoes.md`. Não pergunte o que já está respondido; confirme em uma linha.
- Grave as respostas no arquivo de destino ao fim de cada bloco, para que nada se perca se a conversa cair. Mostre em 2 ou 3 linhas o que gravou.
- Resposta vaga em prioridades ("crescer o fundo") ganha uma pergunta de volta: qual número, prazo ou entrega?
- Tom de colega, em português. Explique em uma frase por que cada bloco importa, sem palestra.
- Nada de dados de deals, investidas ou cotistas nesta entrevista. Se o usuário começar a colar algo assim, explique que isso vai para `confidencial/` depois e siga.

## Abertura

Diga em 3 linhas o que vai acontecer (5 blocos, ~20 min, ele pode parar e retomar com `/onboarding <bloco>`). Pergunte antes de tudo:

> Você está usando o Claude pela conta comercial do fundo (Team ou Enterprise) ou por uma conta pessoal?

Se for pessoal ou ele não souber: explique que, pela LGPD e pelo acordo de tratamento de dados, dados reais do fundo só devem entrar pela conta comercial; o onboarding pode seguir, porque não usa dados confidenciais, mas registre isso como pendência em `context/prioridades.md` e no resumo final.

## Bloco 1. Você → `context/sobre-mim.md` e o topo do `AGENTS.md`

1. Nome, cargo e área em que atua (estratégia, setor, estágio).
2. Como é uma semana típica? Quais ritos fixos (comitê, reuniões de carteira, viagens)?
3. Quais 3 tarefas mais tomam seu tempo e se repetem toda semana?
4. Como prefere receber respostas: idioma, tamanho, formato (bullets, tabela, texto corrido)?

Preencha `{{NOME}}`, `{{UMA_FRASE}}`, `{{CARGO_E_AREA}}`, `{{O_QUE_MAIS_TOMA_TEMPO}}` e `{{IDIOMA_E_FORMATO}}` no `AGENTS.md` com frases curtas.

## Bloco 2. Trabalho → `context/sobre-o-fundo.md` e `context/prioridades.md`

1. Tese e critérios: o que vocês buscam e o que evitam? (Só o que já é de uso interno geral.)
2. Que materiais você produz ou revisa com frequência (memo de IC, one-pager, relatório a cotistas, board deck)? Existe template? Se sim, peça para ele salvar um modelo sem dados em `confidencial/inbox/` mais tarde; anote onde está.
3. Quais as 2 ou 3 prioridades dos próximos 90 dias, com número, prazo ou entrega?
4. Siglas e termos do time que eu preciso entender.

## Bloco 3. Fontes e ferramentas → `conexoes.md`

1. E-mail e agenda: Outlook ou Gmail?
2. Onde ficam documentos e dados: SharePoint, OneDrive, Drive, data room, CapIQ, Bloomberg, PitchBook, Excel local?
3. Por onde fala com o time e com as empresas: Teams, Slack, WhatsApp, e-mail?
4. Quais desses o TI já aprovou para conectar a ferramentas de IA?

Para cada sistema, classifique em "Aprovadas", "Sem conexão (eu trago o arquivo)" ou "Proibidas". Explique a ordem de escolha que está no topo do `conexoes.md` (o caminho mais leve primeiro; cada MCP ocupa contexto em toda sessão). Não configure nenhum conector agora; se houver um aprovado, anote como próximo passo.

## Bloco 4. Sigilo → `.claude/rules/sigilo.md`, `decisoes/log.md` e git

1. O compliance tem alguma regra escrita para uso de IA? O que é explicitamente proibido?
2. Onde este repositório vai ficar na máquina e onde é feito o backup? (Evite nuvem pessoal.)
3. Quer manter um remoto Git para o seu OS? Se sim, só privado e aprovado pelo TI.

Depois das respostas, faça, mostrando cada comando antes:

- `git config core.hooksPath .githooks` (ativa a trava de sigilo para commits feitos à mão).
- `git remote -v`. Se o remoto apontar para o repositório de origem de onde ele clonou, explique e ofereça `git remote remove origin`, para que nada do OS dele volte para lá. O comando pede confirmação.
- Acrescente ao fim de `.claude/rules/sigilo.md` as regras específicas do compliance que ele citou.
- Preencha a data na decisão inicial de `decisoes/log.md`.

## Bloco 5. Voz → `context/voz.md`

Peça 1 ou 2 textos reais que ele escreveu (um e-mail, um trecho de memo), **colados sem edição**. Se ele começar a digitar um texto novo, explique: um texto escrito agora já sai moldado pela conversa; o que vale é o texto que ele mandou de verdade. Peça para trocar nomes e números de terceiros por fictícios antes de colar.

Cole os textos em "Exemplos reais" e escreva de 3 a 5 princípios que você observa neles.

## Fechamento

1. Releia `AGENTS.md`: nenhum `{{...}}` pode sobrar (se faltar informação, escreva a melhor versão e marque com "(confirmar)"). Apague a linha `ONBOARDING:PENDENTE`.
2. Proponha 1 skill sob medida para a tarefa que mais se repete no Bloco 1, usando `/criar-skill` como guia. Crie só se ele aceitar.
3. Commit local da configuração (`git add` dos arquivos alterados, nunca de `confidencial/` ou `saidas/`), mensagem "Configura o OS no onboarding".
4. Faça uma primeira tarefa real com ele agora. Sugira: "Me diga o que você tem amanhã e eu preparo o briefing" (`/preparar-reuniao`) ou "Jogue um material público de uma empresa em `confidencial/inbox/` e eu faço o primeiro filtro".
5. Termine com um resumo de 5 linhas: o que foi configurado, pendências (conta comercial, conectores, template de memo) e os 3 comandos que ele vai usar nesta semana: `/calibrar`, `/preparar-reuniao`, `/revisao-semanal`.

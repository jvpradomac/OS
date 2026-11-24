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
- Nada de dados sensíveis nesta entrevista. Se o usuário começar a colar algo assim, explique que isso vai para `confidencial/` depois e siga.

## Abertura

Diga em 3 linhas o que vai acontecer (5 blocos, ~20 min, ele pode parar e retomar com `/onboarding <bloco>`). Pergunte antes de tudo:

> Você já desligou o uso das suas conversas para treinar os modelos? Fica em Configurações > Privacidade ("Help improve Claude").

Se não, mostre onde fica e espere ele desligar. Em uma frase, lembre o combinado: trazer o mínimo de dados sensíveis, com nomes trocados e números arredondados quando der. Ele já conhece sigilo; não explique o que ele sabe.

## Bloco 1. Você → `context/sobre-mim.md` e o topo do `AGENTS.md`

1. Nome, cargo e área em que atua (estratégia, setor, estágio).
2. Como é uma semana típica? Quais compromissos fixos?
3. Quais 3 tarefas mais tomam seu tempo e se repetem toda semana?
4. Como prefere receber respostas: idioma, tamanho, formato (bullets, tabela, texto corrido)?

Preencha `{{NOME}}`, `{{UMA_FRASE}}`, `{{CARGO_E_AREA}}`, `{{O_QUE_MAIS_TOMA_TEMPO}}` e `{{IDIOMA_E_FORMATO}}` no `AGENTS.md` com frases curtas.

## Bloco 2. Para que você quer o OS → `context/prioridades.md`, `context/sobre-o-fundo.md` e `confidencial/`

Este é o bloco mais importante: é ele que deixa o sistema sob medida. Não sugira usos prontos; deixe ele contar.

1. Em que partes do seu trabalho você mais quer a ajuda do Claude? Peça exemplos concretos da última semana.
2. Que documentos ou entregas aparecem nessas tarefas? Existe um modelo que o time já usa?
3. Quais as 2 ou 3 prioridades dos próximos 90 dias, com número, prazo ou entrega?
4. Siglas e termos do time que eu preciso entender.

Com as respostas, crie em `confidencial/` uma pasta por tema que ele citou, cada uma com um `README.md` curto (o que é, estado, próximo passo). Liste os temas em `confidencial/temas.md`, uma linha por tema com o caminho da pasta. Os nomes dos temas não vão para o `AGENTS.md` nem para outro arquivo versionado, porque podem revelar no que ele está trabalhando.

## Bloco 3. Fontes e ferramentas → `conexoes.md`

1. E-mail e agenda: Outlook ou Gmail?
2. Onde ficam documentos e dados: SharePoint, OneDrive, Drive, sistemas de dados, Excel local?
3. Por onde fala com o time e com quem é de fora: Teams, Slack, WhatsApp, e-mail?
4. Algum desses você não quer, ou não pode, conectar a uma IA?

Para cada sistema, classifique em "Aprovadas", "Sem conexão (eu trago o arquivo)" ou "Proibidas". Explique a ordem de escolha que está no topo do `conexoes.md` (o caminho mais leve primeiro; cada MCP ocupa contexto em toda sessão). Não configure nenhum conector agora; se houver um aprovado, anote como próximo passo.

## Bloco 4. Sigilo → `.claude/rules/sigilo.md`, `decisoes/log.md` e git

1. Há alguma regra do fundo para uso de IA, ou algo que nunca deve entrar aqui?
2. Quer manter um remoto Git para o seu OS? Se sim, só privado.

Depois das respostas, faça, mostrando cada comando antes:

- `git config core.hooksPath .githooks` (ativa a trava de sigilo para commits feitos à mão).
- `git remote -v`. Se o remoto apontar para o repositório de origem de onde ele clonou, explique e ofereça `git remote remove origin`, para que nada do OS dele volte para lá. O comando pede confirmação.
- Acrescente ao fim de `.claude/rules/sigilo.md` as regras específicas do compliance que ele citou.
- Preencha a data na decisão inicial de `decisoes/log.md`.

## Bloco 5. Voz → `context/voz.md`

Peça 1 ou 2 textos reais que ele escreveu (um e-mail, um trecho de documento), **colados sem edição**. Se ele começar a digitar um texto novo, explique: um texto escrito agora já sai moldado pela conversa; o que vale é o texto que ele mandou de verdade. Peça para trocar nomes e números de terceiros por fictícios antes de colar.

Cole os textos em "Exemplos reais" e escreva de 3 a 5 princípios que você observa neles.

## Fechamento

1. Releia `AGENTS.md`: nenhum `{{...}}` pode sobrar (se faltar informação, escreva a melhor versão e marque com "(confirmar)"). Apague a linha `ONBOARDING:PENDENTE`.
2. Proponha 1 skill sob medida para o uso principal que ele contou no Bloco 2, usando `/criar-skill` como guia. Crie só se ele aceitar.
3. Commit local da configuração (`git add` dos arquivos alterados, nunca de `confidencial/` ou `saidas/`), mensagem "Configura o OS no onboarding".
4. Faça uma primeira tarefa real com ele agora, dentro do uso principal do Bloco 2. Se ele não tiver uma na cabeça, peça a próxima coisa que ele faria hoje.
5. Termine com um resumo de 5 linhas: o que foi configurado, pendências (conectores, modelos de documento) e os comandos desta semana: `/calibrar`, `/revisao-semanal` e a skill nova, se houver.

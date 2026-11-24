# Seu Operating System no Claude Code

Uma pasta que faz cada nova sessão do Claude Code começar sabendo quem você é, como o fundo trabalha, onde ficam suas coisas e o que já foi decidido. Você responde algumas perguntas uma vez; depois, o sistema melhora a cada uso.

## Antes de começar (5 minutos)

1. **Conta comercial.** Use o Claude pela conta Team ou Enterprise do fundo, não por uma conta pessoal. Ela vem com termos comerciais e acordo de tratamento de dados, que é o que a LGPD pede quando entram dados de clientes, investidas ou cotistas. Se o fundo ainda não tem, fale com TI e compliance antes de colocar qualquer dado real aqui.
2. **Claude Code instalado.** Guia oficial: <https://code.claude.com/docs/en/setup>. No Windows, instale também o Git for Windows (o Claude Code usa o Git Bash).
3. **Uma pasta aprovada pelo TI** para guardar este repositório (de preferência fora de pastas sincronizadas com nuvem pessoal).

## Três passos

```bash
git clone <URL-DESTE-REPOSITORIO> meu-os
cd meu-os
claude
```

Dentro do Claude Code, digite:

```
/onboarding
```

O Claude faz perguntas em blocos curtos (você, o seu trabalho, suas fontes, sigilo e um texto seu), preenche os arquivos, desliga o vínculo com este repositório de origem e termina fazendo uma primeira tarefa real com você. Leva cerca de 20 minutos.

## Depois do onboarding

| Quando | O que digitar | Para quê |
|---|---|---|
| Ele errou algo que não deveria repetir | `/calibrar` | Guarda a lição no lugar certo, para não corrigir duas vezes |
| Antes de uma reunião | `/preparar-reuniao` | Briefing com histórico, pauta e perguntas |
| Material de um deal na pasta | `/memo-ic` | Rascunho de memo para o comitê, com fonte em cada número |
| Sexta-feira | `/revisao-semanal` | Fecha a semana, ajusta prioridades e sugere o que automatizar |
| Fez a mesma tarefa 3 vezes | `/criar-skill` | Transforma a tarefa em um comando seu |

O guia visual, com os conceitos e o que alimentar em cada camada, está em [guia/index.html](guia/index.html) (abra no navegador) e em PDF: [guia/guia-operating-system.pdf](guia/guia-operating-system.pdf).

## Onde as coisas ficam

```
CLAUDE.md            o que o Claude Code lê em toda sessão (curto, aponta para AGENTS.md)
AGENTS.md            quem você é e como trabalhar com você (preenchido no onboarding)
context/             você, o fundo, prioridades, sua voz
decisoes/log.md      decisões que continuam valendo, com o motivo
conexoes.md          sistemas que o Claude alcança e por qual meio
confidencial/        deals, carteira, cotistas, materiais recebidos. NUNCA entra no Git
saidas/              memos, briefings e relatórios gerados. Fora do Git
.claude/             skills, regras por área, subagente revisor, permissões e hooks
scripts/hooks/       travas de sigilo que rodam automaticamente
guia/                o material explicativo
```

## Sigilo em uma frase

Tudo o que é do fundo fica em `confidencial/` ou `saidas/`, que o Git ignora e que um hook bloqueia se alguém tentar commitar. Este repositório guarda a estrutura do seu sistema, não os dados do fundo. Detalhes em [.claude/rules/sigilo.md](.claude/rules/sigilo.md).

# Seu Operating System no Claude Code

Uma pasta que faz cada nova sessão do Claude Code começar sabendo quem você é, como o fundo trabalha, onde ficam suas coisas e o que já foi decidido. Você responde algumas perguntas uma vez; depois, o sistema melhora a cada uso.

## Antes de começar (5 minutos)

1. **Privacidade da conta.** Nas configurações do Claude, em Privacidade, desligue a opção que permite usar suas conversas para treinar os modelos ("Help improve Claude"). E use o mínimo de dados sensíveis: o Claude trabalha bem com nomes trocados, números arredondados e trechos em vez de documentos inteiros.
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

O Claude faz perguntas em blocos curtos (você, o seu trabalho, suas fontes, sigilo e um texto seu), preenche os arquivos, desliga o vínculo com este repositório de origem pergunta para que você mais quer usar o sistema e termina com uma primeira tarefa real. Leva cerca de 20 minutos.

## Depois do onboarding

| Quando | O que digitar | Para quê |
|---|---|---|
| Ele errou algo que não deveria repetir | `/calibrar` | Guarda a lição no lugar certo, para não corrigir duas vezes |
| Sexta-feira | `/revisao-semanal` | Fecha a semana, ajusta prioridades e sugere o que automatizar |
| Fez a mesma tarefa 3 vezes | `/criar-skill` | Transforma a tarefa em um comando seu |

As skills do seu trabalho (briefings, análises, relatórios) nascem do que você contar no onboarding, sob medida, em vez de virem prontas.

O guia visual, com os conceitos e o que alimentar em cada camada, está em [guia/index.html](guia/index.html) (abra no navegador) e em PDF: [guia/guia-operating-system.pdf](guia/guia-operating-system.pdf).

## Onde as coisas ficam

```
CLAUDE.md            o que o Claude Code lê em toda sessão (curto, aponta para AGENTS.md)
AGENTS.md            quem você é e como trabalhar com você (preenchido no onboarding)
context/             você, o fundo, prioridades, sua voz
decisoes/log.md      decisões que continuam valendo, com o motivo
conexoes.md          sistemas que o Claude alcança e por qual meio
confidencial/        material sensível que você trouxer, uma pasta por tema. NUNCA entra no Git
saidas/              o que o Claude gerar para você. Fora do Git
.claude/             skills, regras, subagente revisor, permissões e hooks
scripts/hooks/       travas de sigilo que rodam automaticamente
guia/                o material explicativo
```

## Sigilo em uma frase

Tudo o que é sensível fica em `confidencial/` ou `saidas/`, que o Git ignora e que um hook bloqueia se alguém tentar commitar. Este repositório guarda a estrutura do seu sistema, não os dados do fundo. Detalhes em [.claude/rules/sigilo.md](.claude/rules/sigilo.md).

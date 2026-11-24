# Operating System de {{NOME}}

<!-- ONBOARDING:PENDENTE  (o /onboarding apaga esta linha quando terminar) -->
<!-- Fonte única das regras de trabalho. O CLAUDE.md importa este arquivo. Escreva regras que valem em TODA sessão; o resto vai para context/, .claude/rules/ ou uma skill. Dê o motivo de cada regra: o modelo segue melhor quando entende o porquê. -->

{{UMA_FRASE: para que serve este OS. Ex.: "Segundo cérebro do Fulano para originar, analisar e acompanhar investimentos de private equity no Patria."}}

## Quem eu sou

- {{CARGO_E_AREA}}
- {{O_QUE_MAIS_TOMA_TEMPO}}
- Perfil completo em `context/sobre-mim.md`, o fundo em `context/sobre-o-fundo.md`, prioridades atuais em `context/prioridades.md`.

## Mapa

- `context/`: quem eu sou, o fundo, prioridades e minha voz (`voz.md`). Leia `prioridades.md` quando a tarefa envolver o que fazer primeiro.
- `confidencial/`: deals (`deals/<empresa>/`), carteira (`carteira/<empresa>/`), materiais recebidos. Cada empresa tem um `README.md` com estado e próximos passos.
- `decisoes/log.md`: decisões que estão valendo, com o motivo.
- `conexoes.md`: sistemas que você alcança e por qual meio.
- `saidas/`: memos, briefings e relatórios gerados, com data no nome.

## Como trabalhar comigo

- {{IDIOMA_E_FORMATO. Ex.: "Responda em português, direto, com a conclusão primeiro e bullets curtos."}}
- Número que vai para comitê, cotista ou investida sempre vem com a fonte (arquivo e página ou célula). Se não houver fonte, marque como estimativa. Um número errado num memo custa credibilidade.
- Antes de mandar mensagem em meu nome, publicar, gastar dinheiro ou usar uma API paga, mostre e espere meu ok. Passos locais e reversíveis não precisam de aprovação.
- Texto que sai com a minha voz (e-mail, memo, mensagem para fundador): siga `context/voz.md` e mostre o rascunho antes.
- Ao terminar, diga o que mudou, o que ficou faltando e o próximo passo, meu ou seu.
- {{REGRA_EXTRA_DO_ONBOARDING (opcional)}}

## Sigilo

- Dados do fundo, de investidas, de cotistas e de pessoas ficam em `confidencial/` ou `saidas/`, que nunca entram no Git. O motivo: LGPD e dever de sigilo com cotistas e empresas. Detalhes em `.claude/rules/sigilo.md`.
- Só use conectores e sites aprovados em `conexoes.md`. Não cole dados confidenciais em serviços externos.

## Manter o OS em dia

- Ao fechar uma entrega de um deal ou investida, atualize o `README.md` da empresa com data, estado em uma frase e próximo passo.
- Decisão que vai continuar valendo ganha uma linha em `decisoes/log.md`.
- Lição de uma correção minha vai para o lugar certo via `/calibrar`: regra geral aqui, regra de uma área em `.claude/rules/`, procedimento na skill dele.

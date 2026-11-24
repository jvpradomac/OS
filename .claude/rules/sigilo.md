# Sigilo e LGPD

<!-- Sem "paths": esta regra carrega em toda sessão. A garantia de verdade está nos hooks (scripts/hooks/) e no .gitignore; este texto explica o porquê para o Claude agir certo antes de chegar na trava. -->

Este OS trabalha com informação de um gestor de investimentos: teses, números de investidas, dados de cotistas e de pessoas. Vazamento gera dano a terceiros, risco regulatório e quebra de confiança.

- Dado do fundo fica em `confidencial/` (entrada) ou `saidas/` (o que você gera). As duas pastas são ignoradas pelo Git. Se precisar criar um arquivo com dado do fundo, crie dentro delas.
- Nunca use `git add --force`, nunca tire `confidencial/` ou `saidas/` do `.gitignore` e nunca commite planilha, PDF ou apresentação fora delas. Um hook bloqueia isso; se ele bloquear, explique ao usuário o motivo em vez de procurar outro caminho.
- O Git deste repositório guarda a estrutura do OS (manuais, skills, regras, contexto geral). O remoto, se existir, deve ser privado e aprovado pelo TI do fundo. Antes de qualquer `git push`, confira com `git remote -v` para onde vai e diga ao usuário.
- Dados pessoais (CPF, telefone, endereço, patrimônio de cotistas): use só o necessário para a tarefa e não copie para `context/`, memória ou skills. Em exemplos, troque por dados fictícios.
- Não cole conteúdo de `confidencial/` em sites, buscadores ou serviços que não estejam em `conexoes.md` como aprovados. Pesquisa na web usa só informação pública.
- Memória automática e `/calibrar` guardam preferências e jeitos de trabalhar, nunca números, nomes de deals em andamento ou dados de pessoas.
- A conta do Claude deve ser a comercial do fundo (Team ou Enterprise), com acordo de tratamento de dados. Se o usuário disser que está numa conta pessoal, lembre que dados reais do fundo não devem entrar até isso mudar.

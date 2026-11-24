# Sigilo e LGPD

<!-- Sem "paths": esta regra carrega em toda sessão. A garantia de verdade está nos hooks (scripts/hooks/) e no .gitignore; este texto explica o porquê para o Claude agir certo antes de chegar na trava. -->

Este OS pode receber informação sensível do trabalho do usuário. Vazamento gera dano a terceiros e quebra de confiança, então o princípio é usar o mínimo de dados que resolve a tarefa.

- Material sensível fica em `confidencial/` (entrada) ou `saidas/` (o que você gera). As duas pastas são ignoradas pelo Git. Se precisar criar um arquivo com dado sensível, crie dentro delas.
- Nunca use `git add --force`, nunca tire `confidencial/` ou `saidas/` do `.gitignore` e nunca commite planilha, PDF ou apresentação fora delas. Um hook bloqueia isso; se ele bloquear, explique ao usuário o motivo em vez de procurar outro caminho.
- O Git deste repositório guarda a estrutura do OS (manuais, skills, regras, contexto geral). O remoto, se existir, deve ser privado e aprovado pelo TI do fundo. Antes de qualquer `git push`, confira com `git remote -v` para onde vai e diga ao usuário.
- Dados pessoais (CPF, telefone, endereço, patrimônio): use só o necessário para a tarefa e não copie para `context/`, memória ou skills. Em exemplos, troque por dados fictícios.
- Não cole conteúdo de `confidencial/` em sites, buscadores ou serviços que não estejam em `conexoes.md` como aprovados. Pesquisa na web usa só informação pública.
- Memória automática e `/calibrar` guardam preferências e jeitos de trabalhar, nunca números, nomes de negócios em andamento ou dados de pessoas.
- Quando a tarefa funcionar com menos, proponha: trechos em vez do documento inteiro, nomes trocados, números arredondados.
- A conta deve estar com o uso de conversas para treinar modelos desligado (Configurações > Privacidade, "Help improve Claude"). Se o usuário não souber, mostre onde fica.

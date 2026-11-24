---
name: memo-ic
description: Escreve o rascunho de um memo de investimento para o comitê a partir dos materiais de um deal em confidencial/deals/<empresa>/, com fonte em cada número e revisão independente no fim. Use quando o usuário pedir memo, tese, one-pager de IC ou análise de um deal.
argument-hint: "[empresa]"
---

# Memo de IC

Empresa: $ARGUMENTS

1. **Template.** Se o fundo tiver template (veja `context/sobre-o-fundo.md`), siga-o. Se não, use `referencias/estrutura-padrao.md` e avise que é um modelo genérico.
2. **Material.** Liste os arquivos de `confidencial/deals/<empresa>/`. Para pastas grandes, use um subagente para ler e resumir, para manter esta conversa limpa. Separe o que a empresa afirma do que foi verificado pelo time.
3. **Rascunho.** Escreva na voz de `context/voz.md`. Cada número tem fonte entre colchetes: `[CIM p. 14]`, `[modelo.xlsx, aba DRE, C22]`. Sem fonte, escreva "estimativa" e o raciocínio. Lacunas viram uma seção "Perguntas em aberto para a diligência", em vez de serem preenchidas com suposição.
4. **Revisão.** Antes de apresentar como pronto, chame o subagente `revisor` com o caminho do memo e das fontes. Aplique o que for erro; mostre ao usuário o que for opinião.
5. **Entrega.** Salve em `saidas/AAAA-MM-DD-memo-ic-<empresa>.md` e atualize o `README.md` da empresa.

Se o usuário corrigir algo no memo que valha para os próximos, ofereça `/calibrar` para melhorar esta skill ou o template.

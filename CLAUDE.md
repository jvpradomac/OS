<!-- As regras comuns ficam em AGENTS.md, importado abaixo, para servir também a outras ferramentas (Codex, Cursor). Aqui ficam só notas do Claude Code. Comentários HTML como este não entram no contexto. Mantenha este arquivo e o AGENTS.md juntos com menos de 200 linhas. -->
@AGENTS.md

## Claude Code

- Se o AGENTS.md ainda tiver a marca `ONBOARDING:PENDENTE`, o sistema não foi configurado. Antes de qualquer outra coisa, sugira rodar `/onboarding`.
- Regras por área ficam em `.claude/rules/` e carregam quando você abre arquivos daquela área. Procedimentos que se repetem viram skill em `.claude/skills/`.
- Quando o usuário corrigir algo que deve valer nas próximas sessões, ofereça `/calibrar` em vez de guardar a lição em silêncio.
- Entrega importante (número que vai para fora, texto sensível) passa pelo subagente `revisor` antes de ser apresentada como pronta.
- Use subagente para busca ampla em muitos arquivos, para manter esta conversa limpa. Tarefa simples, faça direto.
- Ao compactar a conversa, preserve: decisões tomadas, números com a fonte de cada um, arquivos alterados e próximos passos.

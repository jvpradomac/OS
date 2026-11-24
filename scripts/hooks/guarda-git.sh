#!/usr/bin/env bash
# Hook PreToolUse do Claude Code para a ferramenta Bash.
# Recebe em stdin o JSON da chamada; o comando fica em tool_input.command.
# Sair com 2 bloqueia a chamada e devolve a mensagem de stderr ao Claude.

entrada=$(cat)
# Extrai o comando sem depender de jq ou python (que podem não existir na máquina).
cmd=$(printf '%s' "$entrada" | tr '\n' ' ' | sed -n 's/.*"command"[[:space:]]*:[[:space:]]*"\(\([^"\\]\|\\.\)*\)".*/\1/p')
[ -z "$cmd" ] && exit 0

# git add forçado inclui arquivos que o .gitignore protege
if printf '%s' "$cmd" | grep -Eq 'git[[:space:]]+add([[:space:]].*)?[[:space:]](-f|--force)([[:space:]]|$)'; then
  echo "Bloqueado: 'git add --force' passaria por cima do .gitignore, que protege confidencial/ e saidas/. Se o arquivo não é confidencial, mova-o para fora dessas pastas." >&2
  exit 2
fi

# git commit: confere o que vai entrar
if printf '%s' "$cmd" | grep -Eq 'git[[:space:]]+commit'; then
  flag=""
  printf '%s' "$cmd" | grep -Eq 'git[[:space:]]+commit.*[[:space:]](-a|--all|-[a-zA-Z]*a[a-zA-Z]*)([[:space:]]|$)' && flag="--incluir-modificados"
  if ! saida=$(bash "$CLAUDE_PROJECT_DIR/scripts/hooks/checar-sigilo.sh" $flag 2>&1); then
    echo "$saida" >&2
    exit 2
  fi
fi

exit 0

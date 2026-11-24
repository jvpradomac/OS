#!/usr/bin/env bash
# Confere se algum arquivo pronto para commit carrega dado do fundo.
# Usado de duas formas:
#   1. pelo git, como pre-commit (.githooks/pre-commit), em todo commit feito à mão;
#   2. pelo hook do Claude Code (guarda-git.sh), antes de o Claude rodar git commit.
# Sai com 1 e explica o motivo quando encontra problema.
# Uso: checar-sigilo.sh [--incluir-modificados]

set -u
cd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)" || exit 0

arquivos=$(git diff --cached --name-only --diff-filter=ACMR 2>/dev/null)
if [ "${1:-}" = "--incluir-modificados" ]; then
  arquivos=$(printf '%s\n%s\n' "$arquivos" "$(git diff --name-only --diff-filter=ACMR 2>/dev/null)" | sort -u)
fi
[ -z "$arquivos" ] && exit 0

problemas=""

# 1. Caminhos e tipos que não podem entrar
while IFS= read -r f; do
  [ -z "$f" ] && continue
  case "$f" in
    confidencial/LEIA-ME.md|saidas/LEIA-ME.md) ;;
    confidencial/*|saidas/*) problemas="$problemas\n  - $f (pasta de dados do fundo)" ;;
    .env|*/.env|.env.*|*.pem|*.key|CLAUDE.local.md|.claude/settings.local.json)
      problemas="$problemas\n  - $f (segredo ou configuração pessoal)" ;;
    guia/*) ;;
    *.xlsx|*.xlsm|*.xls|*.csv|*.pdf|*.pptx|*.docx|*.msg|*.eml)
      problemas="$problemas\n  - $f (arquivo de escritório fora de confidencial/)" ;;
  esac
done <<< "$arquivos"

# 2. CPF ou CNPJ formatados no conteúdo (LGPD)
padrao='[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}|[0-9]{2}\.[0-9]{3}\.[0-9]{3}/[0-9]{4}-[0-9]{2}'
while IFS= read -r f; do
  [ -z "$f" ] || [ ! -f "$f" ] && continue
  case "$f" in guia/*|scripts/hooks/*) continue ;; esac
  if grep -Eq "$padrao" "$f" 2>/dev/null; then
    problemas="$problemas\n  - $f (contém CPF ou CNPJ)"
  fi
done <<< "$arquivos"

if [ -n "$problemas" ]; then
  printf 'Commit bloqueado pela trava de sigilo. Estes arquivos não podem ir para o Git:%b\n' "$problemas" >&2
  printf 'Mova-os para confidencial/ ou saidas/ (ignoradas pelo Git) e tire do commit com: git restore --staged <arquivo>\n' >&2
  exit 1
fi
exit 0

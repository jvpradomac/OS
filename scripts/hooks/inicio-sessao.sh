#!/usr/bin/env bash
# Hook SessionStart. O que este script imprime entra no contexto do Claude no começo da sessão.
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

dias_semana=(segunda terça quarta quinta sexta sábado domingo)
echo "Hoje é $(date +%d/%m/%Y), ${dias_semana[$(( $(date +%u) - 1 ))]}-feira." | sed 's/sábado-feira/sábado/; s/domingo-feira/domingo/'

if grep -q 'ONBOARDING:PENDENTE' AGENTS.md 2>/dev/null; then
  echo "Este OS ainda não foi configurado. Na primeira resposta, sugira ao usuário rodar /onboarding (cerca de 20 minutos)."
  exit 0
fi

# Lembretes leves de manutenção
if [ -f context/prioridades.md ]; then
  dias=$(( ( $(date +%s) - $(date -r context/prioridades.md +%s 2>/dev/null || date +%s) ) / 86400 ))
  [ "$dias" -ge 10 ] && echo "context/prioridades.md não muda há $dias dias. Se fizer sentido, sugira /revisao-semanal."
fi
n=$(ls confidencial/inbox 2>/dev/null | grep -v '^\.' | wc -l | tr -d ' ')
[ "$n" -gt 0 ] && echo "Há $n arquivo(s) em confidencial/inbox esperando classificação."

# Trava de sigilo do git ativa?
[ "$(git config core.hooksPath 2>/dev/null)" = ".githooks" ] || echo "A trava de sigilo do git (core.hooksPath=.githooks) não está ativa neste clone. Ofereça ativar com: git config core.hooksPath .githooks"
exit 0

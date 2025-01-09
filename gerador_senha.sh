#!/bin/bash
calc_charset_size() {
  local password="$1"
  local charset_size=0
  if [[ "$password" =~ [a-z] ]]; then charset_size=$((charset_size + 26)); fi
  if [[ "$password" =~ [A-Z] ]]; then charset_size=$((charset_size + 26)); fi
  if [[ "$password" =~ [0-9] ]]; then charset_size=$((charset_size + 10)); fi
  if [[ "$password" =~ [\!\@\#\$\%\^\&\*\(\)\_\+\-\=\{\}\[\]\:\;\"\'\<\>\,\.\?\/\\\|] ]]; then charset_size=$((charset_size + 32)); fi
  echo $charset_size
}
# Função para calcular a entropia
calc_entropy() {
  local password="$1"
  local length=${#password}
  local charset_size=$(calc_charset_size "$password")
  local entropy=$(awk "BEGIN { print $length * log($charset_size)/log(2) }")
  echo $entropy
}
generate_password() {
    local length=$1
    openssl rand -base64 $(((length + 5) * 3 / 4)) | tr -dc 'A-Za-z0-9' | head -c $length
}
# Tamanhos desejados para as senhas
sizes=(14 16 18 20 24)
for size in "${sizes[@]}"; do
    password=$(generate_password $size)
    entropia=$(calc_entropy "$password")
    echo "Senha de tamanho $size: $password (Entropia: $entropia bits)"
done

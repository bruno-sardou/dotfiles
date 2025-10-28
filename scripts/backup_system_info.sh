#!/bin/bash
# backup_system_info.sh — gera registros de sistema e drivers

echo "🧠 Iniciando backup das informações do sistema..."

# Caminho base
BASE_DIR="$HOME/dotfiles"

echo "📦 Salvando pacotes instalados..."
pacman -Qqe > "$BASE_DIR/packages.txt"

echo "🎮 Salvando drivers (lspci)..."
lspci -k > "$BASE_DIR/drivers.txt"

echo "🧩 Salvando módulos do kernel..."
lsmod > "$BASE_DIR/lsmod.txt"

echo "💻 Salvando informações gerais do sistema..."
inxi -Fxz > "$BASE_DIR/system_info.txt"

echo "🧬 Salvando versão do kernel e CPU..."
uname -r > "$BASE_DIR/kernel_version.txt"
cat /proc/cpuinfo | grep "model name" | head -1 >> "$BASE_DIR/kernel_version.txt"

echo "✅ Backup concluído!"

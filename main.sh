#!/bin/bash
# ============================================
#  Carls OS - Sistema Operacional Simulado
#  Desenvolvido por Ghessé Luís (2025)
#  Licença: MIT
# ============================================

# Caminho base do sistema
CARLS_PATH="$HOME/.carls"

# Inicializa o sistema
init_system() {
    mkdir -p "$CARLS_PATH/bin" "$CARLS_PATH/etc" "$CARLS_PATH/usr" "$CARLS_PATH/tmp"
    clear
    echo "==============================="
    echo "      Carls OS Simulator       "
    echo "==============================="
    echo "Inicializando sistema..."
    sleep 1
    echo "Sistema carregado com sucesso."
    sleep 1
}

# Menu principal
main_menu() {
    while true; do
        clear
        echo "==============================="
        echo "        CARLS OS v1.0          "
        echo "==============================="
        echo "1. Terminal"
        echo "2. Gerenciador de arquivos"
        echo "3. Editor de texto"
        echo "4. Configurações"
        echo "5. Informações do sistema"
        echo "0. Sair"
        echo "==============================="
        read -p "Escolha uma opção: " opt

        case $opt in
            1) carls_terminal;;
            2) file_manager;;
            3) text_editor;;
            4) settings_menu;;
            5) system_info;;
            0) exit_system;;
            *) echo "Opção inválida!"; sleep 1;;
        esac
    done
}

# Terminal simulado
carls_terminal() {
    echo "Bem-vindo ao terminal Carls! Digite 'exit' para sair."
    while true; do
        read -p "carls@user:$PWD$ " cmd
        [ "$cmd" == "exit" ] && break
        eval "$cmd" 2>/dev/null || echo "Comando não encontrado."
    done
}

# Gerenciador de arquivos simples
file_manager() {
    clear
    echo "Gerenciador de Arquivos — diretório atual: $PWD"
    ls -lah --color=auto
    read -p "Digite o nome do arquivo para abrir (ou Enter para sair): " file
    [ -z "$file" ] && return
    if [ -f "$file" ]; then
        less "$file"
    else
        echo "Arquivo não encontrado!"
        sleep 1
    fi
}

# Editor de texto básico
text_editor() {
    read -p "Nome do arquivo: " file
    nano "$file" || vi "$file"
}

# Configurações
settings_menu() {
    clear
    echo "=== Configurações ==="
    echo "1. Alterar tema (claro/escuro)"
    echo "2. Limpar cache"
    echo "0. Voltar"
    read -p "Escolha: " opt

    case $opt in
        1) echo "Tema alterado! (simulado)"; sleep 1;;
        2) rm -rf "$CARLS_PATH/tmp/*"; echo "Cache limpo."; sleep 1;;
        0) return;;
        *) echo "Opção inválida!"; sleep 1;;
    esac
}

# Informações do sistema
system_info() {
    clear
    echo "=== Informações do Sistema ==="
    echo "Nome: Carls OS"
    echo "Versão: 1.0"
    echo "Usuário: $USER"
    echo "Shell: $SHELL"
    echo "Diretório base: $CARLS_PATH"
    echo "Data: $(date)"
    echo "==============================="
    read -p "Pressione Enter para voltar..."
}

# Encerrar o sistema
exit_system() {
    echo "Encerrando o Carls OS..."
    sleep 1
    exit 0
}

# Executar o sistema
init_system
main_menu

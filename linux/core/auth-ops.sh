#!/bin/bash

CYAN='\e[0;36m'
DARKCYAN='\e[1;36m'
DARKBLUE='\e[0;34m'
DARKGRAY='\e[1;30m'
MAGENTA='\e[0;35m'
WHITE='\e[1;37m'
YELLOW='\e[1;33m'
RED='\e[0;31m'
GREEN='\e[0;32m'
NC='\e[0m'

SENTINEL_LANG=${1:-"en"}

pause() {
    echo ""
    if [ "$SENTINEL_LANG" == "en" ]; then
        read -n 1 -s -r -p " [>] Press any key to continue..."
    else
        read -n 1 -s -r -p " [>] Pressione qualquer tecla para continuar..."
    fi
    echo ""
}

show_auth_menu() {
    clear
    echo -e ""
    echo -e "${CYAN}      _/_/_/  _/_/_/_/  _/      _/  _/_/_/_/_/  _/  _/      _/  _/_/_/_/  _/        ${NC}"
    echo -e "${CYAN}   _/        _/        _/_/    _/      _/      _/  _/_/    _/  _/        _/         ${NC}"
    echo -e "${DARKCYAN}    _/_/    _/_/_/    _/  _/  _/      _/      _/  _/  _/  _/  _/_/_/    _/          ${NC}"
    echo -e "${DARKCYAN}       _/  _/        _/    _/_/      _/      _/  _/    _/_/  _/        _/           ${NC}"
    echo -e "${DARKBLUE}_/_/_/    _/_/_/_/  _/      _/      _/      _/  _/      _/  _/_/_/_/  _/_/_/_/_/    ${NC}"
    echo -e ""
    echo -e "${DARKGRAY} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
    echo -e "${MAGENTA}                CHAVATTE SECURITY | AUTH-OPS MODULE V1.0                            ${NC}"
    echo -e "${DARKGRAY} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
    
    if [ "$SENTINEL_LANG" == "en" ]; then
        echo -e "${WHITE}  [ IDENTITY AND ACCESS MANAGEMENT ]${NC}"
        echo -e "${YELLOW}  🔑 1. GITHUB  : Initiate Login (Requires GitHub CLI or uses PAT/SSH)${NC}"
        echo -e "${YELLOW}  🦊 2. GITLAB  : Initiate Login (Requires GitLab CLI or uses PAT/SSH)${NC}"
        echo -e "${YELLOW}  🔐 3. KEYBASE : Initiate Login (Requires Keybase App)${NC}"
        echo -e "${CYAN}  🛡️  4. SSH KEY : Generate new cryptographic key (Ed25519)${NC}"
        echo -e "${GREEN}  🌐 5. LANG    : Switch Language (EN / PT-BR) -> Current: EN${NC}"
        echo -e "${DARKGRAY}  🛑 0. BACK    : Return to Main Terminal${NC}"
    else
        echo -e "${WHITE}  [ GERENCIAMENTO DE IDENTIDADE E ACESSO ]${NC}"
        echo -e "${YELLOW}  🔑 1. GITHUB  : Iniciar Login (Requer GitHub CLI ou usa PAT/SSH)${NC}"
        echo -e "${YELLOW}  🦊 2. GITLAB  : Iniciar Login (Requer GitLab CLI ou usa PAT/SSH)${NC}"
        echo -e "${YELLOW}  🔐 3. KEYBASE : Iniciar Login (Requer Keybase App)${NC}"
        echo -e "${CYAN}  🛡️  4. SSH KEY : Gerar nova chave criptográfica (Ed25519)${NC}"
        echo -e "${GREEN}  🌐 5. LANG    : Alternar Idioma (EN / PT-BR) -> Atual: PT-BR${NC}"
        echo -e "${DARKGRAY}  🛑 0. VOLTAR  : Retornar ao Terminal Principal${NC}"
    fi
    echo -e "${DARKGRAY} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
}

while true; do
    show_auth_menu
    echo -ne "\n [auth-ops] ❯ "
    read authChoice

    case $authChoice in
        1)
            if [ "$SENTINEL_LANG" == "en" ]; then echo -e "\n${CYAN} [>] Initiating GITHUB authentication protocol...${NC}"; else echo -e "\n${CYAN} [>] Iniciando protocolo de autenticação GITHUB...${NC}"; fi
            
            if command -v gh &> /dev/null; then
                gh auth login
            else
                if [ "$SENTINEL_LANG" == "en" ]; then
                    echo -e "${YELLOW} [!] GitHub CLI (gh) not detected.${NC}"
                    echo -e "${DARKGRAY} [*] Configuring local credential cache...${NC}"
                    git config --global credential.helper cache
                    echo -e "${GREEN} [OK] Cache activated. Login (PAT) will be prompted on your next 'git push'.${NC}"
                else
                    echo -e "${YELLOW} [!] GitHub CLI (gh) não detectado.${NC}"
                    echo -e "${DARKGRAY} [*] Configurando cache de credenciais local...${NC}"
                    git config --global credential.helper cache
                    echo -e "${GREEN} [OK] Cache ativado. O login (PAT) será solicitado no seu próximo 'git push'.${NC}"
                fi
            fi
            pause
            ;;
        2)
            if [ "$SENTINEL_LANG" == "en" ]; then echo -e "\n${CYAN} [>] Initiating GITLAB authentication protocol...${NC}"; else echo -e "\n${CYAN} [>] Iniciando protocolo de autenticação GITLAB...${NC}"; fi
            
            if command -v glab &> /dev/null; then
                glab auth login
            else
                if [ "$SENTINEL_LANG" == "en" ]; then
                    echo -e "${YELLOW} [!] GitLab CLI (glab) not detected.${NC}"
                    echo -e "${DARKGRAY} [*] Hint: Generate an SSH key (Option 4) and add it to GitLab settings,${NC}"
                    echo -e "${DARKGRAY}     or use a Personal Access Token (PAT) on your next push.${NC}"
                else
                    echo -e "${YELLOW} [!] GitLab CLI (glab) não detectado.${NC}"
                    echo -e "${DARKGRAY} [*] Dica: Gere uma chave SSH (Opção 4) e adicione nas configurações do GitLab,${NC}"
                    echo -e "${DARKGRAY}     ou use um Personal Access Token (PAT) no próximo push.${NC}"
                fi
            fi
            pause
            ;;
        3)
            if [ "$SENTINEL_LANG" == "en" ]; then echo -e "\n${CYAN} [>] Initiating KEYBASE authentication protocol...${NC}"; else echo -e "\n${CYAN} [>] Iniciando protocolo de autenticação KEYBASE...${NC}"; fi
            
            if command -v keybase &> /dev/null; then
                keybase login
            else
                if [ "$SENTINEL_LANG" == "en" ]; then echo -e "${RED} [!] Keybase client not detected on the system.${NC}"; else echo -e "${RED} [!] Cliente Keybase não detectado no sistema.${NC}"; fi
            fi
            pause
            ;;
        4)
            if [ "$SENTINEL_LANG" == "en" ]; then 
                echo -e "\n${CYAN} 🛡️ [ HIGH SECURITY SSH KEY GENERATOR (Ed25519) ]${NC}"
                read -p " [?] Enter the email associated with your accounts: " email
            else 
                echo -e "\n${CYAN} 🛡️ [ GERADOR DE CHAVE SSH DE ALTA SEGURANÇA (Ed25519) ]${NC}"
                read -p " [?] Digite o email associado às suas contas: " email
            fi
            
            if [ -n "$(echo -n "$email" | xargs)" ]; then
                SSH_PATH="$HOME/.ssh/id_ed25519"
                if [ -f "$SSH_PATH" ]; then
                    if [ "$SENTINEL_LANG" == "en" ]; then echo -e "${RED} [!] ALERT: An Ed25519 key already exists on your machine!${NC}"; else echo -e "${RED} [!] ALERTA: Uma chave Ed25519 já existe na sua máquina!${NC}"; fi
                else
                    if [ "$SENTINEL_LANG" == "en" ]; then echo -e "${DARKGRAY} [*] Forging cryptographic key...${NC}"; else echo -e "${DARKGRAY} [*] Forjando chave criptográfica...${NC}"; fi
                    ssh-keygen -t ed25519 -C "$email" -f "$SSH_PATH" -N ""
                    if [ "$SENTINEL_LANG" == "en" ]; then echo -e "${GREEN} [OK] Key generated successfully!${NC}"; else echo -e "${GREEN} [OK] Chave gerada com sucesso!${NC}"; fi
                fi

                if [ -f "$SSH_PATH.pub" ]; then
                    if [ "$SENTINEL_LANG" == "en" ]; then 
                        echo -e "\n${MAGENTA} [>] YOUR PUBLIC KEY (Copy and paste into GitHub/GitLab):${NC}"
                        cat "$SSH_PATH.pub" | awk '{print "\033[1;33m" $0 "\033[0m"}'
                        echo -e "\n${DARKGRAY} [*] Hint: Add this key to your Git provider's SSH settings.${NC}"
                    else
                        echo -e "\n${MAGENTA} [>] SUA CHAVE PÚBLICA (Copie e cole no GitHub/GitLab):${NC}"
                        cat "$SSH_PATH.pub" | awk '{print "\033[1;33m" $0 "\033[0m"}'
                        echo -e "\n${DARKGRAY} [*] Dica: Adicione essa chave nas configurações SSH do seu provedor Git.${NC}"
                    fi
                fi
            fi
            pause
            ;;
        5)
            if [ "$SENTINEL_LANG" == "en" ]; then 
                SENTINEL_LANG="pt"
                echo -e "\n${GREEN} [OK] Idioma alterado para Português (PT-BR).${NC}"
            else 
                SENTINEL_LANG="en" 
                echo -e "\n${GREEN} [OK] Language switched to English (EN).${NC}"
            fi
            sleep 1
            ;;
        0)
            if [ "$SENTINEL_LANG" == "en" ]; then echo -e " ${DARKGRAY}[>] Returning to main node...${NC}"; else echo -e " ${DARKGRAY}[>] Retornando ao nó principal...${NC}"; fi
            break
            ;;
        *)
            if [ "$SENTINEL_LANG" == "en" ]; then echo -e "${RED} [!] Command not recognized.${NC}"; else echo -e "${RED} [!] Comando não reconhecido.${NC}"; fi
            sleep 1
            ;;
    esac
done
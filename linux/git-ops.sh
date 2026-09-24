#!/bin/bash

# ==============================================================================
# Chavatte Security | Sentinel Git-OPS v2.3.1 (Core Router - Bash)
# ==============================================================================

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CORE_DIR="$DIR/core"

if [ -f "$CORE_DIR/i18n.sh" ] && [ -f "$CORE_DIR/actions.sh" ]; then
    source "$CORE_DIR/i18n.sh"
    source "$CORE_DIR/actions.sh"
else
    echo -e "\e[0;31m [!] ERRO CRÍTICO: Módulos do núcleo (i18n.sh, actions.sh) não encontrados em $CORE_DIR.\e[0m"
    exit 1
fi

set_language "pt"

export CYAN='\e[0;36m'
export DARKCYAN='\e[1;36m'
export DARKBLUE='\e[0;34m'
export DARKGRAY='\e[1;30m'
export MAGENTA='\e[0;35m'
export WHITE='\e[1;37m'
export YELLOW='\e[1;33m'
export DARKYELLOW='\e[0;33m'
export RED='\e[0;31m'
export GREEN='\e[0;32m'
export NC='\e[0m'

pause() {
    echo ""
    if [ "$SENTINEL_LANG" == "en" ]; then
        read -n 1 -s -r -p " [>] Press any key to continue..."
    else
        read -n 1 -s -r -p " [>] Pressione qualquer tecla para continuar..."
    fi
    echo ""
}

show_menu() {
    clear

    local current_node="N/A (Not a Git Repository)"
    local current_status="N/A"
    local current_remotes="N/A"

    if git rev-parse --is-inside-work-tree &>/dev/null; then
        current_node=$(git branch --show-current)
        if [ -z "$current_node" ]; then current_node="Detached HEAD"; fi

        local mod_files=$(git status -s | wc -l)
        if [ "$mod_files" -eq 0 ]; then
            current_status="Limpo / Clean"
        else
            current_status="$mod_files arquivos modificados / modified files"
        fi

        local rems=$(git remote | tr '\n' ', ' | sed 's/, $//')
        if [ -n "$rems" ]; then current_remotes="$rems"; else current_remotes="Nenhum / None"; fi
    fi

    echo -e ""
    echo -e "${CYAN}      _/_/_/  _/_/_/_/  _/      _/  _/_/_/_/_/  _/  _/      _/  _/_/_/_/  _/        ${NC}"
    echo -e "${CYAN}   _/        _/        _/_/    _/      _/      _/  _/_/    _/  _/        _/         ${NC}"
    echo -e "${DARKCYAN}    _/_/    _/_/_/    _/  _/  _/      _/      _/  _/  _/  _/  _/_/_/    _/          ${NC}"
    echo -e "${DARKCYAN}       _/  _/        _/    _/_/      _/      _/  _/    _/_/  _/        _/           ${NC}"
    echo -e "${DARKBLUE}_/_/_/    _/_/_/_/  _/      _/      _/      _/  _/      _/  _/_/_/_/  _/_/_/_/_/    ${NC}"
    echo -e ""
    echo -e "${DARKGRAY} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
    echo -e "${MAGENTA}$(get_msg "Menu_Header")${NC}"
    echo -e "${DARKGRAY} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
    echo -e "${GREEN}$(get_msg "Dash_Node" "$current_node")${NC}"
    echo -e "${YELLOW}$(get_msg "Dash_Status" "$current_status")${NC}"
    echo -e "${CYAN}$(get_msg "Dash_Remote" "$current_remotes")${NC}"
    echo -e "${DARKGRAY} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
    
    echo -e "${WHITE}$(get_msg "Menu_Main")${NC}"
    echo -e "${YELLOW}$(get_msg "Menu_1")${NC}"
    echo -e "${YELLOW}$(get_msg "Menu_2")${NC}"
    echo -e "${YELLOW}$(get_msg "Menu_3")${NC}"
    echo -e "${YELLOW}$(get_msg "Menu_4")${NC}"
    echo -e "${CYAN}$(get_msg "Menu_5")${NC}"
    echo -e " "
    echo -e "${WHITE}$(get_msg "Menu_Tactical")${NC}"
    echo -e "${CYAN}$(get_msg "Menu_6")${NC}"
    echo -e "${CYAN}$(get_msg "Menu_7")${NC}"
    echo -e "${DARKYELLOW}$(get_msg "Menu_8")${NC}"
    echo -e "${DARKYELLOW}$(get_msg "Menu_9")${NC}"
    echo -e "${RED}$(get_msg "Menu_10")${NC}"
    echo -e "${RED}$(get_msg "Menu_11")${NC}"
    echo -e " "
    echo -e "${WHITE}$(get_msg "Menu_System")${NC}"
    echo -e "${GREEN}$(get_msg "Menu_12")${NC}"
    echo -e "${GREEN}$(get_msg "Menu_13")${NC}"
    echo -e "${GREEN}$(get_msg "Menu_14")${NC}"
    echo -e "${GREEN}$(get_msg "Menu_15")${NC}"
    echo -e "${YELLOW}$(get_msg "Menu_16")${NC}"
    echo -e "${CYAN}$(get_msg "Menu_17")${NC}"
    echo -e "${MAGENTA}$(get_msg "Menu_99")${NC}"
    echo -e "${DARKGRAY}$(get_msg "Menu_0")${NC}"
    echo -e "${DARKGRAY} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
}

show_manual() {
    clear
    if [ "$SENTINEL_LANG" == "en" ]; then
        echo -e "${MAGENTA} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
        echo -e "${MAGENTA}                  OPERATIONS MANUAL SENTINEL GIT-OPS                                ${NC}"
        echo -e "${MAGENTA} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
        echo -e "\n${DARKGRAY} [ NETWORK & MULTI-PUSH ]${NC}"
        echo -e "${CYAN}  🌍 TYPE 'ALL'                 : During push/deploy, sends code to ALL configured remotes.${NC}"
        echo -e "${CYAN}  🌍 git remote add <name> <url>: Links a new remote repository (GitLab, Keybase).${NC}"
        echo -e "\n${DARKGRAY} [ NODE AND BRANCH MANAGEMENT ]${NC}"
        echo -e "${CYAN}  🔀 git branch                 : Lists all available local branches.${NC}"
        echo -e "${CYAN}  🔀 git switch <branch>        : Transfers workspace to the specified branch.${NC}"
        echo -e "${CYAN}  ⚡ git switch -c <branch>     : Creates a new branch and transfers context immediately.${NC}"
        echo -e "${CYAN}  🔥 git branch -d <branch>     : Deletes a branch locally.${NC}"
        echo -e "${CYAN}  🔥 git push origin --delete   : Permanently removes a branch from the server (GitHub).${NC}"
        echo -e "\n${DARKGRAY} [ DEPLOYMENT WORKFLOW ]${NC}"
        echo -e "${CYAN}  💾 git add .                  : Moves folder changes to the 'staging area'.${NC}"
        echo -e "${CYAN}  💾 git commit -m \"msg\"        : Encrypts/saves staged changes in local history.${NC}"
        echo -e "${CYAN}  ⚡ git push -u origin <br>    : Pushes branch to remote for the 1st time, linking them (-u).${NC}"
        echo -e "${CYAN}  🚀 git pull origin main       : Syncs code by downloading updates from remote main.${NC}"
        echo -e "${CYAN}  🚀 git merge <branch>         : Merges (injects) target branch code into current branch.${NC}"
        echo -e "\n${DARKGRAY} [ AUDIT AND SECURITY ]${NC}"
        echo -e "${CYAN}  📊 git status -s              : Displays short state of files (modified, new, etc).${NC}"
        echo -e "${CYAN}  📊 git log --oneline --graph  : Shows the chronological tree of recent commits.${NC}"
        echo -e "${CYAN}  🕵️ git diff                   : Audits modified lines of code before staging.${NC}"
        echo -e "${CYAN}  📡 git fetch --all            : Updates remote repository metadata without altering files.${NC}"
        echo -e "\n${DARKGRAY} [ RECOVERY AND TACTICAL MANEUVERS ]${NC}"
        echo -e "${CYAN}  📦 git stash                  : Saves loose code in a temporary drawer, clearing the screen.${NC}"
        echo -e "${CYAN}  📦 git stash pop              : Restores saved changes from the last drawer.${NC}"
        echo -e "${CYAN}  ⏪ git reset --soft HEAD~1    : Panic Button. Undoes last commit preserving code.${NC}"
        echo -e "${CYAN}  💥 git restore .              : Destruction Protocol. Discards unsaved changes.${NC}"
    else
        echo -e "${MAGENTA} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
        echo -e "${MAGENTA}                  MANUAL DE OPERAÇÕES SENTINEL GIT-OPS                              ${NC}"
        echo -e "${MAGENTA} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
        echo -e "\n${DARKGRAY} [ REDE E MULTI-PUSH ]${NC}"
        echo -e "${CYAN}  🌍 DIGITAR 'ALL'              : Durante o push/deploy, envia o código para TODAS as redes.${NC}"
        echo -e "${CYAN}  🌍 git remote add <nome> <url>: Conecta a um novo repositório (GitLab, Keybase).${NC}"
        echo -e "\n${DARKGRAY} [ GESTÃO DE NODES E BRANCHES ]${NC}"
        echo -e "${CYAN}  🔀 git branch                 : Lista todas as branches locais disponíveis.${NC}"
        echo -e "${CYAN}  🔀 git switch <branch>        : Transfere a área de trabalho para a branch especificada.${NC}"
        echo -e "${CYAN}  ⚡ git switch -c <branch>     : Cria uma nova branch e transfere o contexto imediatamente.${NC}"
        echo -e "${CYAN}  🔥 git branch -d <branch>     : Exclui uma branch localmente.${NC}"
        echo -e "${CYAN}  🔥 git push origin --delete   : Remove uma branch permanentemente do servidor (GitHub).${NC}"
        echo -e "\n${DARKGRAY} [ WORKFLOW DE DEPLOY ]${NC}"
        echo -e "${CYAN}  💾 git add .                  : Move as alterações da pasta para a 'staging area' (preparação).${NC}"
        echo -e "${CYAN}  💾 git commit -m \"msg\"        : Criptografa/salva as alterações preparadas no histórico local.${NC}"
        echo -e "${CYAN}  ⚡ git push -u origin <br>    : Faz o 1º envio da branch ao remoto, criando o vínculo (-u).${NC}"
        echo -e "${CYAN}  🚀 git pull origin main       : Sincroniza o código baixando as novidades da main remota.${NC}"
        echo -e "${CYAN}  🚀 git merge <branch>         : Funde (injeta) o código da branch alvo dentro da branch atual.${NC}"
        echo -e "\n${DARKGRAY} [ AUDITORIA E SEGURANÇA ]${NC}"
        echo -e "${CYAN}  📊 git status -s              : Exibe o estado resumido dos arquivos (modificados, novos, etc).${NC}"
        echo -e "${CYAN}  📊 git log --oneline --graph  : Mostra a árvore cronológica dos últimos commits.${NC}"
        echo -e "${CYAN}  🕵️ git diff                   : Audita as linhas de código modificadas antes da preparação.${NC}"
        echo -e "${CYAN}  📡 git fetch --all            : Atualiza metadados do repositório remoto sem alterar arquivos.${NC}"
        echo -e "\n${DARKGRAY} [ RECUPERAÇÃO E MANOBRAS TÁTICAS ]${NC}"
        echo -e "${CYAN}  📦 git stash                  : Salva código solto em uma gaveta temporária, limpando a tela.${NC}"
        echo -e "${CYAN}  📦 git stash pop              : Restaura as alterações salvas na última gaveta.${NC}"
        echo -e "${CYAN}  ⏪ git reset --soft HEAD~1    : Botão de Pânico. Desfaz o último commit preservando o código.${NC}"
        echo -e "${CYAN}  💥 git restore .              : Protocolo de Destruição. Descarta alterações não salvas.${NC}"
    fi
    echo -e "${MAGENTA} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
    pause
}

while true; do
    show_menu
    
    get_msg "Prompt"
    read choice

    case $choice in
        1)  invoke_initiate ;;
        2)  invoke_commit ;;
        3)  invoke_deploy ;;
        4)  invoke_purge ;;
        5)  invoke_switch ;;
        6)  invoke_status ;;
        7)  invoke_stash ;;
        8)  invoke_audit ;;
        9)  invoke_radar ;;
        10) invoke_revert ;;
        11) invoke_discard ;;
        12) invoke_install ;;
        13)
            if [ "$SENTINEL_LANG" == "en" ]; then 
                set_language "pt"
            else 
                set_language "en"
            fi
            echo -e "${GREEN}$(get_msg "Lang_Ok")${NC}"
            sleep 1
            ;;
        14) invoke_network ;;
        15)
            if [ -f "$CORE_DIR/auth-ops.sh" ]; then
                bash "$CORE_DIR/auth-ops.sh" "$SENTINEL_LANG"
            else
                echo -e "${RED}$(get_msg "Auth_Err")${NC}"
                pause
            fi
            ;;
        16) invoke_update ;;
        17) invoke_shield ;;
        99) show_manual ;;
        0)
            echo -e "${DARKGRAY}$(get_msg "Exit")${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}$(get_msg "Invalid")${NC}"
            sleep 1
            ;;
    esac
done
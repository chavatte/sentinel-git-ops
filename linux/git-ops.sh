#!/bin/bash

CYAN='\e[0;36m'
DARKCYAN='\e[1;36m'
DARKBLUE='\e[0;34m'
DARKGRAY='\e[1;30m'
MAGENTA='\e[0;35m'
WHITE='\e[1;37m'
YELLOW='\e[1;33m'
DARKYELLOW='\e[0;33m'
RED='\e[0;31m'
GREEN='\e[0;32m'
NC='\e[0m' # No Color

SENTINEL_LANG="en"

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
    echo -e ""
    echo -e "${CYAN}      _/_/_/  _/_/_/_/  _/      _/  _/_/_/_/_/  _/  _/      _/  _/_/_/_/  _/        ${NC}"
    echo -e "${CYAN}   _/        _/        _/_/    _/      _/      _/  _/_/    _/  _/        _/         ${NC}"
    echo -e "${DARKCYAN}    _/_/    _/_/_/    _/  _/  _/      _/      _/  _/  _/  _/  _/_/_/    _/          ${NC}"
    echo -e "${DARKCYAN}       _/  _/        _/    _/_/      _/      _/  _/    _/_/  _/        _/           ${NC}"
    echo -e "${DARKBLUE}_/_/_/    _/_/_/_/  _/      _/      _/      _/  _/      _/  _/_/_/_/  _/_/_/_/_/    ${NC}"
    echo -e ""
    echo -e "${DARKGRAY} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
    echo -e "${MAGENTA}                     Chavatte Security | Sentinel Git-OPS                    ${NC}"
    echo -e "${DARKGRAY} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
    
    if [ "$SENTINEL_LANG" == "en" ]; then
        echo -e "${WHITE}  [ MAIN WORKFLOW ]${NC}"
        echo -e "${YELLOW}  ⚡ 1. INITIATE : Provision Feature Branch + Push${NC}"
        echo -e "${YELLOW}  💾 2. COMMIT   : Record Changes (Add + Commit)${NC}"
        echo -e "${YELLOW}  🚀 3. DEPLOY   : Merge to Main + Push${NC}"
        echo -e "${YELLOW}  🔥 4. PURGE    : Clean Local Node (Delete Branch)${NC}"
        echo -e "${CYAN}  🔀 5. SWITCH   : Change Node (Checkout Branch)${NC}"
        echo -e " "
        echo -e "${WHITE}  [ TACTICAL TOOLS ]${NC}"
        echo -e "${CYAN}  📊 6.  STATUS  : Check Integrity (Status & Log)${NC}"
        echo -e "${CYAN}  📦 7.  STASH   : Tactical Storage (Guard/Restore)${NC}"
        echo -e "${DARKYELLOW}  🕵️ 8.  AUDIT   : Inspect Code (Diff)${NC}"
        echo -e "${DARKYELLOW}  📡 9.  RADAR   : Remote Scan (Fetch + Status)${NC}"
        echo -e "${RED}  ⏪ 10. REVERT  : Panic Button (Undo Last Commit)${NC}"
        echo -e "${RED}  💥 11. DISCARD : Reset Unsaved Changes${NC}"
        echo -e " "
        echo -e "${WHITE}  [ SYSTEM ]${NC}"
        echo -e "${GREEN}  ⚙️ 12. INSTALL : Inject into ~/.bashrc or ~/.zshrc (Global)${NC}"
        echo -e "${GREEN}  🌐 13. LANG    : Switch Language (EN / PT-BR) -> Current: EN${NC}"
        echo -e "${MAGENTA}  📖 99. MANUAL  : Command Documentation (Help)${NC}"
        echo -e "${DARKGRAY}  🛑 0.  EXIT    : Close Terminal${NC}"
    else
        echo -e "${WHITE}  [ WORKFLOW PRINCIPAL ]${NC}"
        echo -e "${YELLOW}  ⚡ 1. INITIATE : Provisionar Feature Branch + Push${NC}"
        echo -e "${YELLOW}  💾 2. COMMIT   : Registrar Alterações (Add + Commit)${NC}"
        echo -e "${YELLOW}  🚀 3. DEPLOY   : Realizar Merge na Main + Push${NC}"
        echo -e "${YELLOW}  🔥 4. PURGE    : Limpar Node Local (Excluir Branch)${NC}"
        echo -e "${CYAN}  🔀 5. SWITCH   : Mudar de Node (Trocar de Branch)${NC}"
        echo -e " "
        echo -e "${WHITE}  [ FERRAMENTAS TÁTICAS ]${NC}"
        echo -e "${CYAN}  📊 6.  STATUS  : Verificar Integridade (Status & Log)${NC}"
        echo -e "${CYAN}  📦 7.  STASH   : Armazenamento Tático (Guardar/Restaurar)${NC}"
        echo -e "${DARKYELLOW}  🕵️ 8.  AUDIT   : Inspecionar Código (Diff)${NC}"
        echo -e "${DARKYELLOW}  📡 9.  RADAR   : Varredura Remota (Fetch + Status)${NC}"
        echo -e "${RED}  ⏪ 10. REVERT  : Botão de Pânico (Desfazer Último Commit)${NC}"
        echo -e "${RED}  💥 11. DISCARD : Resetar Alterações Não Salvas${NC}"
        echo -e " "
        echo -e "${WHITE}  [ SISTEMA ]${NC}"
        echo -e "${GREEN}  ⚙️ 12. INSTALL : Injetar no ~/.bashrc ou ~/.zshrc (Global)${NC}"
        echo -e "${GREEN}  🌐 13. LANG    : Alternar Idioma (EN / PT-BR) -> Atual: PT-BR${NC}"
        echo -e "${MAGENTA}  📖 99. MANUAL  : Documentação de Comandos (Help)${NC}"
        echo -e "${DARKGRAY}  🛑 0.  EXIT    : Encerrar Terminal${NC}"
    fi
    echo -e "${DARKGRAY} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
}

while true; do
    show_menu
    
    echo -ne "\n [chavatte@sentinel] ❯ "
    read choice

    case $choice in
        1)
            if [ "$SENTINEL_LANG" == "en" ]; then
                read -p " [?] Enter the new branch name: " branchName
            else
                read -p " [?] Insira o nome da nova branch: " branchName
            fi
            
            if [ -z "$(echo -n "$branchName" | xargs)" ]; then continue; fi
            
            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "\n${CYAN} ⚡ ENGAGING: Provisioning branch '$branchName'...${NC}"
                git switch -c "$branchName"
                echo -e "${CYAN} ⚡ UPLINK: Establishing connection to remote repo...${NC}"
                git push -u origin "$branchName"
                echo -e "\n${GREEN} [OK] Link established. Terminal cleared for code.${NC}"
            else
                echo -e "\n${CYAN} ⚡ ENGAGING: Provisionando branch '$branchName'...${NC}"
                git switch -c "$branchName"
                echo -e "${CYAN} ⚡ UPLINK: Estabelecendo conexão com o repositório remoto...${NC}"
                git push -u origin "$branchName"
                echo -e "\n${GREEN} [OK] Link estabelecido. Terminal liberado para código.${NC}"
            fi
            pause
            ;;
        2)
            if [ "$SENTINEL_LANG" == "en" ]; then 
                echo -e "\n${CYAN} 📊 SCANNING MODIFIED FILES:${NC}"
            else 
                echo -e "\n${CYAN} 📊 ESCANEANDO ARQUIVOS MODIFICADOS:${NC}"
            fi
            git status -s
            echo ""
            
            if [ "$SENTINEL_LANG" == "en" ]; then
                read -p " [?] Enter commit message (or leave empty to abort): " commitMsg
            else
                read -p " [?] Insira a mensagem do commit (ou deixe vazio para abortar): " commitMsg
            fi
            
            if [ -z "$(echo -n "$commitMsg" | xargs)" ]; then
                if [ "$SENTINEL_LANG" == "en" ]; then 
                    echo -e "${YELLOW} [!] ALERT: Commit operation canceled.${NC}" 
                else 
                    echo -e "${YELLOW} [!] ALERTA: Operação de commit cancelada.${NC}" 
                fi
                pause
                continue
            fi

            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "\n${DARKGRAY} 💾 Preparing packages (git add .)...${NC}"
                git add .
                echo -e "${DARKGRAY} 💾 Encrypting record in history (git commit)...${NC}"
                git commit -m "$commitMsg"
                echo -e "\n${GREEN} [OK] Changes successfully recorded on current node.${NC}"
            else
                echo -e "\n${DARKGRAY} 💾 Preparando pacotes (git add .)...${NC}"
                git add .
                echo -e "${DARKGRAY} 💾 Criptografando registro no histórico (git commit)...${NC}"
                git commit -m "$commitMsg"
                echo -e "\n${GREEN} [OK] Alterações registradas com sucesso no node atual.${NC}"
            fi
            pause
            ;;
        3)
            currentBranch=$(git branch --show-current)
            if [ "$currentBranch" == "main" ]; then
                if [ "$SENTINEL_LANG" == "en" ]; then 
                    echo -e "\n${RED} [!] ALERT: You are already on the main branch. Operation aborted.${NC}" 
                else 
                    echo -e "\n${RED} [!] ALERTA: Você já está na branch main. Operação abortada.${NC}" 
                fi
                pause
                continue
            fi

            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "\n${YELLOW} 🚀 INITIATING MERGE SEQUENCE: '$currentBranch' -> 'main'...${NC}"
                echo -e "${DARKGRAY} [*] Switching to main...${NC}"
                git switch main
                echo -e "${DARKGRAY} [*] Synchronizing remote packages (git pull)...${NC}"
                git pull origin main
                echo -e "${DARKGRAY} [*] Injecting code from '$currentBranch'...${NC}"
                git merge "$currentBranch"
                echo -e "${DARKGRAY} [*] Deploying to cloud...${NC}"
                git push origin main
                echo -e "\n${GREEN} [OK] Deploy completed successfully. Code secured in main.${NC}"
                read -p " [?] Execute PURGE protocol on branch '$currentBranch'? (y/n): " deleteChoice
            else
                echo -e "\n${YELLOW} 🚀 INICIANDO SEQUÊNCIA DE MERGE: '$currentBranch' -> 'main'...${NC}"
                echo -e "${DARKGRAY} [*] Alterando para main...${NC}"
                git switch main
                echo -e "${DARKGRAY} [*] Sincronizando pacotes remotos (git pull)...${NC}"
                git pull origin main
                echo -e "${DARKGRAY} [*] Injetando código da '$currentBranch'...${NC}"
                git merge "$currentBranch"
                echo -e "${DARKGRAY} [*] Realizando deploy para a nuvem...${NC}"
                git push origin main
                echo -e "\n${GREEN} [OK] Deploy concluído com sucesso. Código seguro na main.${NC}"
                read -p " [?] Executar protocolo PURGE na branch '$currentBranch'? (s/n): " deleteChoice
            fi
            
            if [[ "$deleteChoice" =~ ^[YySs]$ ]]; then
                git branch -d "$currentBranch"
                git push origin --delete "$currentBranch"
                if [ "$SENTINEL_LANG" == "en" ]; then 
                    echo -e "${GREEN} [OK] Branch '$currentBranch' eliminated.${NC}" 
                else 
                    echo -e "${GREEN} [OK] Branch '$currentBranch' eliminada.${NC}" 
                fi
            fi
            pause
            ;;
        4)
            git branch
            echo ""
            if [ "$SENTINEL_LANG" == "en" ]; then 
                read -p " [?] Enter the target for the PURGE protocol: " branchToDelete
            else 
                read -p " [?] Insira o alvo para o protocolo PURGE: " branchToDelete
            fi
            
            if [ "$branchToDelete" == "main" ]; then
                if [ "$SENTINEL_LANG" == "en" ]; then 
                    echo -e "${RED} [!] ACCESS DENIED: Main branch cannot be deleted.${NC}" 
                else 
                    echo -e "${RED} [!] ACESSO NEGADO: A branch main não pode ser excluída.${NC}" 
                fi
            elif [ ! -z "$(echo -n "$branchToDelete" | xargs)" ]; then
                git branch -d "$branchToDelete"
                git push origin --delete "$branchToDelete"
                if [ "$SENTINEL_LANG" == "en" ]; then 
                    echo -e "${GREEN} [OK] Node purge completed.${NC}" 
                else 
                    echo -e "${GREEN} [OK] Limpeza de node concluída.${NC}" 
                fi
            fi
            pause
            ;;
        5)
            if [ "$SENTINEL_LANG" == "en" ]; then 
                echo -e "\n${CYAN} 🔀 AVAILABLE NODES (Local Branches):${NC}" 
            else 
                echo -e "\n${CYAN} 🔀 NODES DISPONÍVEIS (Branches Locais):${NC}" 
            fi
            git branch
            echo ""
            
            if [ "$SENTINEL_LANG" == "en" ]; then 
                read -p " [?] Enter target node (branch) name: " targetBranch
            else 
                read -p " [?] Insira o nome do node (branch) de destino: " targetBranch
            fi
            
            if [ ! -z "$(echo -n "$targetBranch" | xargs)" ]; then
                if [ "$SENTINEL_LANG" == "en" ]; then
                    echo -e "\n${YELLOW} 🔀 TRANSFERRING ROUTE TO: '$targetBranch'...${NC}"
                    git switch "$targetBranch"
                    echo -e "\n${CYAN} 📊 CURRENT BRANCH STATUS:${NC}"
                else
                    echo -e "\n${YELLOW} 🔀 TRANSFERINDO ROTA PARA: '$targetBranch'...${NC}"
                    git switch "$targetBranch"
                    echo -e "\n${CYAN} 📊 STATUS DA BRANCH ATUAL:${NC}"
                fi
                git status -s
            fi
            pause
            ;;
        6)
            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "\n${CYAN} 📊 REPOSITORY STATUS:${NC}"
                git status -s
                echo -e "\n${CYAN} 📊 RECENT HISTORY (Last 5 commits):${NC}"
            else
                echo -e "\n${CYAN} 📊 STATUS DO REPOSITÓRIO:${NC}"
                git status -s
                echo -e "\n${CYAN} 📊 HISTÓRICO RECENTE (Últimos 5 commits):${NC}"
            fi
            git log --oneline --graph -n 5
            echo " "
            pause
            ;;
        7)
            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "\n${YELLOW} [1] Store changes in drawer (Stash Push)${NC}"
                echo -e "${YELLOW} [2] Restore last drawer (Stash Pop)${NC}"
                echo -e "${YELLOW} [3] View saved drawers (Stash List)${NC}"
                read -p " [?] Choose tactical action: " stashChoice
                case $stashChoice in
                    1) git stash; echo -e "${GREEN} [OK] Changes stored.${NC}" ;;
                    2) git stash pop; echo -e "${GREEN} [OK] Changes restored.${NC}" ;;
                    3) git stash list ;;
                    *) echo -e "${RED} [!] Action canceled.${NC}" ;;
                esac
            else
                echo -e "\n${YELLOW} [1] Guardar alterações na gaveta (Stash Push)${NC}"
                echo -e "${YELLOW} [2] Restaurar última gaveta (Stash Pop)${NC}"
                echo -e "${YELLOW} [3] Ver gavetas salvas (Stash List)${NC}"
                read -p " [?] Escolha a ação tática: " stashChoice
                case $stashChoice in
                    1) git stash; echo -e "${GREEN} [OK] Alterações guardadas.${NC}" ;;
                    2) git stash pop; echo -e "${GREEN} [OK] Alterações restauradas.${NC}" ;;
                    3) git stash list ;;
                    *) echo -e "${RED} [!] Ação cancelada.${NC}" ;;
                esac
            fi
            pause
            ;;
        8)
            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "\n${YELLOW} [1] Inspect unstaged files (git diff)${NC}"
                echo -e "${YELLOW} [2] Inspect staged files ready for commit (git diff --staged)${NC}"
                read -p " [?] Choose audit type: " diffChoice
                echo -e "\n${MAGENTA} [>] Press 'q' to exit the inspection screen after reading.${NC}"
            else
                echo -e "\n${YELLOW} [1] Inspecionar arquivos não preparados (git diff)${NC}"
                echo -e "${YELLOW} [2] Inspecionar arquivos prontos para commit (git diff --staged)${NC}"
                read -p " [?] Escolha o tipo de auditoria: " diffChoice
                echo -e "\n${MAGENTA} [>] Pressione 'q' para sair da tela de inspeção após ler.${NC}"
            fi
            sleep 2
            
            if [ "$diffChoice" == "1" ]; then git diff
            elif [ "$diffChoice" == "2" ]; then git diff --staged
            else 
                if [ "$SENTINEL_LANG" == "en" ]; then echo -e "${RED} [!] Action canceled.${NC}"; else echo -e "${RED} [!] Ação cancelada.${NC}"; fi
            fi
            pause
            ;;
        9)
            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "\n${CYAN} 📡 INITIATING RADAR SCAN (Fetch)...${NC}"
                git fetch --all
                echo -e "\n${CYAN} 📡 COMPARING ROUTES (Status)...${NC}"
                git status
                echo -e "\n${GREEN} [OK] Scan completed. Your local code was not altered.${NC}"
            else
                echo -e "\n${CYAN} 📡 INICIANDO VARREDURA DE RADAR (Fetch)...${NC}"
                git fetch --all
                echo -e "\n${CYAN} 📡 COMPARANDO ROTAS (Status)...${NC}"
                git status
                echo -e "\n${GREEN} [OK] Varredura concluída. Seu código local não foi alterado.${NC}"
            fi
            pause
            ;;
        10)
            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "\n${RED} ⏪ [!!!] WARNING: PANIC BUTTON TRIGGERED [!!!]${NC}"
                echo -e "${YELLOW} This will undo your LAST commit, but keep your files intact and ready for a new commit.${NC}"
                read -p " [?] Are you sure you want to revert the last commit? (y/n): " confirmRevert
                if [[ "$confirmRevert" =~ ^[YySs]$ ]]; then
                    git reset --soft HEAD~1
                    echo -e "\n${GREEN} [OK] Last commit undone. Your files are in the 'stage area' awaiting review.${NC}"
                    git status -s
                else
                    echo -e "\n${GREEN} [>] Operation aborted.${NC}"
                fi
            else
                echo -e "\n${RED} ⏪ [!!!] ATENÇÃO: BOTÃO DE PÂNICO ACIONADO [!!!]${NC}"
                echo -e "${YELLOW} Isso vai desfazer o seu ÚLTIMO commit, mas manterá seus arquivos intactos e prontos para um novo commit.${NC}"
                read -p " [?] Tem certeza que deseja reverter o último commit? (s/n): " confirmRevert
                if [[ "$confirmRevert" =~ ^[YySs]$ ]]; then
                    git reset --soft HEAD~1
                    echo -e "\n${GREEN} [OK] Último commit desfeito. Seus arquivos estão na 'stage area' aguardando revisão.${NC}"
                    git status -s
                else
                    echo -e "\n${GREEN} [>] Operação abortada.${NC}"
                fi
            fi
            pause
            ;;
        11)
            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "\n${RED} 💥 [!!!] DESTRUCTION PROTOCOL [!!!]${NC}"
                echo -e "${YELLOW} This will DISCARD ALL unsaved changes. Files will return to their last committed state.${NC}"
                read -p " [?] Are you absolutely sure? This action CANNOT be undone! (y/n): " confirmRestore
                if [[ "$confirmRestore" =~ ^[YySs]$ ]]; then
                    git restore .
                    echo -e "\n${GREEN} [OK] All unsaved changes vaporized. Code is clean.${NC}"
                else
                    echo -e "\n${GREEN} [>] Operation aborted.${NC}"
                fi
            else
                echo -e "\n${RED} 💥 [!!!] PROTOCOLO DE DESTRUIÇÃO [!!!]${NC}"
                echo -e "${YELLOW} Isso vai DESCARTAR TODAS as alterações não salvas. Os arquivos voltarão ao estado do último commit.${NC}"
                read -p " [?] Tem certeza absoluta? Essa ação NÃO PODE ser desfeita! (s/n): " confirmRestore
                if [[ "$confirmRestore" =~ ^[YySs]$ ]]; then
                    git restore .
                    echo -e "\n${GREEN} [OK] Todas as alterações não salvas foram vaporizadas. Código limpo.${NC}"
                else
                    echo -e "\n${GREEN} [>] Operação abortada.${NC}"
                fi
            fi
            pause
            ;;
        12)
            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "\n${YELLOW} ⚙️ [!!!] GLOBAL INJECTION PROTOCOL [!!!]${NC}"
            else
                echo -e "\n${YELLOW} ⚙️ [!!!] PROTOCOLO DE INJEÇÃO GLOBAL [!!!]${NC}"
            fi
            
            # Obtém o caminho absoluto do script no Linux
            CURRENT_SCRIPT_PATH=$(readlink -f "$0")
            
            if [ -z "$CURRENT_SCRIPT_PATH" ]; then
                if [ "$SENTINEL_LANG" == "en" ]; then
                    echo -e "${RED} [!] ERROR: Terminal could not identify its own directory.${NC}"
                else
                    echo -e "${RED} [!] ERRO: O terminal não conseguiu identificar o próprio diretório.${NC}"
                fi
            else
                if [ "$SENTINEL_LANG" == "en" ]; then 
                    echo -e "${DARKGRAY} [+] Source directory detected: $CURRENT_SCRIPT_PATH${NC}" 
                else 
                    echo -e "${DARKGRAY} [+] Diretório de origem detectado: $CURRENT_SCRIPT_PATH${NC}" 
                fi
                
                USER_SHELL=$(basename "$SHELL")
                PROFILE_FILE="$HOME/.${USER_SHELL}rc"
                
                if [ ! -f "$PROFILE_FILE" ]; then
                    PROFILE_FILE="$HOME/.bashrc"
                fi

                if [ "$SENTINEL_LANG" == "en" ]; then 
                    read -p " [?] Enter the alias name to call the terminal (e.g., git-ops, sentinel). Default: git-ops: " funcName
                else 
                    read -p " [?] Digite o alias que deseja usar para chamar o terminal (ex: git-ops, sentinel). Padrão: git-ops: " funcName
                fi
                
                if [ -z "$(echo -n "$funcName" | xargs)" ]; then funcName="git-ops"; fi
                
                if grep -q "alias $funcName=" "$PROFILE_FILE"; then
                    if [ "$SENTINEL_LANG" == "en" ]; then 
                        echo -e "\n${YELLOW} [!] ALERT: The command '$funcName' is already installed in your $PROFILE_FILE!${NC}" 
                    else 
                        echo -e "\n${YELLOW} [!] ALERTA: O alias '$funcName' já está instalado no seu $PROFILE_FILE!${NC}" 
                    fi
                else
                    echo "" >> "$PROFILE_FILE"
                    echo "# Vexor DevSec Terminal" >> "$PROFILE_FILE"
                    echo "alias $funcName=\"bash '$CURRENT_SCRIPT_PATH'\"" >> "$PROFILE_FILE"
                    
                    if [ "$SENTINEL_LANG" == "en" ]; then
                        echo -e "\n${GREEN} [OK] Success! Command '$funcName' injected globally in $PROFILE_FILE.${NC}"
                        echo -e "${CYAN} [>] Run 'source $PROFILE_FILE' or open a new terminal to use it.${NC}"
                    else
                        echo -e "\n${GREEN} [OK] Sucesso! O alias '$funcName' foi injetado globalmente no $PROFILE_FILE.${NC}"
                        echo -e "${CYAN} [>] Rode 'source $PROFILE_FILE' ou abra uma nova aba do terminal para usar.${NC}"
                    fi
                fi
            fi
            pause
            ;;
        13)
            if [ "$SENTINEL_LANG" == "en" ]; then 
                SENTINEL_LANG="pt"
                echo -e "\n${GREEN} [OK] Idioma alterado para Português (PT-BR).${NC}"
            else 
                SENTINEL_LANG="en" 
                echo -e "\n${GREEN} [OK] Language switched to English (EN).${NC}"
            fi
            sleep 1
            ;;
        99)
            clear
            if [ "$SENTINEL_LANG" == "en" ]; then
                echo -e "${MAGENTA} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
                echo -e "${MAGENTA}                  OPERATIONS MANUAL SENTINEL GIT-OPS                                ${NC}"
                echo -e "${MAGENTA} ────────────────────────────────────────────────────────────────────────────────── ${NC}"
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
            ;;
        0)
            if [ "$SENTINEL_LANG" == "en" ]; then 
                echo -e " ${DARKGRAY}🛑 Closing session...${NC}" 
            else 
                echo -e " ${DARKGRAY}🛑 Encerrando sessão...${NC}" 
            fi
            exit 0
            ;;
        *)
            if [ "$SENTINEL_LANG" == "en" ]; then 
                echo -e "${RED} [!] Command not recognized.${NC}" 
            else 
                echo -e "${RED} [!] Comando não reconhecido.${NC}" 
            fi
            sleep 1
            ;;
    esac
done
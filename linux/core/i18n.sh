#!/bin/bash

# ==============================================================================
# CHAVATTE SECURITY | I18N MODULE (Language Dictionary - Bash)
# ==============================================================================

export SENTINEL_LANG="pt"

set_language() {
    SENTINEL_LANG=$1
}

get_msg() {
    local key=$1
    local p1=$2

    if [ "$SENTINEL_LANG" == "pt" ]; then
        case "$key" in
            # --- MENU ---
            "Menu_Header")    echo "                     Chavatte Security | Sentinel Git-OPS v2.3.1                         " ;;
            "Dash_Node")      echo "  📍 Node Atual : $p1" ;;
            "Dash_Status")    echo "  📊 Status     : $p1" ;;
            "Dash_Remote")    echo "  🌍 Nuvem      : $p1" ;;
            "Menu_Main")      echo "  [ WORKFLOW PRINCIPAL ]" ;;
            "Menu_1")         echo "  ⚡ 1. INITIATE : Provisionar Feature Branch + Push" ;;
            "Menu_2")         echo "  💾 2. COMMIT   : Registrar Alterações (Add + Commit)" ;;
            "Menu_3")         echo "  🚀 3. DEPLOY   : Realizar Merge na Main + Push" ;;
            "Menu_4")         echo "  🔥 4. PURGE    : Limpar Node Local (Excluir Branch)" ;;
            "Menu_5")         echo "  🔀 5. SWITCH   : Mudar de Node (Trocar de Branch)" ;;
            "Menu_Tactical")  echo "  [ FERRAMENTAS TÁTICAS ]" ;;
            "Menu_6")         echo "  📊 6.  STATUS  : Verificar Integridade (Status & Log)" ;;
            "Menu_7")         echo "  📦 7.  STASH   : Armazenamento Tático (Guardar/Restaurar)" ;;
            "Menu_8")         echo "  🕵️ 8.  AUDIT   : Inspecionar Código (Diff)" ;;
            "Menu_9")         echo "  📡 9.  RADAR   : Varredura Remota (Fetch + Status)" ;;
            "Menu_10")        echo "  ⏪ 10. REVERT  : Botão de Pânico (Desfazer Último Commit)" ;;
            "Menu_11")        echo "  💥 11. DISCARD : Resetar Alterações Não Salvas" ;;
            "Menu_System")    echo "  [ SISTEMA E REDE ]" ;;
            "Menu_12")        echo "  ⚙️ 12. INSTALL : Injetar no ~/.bashrc ou ~/.zshrc (Global)" ;;
            "Menu_13")        echo "  🌐 13. LANG    : Alternar Idioma (EN / PT-BR) -> Atual: PT-BR" ;;
            "Menu_14")        echo "  🌍 14. NETWORK : Gerenciar Remotes e Multi-Push (GitLab, Keybase)" ;;
            "Menu_15")        echo "  🔐 15. AUTH    : Gerenciar Credenciais (GitHub, GitLab, Keybase)" ;;
            "Menu_16")        echo "  🔄 16. UPDATE  : Atualizar o Sentinel (Self-Update via Git)" ;;
            "Menu_17")        echo -e "  🛡️ 17. SHIELD  : Injetar Pre-Commit Hook (Bloqueio de Segredos)" ;;
            "Menu_99")        echo "  📖 99. MANUAL  : Documentação de Comandos (Help)" ;;
            "Menu_0")         echo "  🛑 0.  EXIT    : Encerrar Terminal" ;;
            
            # --- GERAL ---
            "Prompt")         echo -ne " [chavatte@sentinel] ❯ " ;;
            "Exit")           echo " 🛑 Encerrando sessão..." ;;
            "Invalid")        echo " [!] Comando não reconhecido." ;;
            "NoRemote")       echo -e "\n [!] ALERTA: Nenhum remote configurado! Use a opção 14 para adicionar uma rede." ;;
            "Networks")       echo -e "\n 🌍 Redes Detectadas: $p1" ;;
            
            # --- WORKFLOW ---
            "Init_AskBranch") echo -ne " [?] Insira o nome da nova branch: " ;;
            "Init_Engage")    echo -e "\n ⚡ ENGAGING: Provisionando branch '$p1'..." ;;
            "Init_AskRem")    echo -ne " [?] Digite o destino (ex: origin, gitlab) ou 'ALL' para multi-push. Padrão: origin: " ;;
            "Uplink")         echo " ⚡ UPLINK: Transmitindo para $p1..." ;;
            "Init_Ok")        echo -e "\n [OK] Link estabelecido. Terminal liberado para código." ;;
            "Com_Scan")       echo -e "\n 📊 ESCANEANDO ARQUIVOS MODIFICADOS:" ;;
            "Com_AskMsg")     echo -ne " [?] Insira a mensagem do commit (ou deixe vazio para abortar): " ;;
            "Com_Cancel")     echo " [!] ALERTA: Operação de commit cancelada." ;;
            "Com_Prep")       echo -e "\n 💾 Preparando pacotes (git add .)..." ;;
            "Com_Crypt")      echo " 💾 Criptografando registro no histórico (git commit)..." ;;
            "Com_Ok")         echo -e "\n [OK] Alterações registradas com sucesso no node atual." ;;
            "Dep_AlrMain")    echo -e "\n [!] ALERTA: Você já está na branch main. Operação abortada." ;;
            "Dep_Seq")        echo -e "\n 🚀 INICIANDO SEQUÊNCIA DE MERGE: '$p1' -> 'main'..." ;;
            "Dep_SwMain")     echo " [*] Alterando para main..." ;;
            "Dep_Sync")       echo " [*] Sincronizando pacotes remotos (git pull)..." ;;
            "Dep_Merge")      echo " [*] Injetando código da '$p1'..." ;;
            "Dep_AskRem")     echo -ne " [?] Digite a rede de destino ou 'ALL' para multi-push. Padrão: origin: " ;;
            "Dep_Cloud")      echo " [*] Realizando deploy para a nuvem..." ;;
            "Dep_Ok")         echo -e "\n [OK] Deploy concluído com sucesso. Código seguro na main." ;;
            "Dep_AskPurge")   echo -ne " [?] Executar protocolo PURGE na branch '$p1'? (s/n): " ;;
            "Dep_PurgeOk")    echo " [OK] Branch '$p1' eliminada." ;;
            "Purg_AskBranch") echo -ne " [?] Insira o alvo para o protocolo PURGE: " ;;
            "Purg_MainDeny")  echo " [!] ACESSO NEGADO: A branch main não pode ser excluída." ;;
            "Purg_AskRem")    echo -ne " [?] Excluir de qual remote? (ex: origin, ALL). Padrão: origin: " ;;
            "Purg_Ok")        echo " [OK] Limpeza de node concluída." ;;
            "Sw_Avail")       echo -e "\n 🔀 NODES DISPONÍVEIS (Branches Locais):" ;;
            "Sw_AskNode")     echo -ne " [?] Insira o nome do node (branch) de destino: " ;;
            "Sw_Transf")      echo -e "\n 🔀 TRANSFERINDO ROTA PARA: '$p1'..." ;;
            "Sw_Status")      echo -e "\n 📊 STATUS DA BRANCH ATUAL:" ;;

            # --- TACTICAL ---
            "Stat_Title")     echo -e "\n 📊 STATUS DO REPOSITÓRIO:" ;;
            "Stat_Hist")      echo -e "\n 📊 HISTÓRICO RECENTE (Últimos 5 commits):" ;;
            "Stash_O1")       echo -e "\n [1] Guardar alterações na gaveta (Stash Push)" ;;
            "Stash_O2")       echo " [2] Restaurar última gaveta (Stash Pop)" ;;
            "Stash_O3")       echo " [3] Ver gavetas salvas (Stash List)" ;;
            "Stash_Ask")      echo -ne " [?] Escolha a ação tática: " ;;
            "Stash_Save")     echo " [OK] Alterações guardadas." ;;
            "Stash_Rest")     echo " [OK] Alterações restauradas." ;;
            "Cancel")         echo " [!] Ação cancelada." ;;
            "Aud_O1")         echo -e "\n [1] Inspecionar arquivos não preparados (git diff)" ;;
            "Aud_O2")         echo " [2] Inspecionar arquivos prontos para commit (git diff --staged)" ;;
            "Aud_Ask")        echo -ne " [?] Escolha o tipo de auditoria: " ;;
            "Aud_Hint")       echo -e "\n [>] Pressione 'q' para sair da tela de inspeção." ;;
            "Rad_Init")       echo -e "\n 📡 INICIANDO VARREDURA DE RADAR (Fetch)..." ;;
            "Rad_Comp")       echo -e "\n 📡 COMPARANDO ROTAS (Status)..." ;;
            "Rad_Ok")         echo -e "\n [OK] Varredura concluída. Seu código local não foi alterado." ;;
            "Rev_Warn")       echo -e "\n ⏪ [!!!] ATENÇÃO: BOTÃO DE PÂNICO ACIONADO [!!!]" ;;
            "Rev_Desc")       echo " Desfaz o ÚLTIMO commit mantendo os arquivos prontos para novo commit." ;;
            "Rev_Ask")        echo -ne " [?] Reverter o último commit? (s/n): " ;;
            "Rev_Ok")         echo -e "\n [OK] Último commit desfeito. Arquivos na 'stage area'." ;;
            "Abort")          echo -e "\n [>] Operação abortada." ;;
            "Dis_Warn")       echo -e "\n 💥 [!!!] PROTOCOLO DE DESTRUIÇÃO [!!!]" ;;
            "Dis_Desc")       echo " DESCARTA TODAS as alterações não salvas voltando ao último commit." ;;
            "Dis_Ask")        echo -ne " [?] Tem certeza absoluta? (s/n): " ;;
            "Dis_Ok")         echo -e "\n [OK] Alterações vaporizadas. Código limpo." ;;

            # --- SYSTEM ---
            "Inst_Warn")      echo -e "\n ⚙️ [!!!] PROTOCOLO DE INJEÇÃO GLOBAL [!!!]" ;;
            "Inst_Err")       echo " [!] ERRO: Terminal não identificou o diretório de origem." ;;
            "Inst_Src")       echo " [+] Diretório de origem detectado: $p1" ;;
            "Inst_Ask")       echo -ne " [?] Comando para chamar o terminal (ex: git-ops). Padrão: git-ops: " ;;
            "Inst_Exist")     echo -e "\n [!] ALERTA: Comando '$p1' já instalado no \$PROFILE_FILE!" ;;
            "Inst_Ok")        echo -e "\n [OK] Comando '$p1' injetado globalmente no \$PROFILE_FILE." ;;
            "Inst_Hint")      echo " [>] Rode 'source \$PROFILE_FILE' ou abra um novo terminal." ;;
            "Lang_Ok")        echo -e "\n [OK] Idioma alterado para Português (PT-BR)." ;;
            "Net_Title")      echo -e "\n 🌍 [ PAINEL DE CONTROLE DE REDE ]" ;;
            "Net_O1")         echo -e "\n [1] Adicionar Novo Remote (GitLab, Keybase)" ;;
            "Net_O2")         echo " [2] Remover Remote" ;;
            "Net_O0")         echo " [0] Voltar ao Menu Principal" ;;
            "Net_Ask")        echo -ne " [?] Escolha uma opção: " ;;
            "Net_Ask1")       echo -ne " [?] Nome da rede (ex: gitlab, keybase): " ;;
            "Net_AskUrl")     echo -ne " [?] URL do repositório: " ;;
            "Net_OkAdd")      echo " [OK] Rede '$p1' conectada." ;;
            "Net_Ask2")       echo -ne " [?] Nome da rede para remover: " ;;
            "Net_OkRem")      echo " [OK] Rede '$p1' removida." ;;
            "Auth_Err")       echo -e "\n [!] Módulo (auth-ops.sh) não encontrado na pasta." ;;
            "Upd_Init")       echo -e "\n 🔄 INICIANDO PROTOCOLO DE ATUALIZAÇÃO..." ;;
            "Upd_Ok")         echo -e " [OK] Terminal atualizado com sucesso. Reinicie a sessão para aplicar as novidades." ;;
            "Upd_Err")        echo -e " [!] Erro ao atualizar. Verifique alterações não salvas ou a sua conexão." ;;
            "Sh_Init")        echo -e "\n 🛡️ INITIATING SHIELD OPS PROTOCOL..." ;;
            "Sh_NoGit")       echo -e " [!] ERROR: Current directory is not a Git repository." ;;
            "Sh_Ok")          echo -e " [OK] Shield installed! Your future commits will be scanned for leaked credentials." ;;
        esac
    else
        case "$key" in
            # --- MENU ---
            "Menu_Header")    echo "                     Chavatte Security | Sentinel Git-OPS v2.3.1                         " ;;
            "Dash_Node")      echo "  📍 Current Node : $p1" ;;
            "Dash_Status")    echo "  📊 Status       : $p1" ;;
            "Dash_Remote")    echo "  🌍 Cloud        : $p1" ;;
            "Menu_Main")      echo "  [ MAIN WORKFLOW ]" ;;
            "Menu_1")         echo "  ⚡ 1. INITIATE : Provision Feature Branch + Push" ;;
            "Menu_2")         echo "  💾 2. COMMIT   : Record Changes (Add + Commit)" ;;
            "Menu_3")         echo "  🚀 3. DEPLOY   : Merge to Main + Push" ;;
            "Menu_4")         echo "  🔥 4. PURGE    : Clean Local Node (Delete Branch)" ;;
            "Menu_5")         echo "  🔀 5. SWITCH   : Change Node (Checkout Branch)" ;;
            "Menu_Tactical")  echo "  [ TACTICAL TOOLS ]" ;;
            "Menu_6")         echo "  📊 6.  STATUS  : Check Integrity (Status & Log)" ;;
            "Menu_7")         echo "  📦 7.  STASH   : Tactical Storage (Guard/Restore)" ;;
            "Menu_8")         echo "  🕵️ 8.  AUDIT   : Inspect Code (Diff)" ;;
            "Menu_9")         echo "  📡 9.  RADAR   : Remote Scan (Fetch + Status)" ;;
            "Menu_10")        echo "  ⏪ 10. REVERT  : Panic Button (Undo Last Commit)" ;;
            "Menu_11")        echo "  💥 11. DISCARD : Reset Unsaved Changes" ;;
            "Menu_System")    echo "  [ SYSTEM & NETWORK ]" ;;
            "Menu_12")        echo "  ⚙️ 12. INSTALL : Inject into ~/.bashrc or ~/.zshrc (Global)" ;;
            "Menu_13")        echo "  🌐 13. LANG    : Switch Language (EN / PT-BR) -> Current: EN" ;;
            "Menu_14")        echo "  🌍 14. NETWORK : Manage Remotes & Multi-Push (GitLab, Keybase)" ;;
            "Menu_15")        echo "  🔐 15. AUTH    : Manage Credentials (GitHub, GitLab, Keybase)" ;;
            "Menu_16")        echo "  🔄 16. UPDATE  : Update Sentinel (Self-Update via Git)" ;;
            "Menu_17")        echo -e "  🛡️  17. SHIELD  : Inject Pre-Commit Hook (Secret Leak Prevention)" ;;
            "Menu_99")        echo "  📖 99. MANUAL  : Command Documentation (Help)" ;;
            "Menu_0")         echo "  🛑 0.  EXIT    : Close Terminal" ;;
            
            # --- GERAL ---
            "Prompt")         echo -ne " [chavatte@sentinel] ❯ " ;;
            "Exit")           echo " 🛑 Closing session..." ;;
            "Invalid")        echo " [!] Command not recognized." ;;
            "NoRemote")       echo -e "\n [!] ALERT: No remote configured! Use option 14 to add a network." ;;
            "Networks")       echo -e "\n 🌍 Detected Networks: $p1" ;;
            
            # --- WORKFLOW ---
            "Init_AskBranch") echo -ne " [?] Enter the new branch name: " ;;
            "Init_Engage")    echo -e "\n ⚡ ENGAGING: Provisioning branch '$p1'..." ;;
            "Init_AskRem")    echo -ne " [?] Enter target remote (e.g. origin, gitlab) or 'ALL' to multi-push. Default: origin: " ;;
            "Uplink")         echo " ⚡ UPLINK: Transmitting to $p1..." ;;
            "Init_Ok")        echo -e "\n [OK] Link established. Terminal cleared for code." ;;
            "Com_Scan")       echo -e "\n 📊 SCANNING MODIFIED FILES:" ;;
            "Com_AskMsg")     echo -ne " [?] Enter commit message (or leave empty to abort): " ;;
            "Com_Cancel")     echo " [!] ALERT: Commit operation canceled." ;;
            "Com_Prep")       echo -e "\n 💾 Preparing packages (git add .)..." ;;
            "Com_Crypt")      echo " 💾 Encrypting record in history (git commit)..." ;;
            "Com_Ok")         echo -e "\n [OK] Changes successfully recorded on current node." ;;
            "Dep_AlrMain")    echo -e "\n [!] ALERT: You are already on the main branch. Operation aborted." ;;
            "Dep_Seq")        echo -e "\n 🚀 INITIATING MERGE SEQUENCE: '$p1' -> 'main'..." ;;
            "Dep_SwMain")     echo " [*] Switching to main..." ;;
            "Dep_Sync")       echo " [*] Synchronizing remote packages (git pull)..." ;;
            "Dep_Merge")      echo " [*] Injecting code from '$p1'..." ;;
            "Dep_AskRem")     echo -ne " [?] Enter target remote for deploy or 'ALL' to multi-push. Default: origin: " ;;
            "Dep_Cloud")      echo " [*] Deploying to cloud..." ;;
            "Dep_Ok")         echo -e "\n [OK] Deploy completed successfully. Code secured in main." ;;
            "Dep_AskPurge")   echo -ne " [?] Execute PURGE protocol on branch '$p1'? (y/n): " ;;
            "Dep_PurgeOk")    echo " [OK] Branch '$p1' eliminated." ;;
            "Purg_AskBranch") echo -ne " [?] Enter the target for the PURGE protocol: " ;;
            "Purg_MainDeny")  echo " [!] ACCESS DENIED: Main branch cannot be deleted." ;;
            "Purg_AskRem")    echo -ne " [?] Delete from which remote? (e.g. origin, ALL). Default: origin: " ;;
            "Purg_Ok")        echo " [OK] Node purge completed." ;;
            "Sw_Avail")       echo -e "\n 🔀 AVAILABLE NODES (Local Branches):" ;;
            "Sw_AskNode")     echo -ne " [?] Enter target node (branch) name: " ;;
            "Sw_Transf")      echo -e "\n 🔀 TRANSFERRING ROUTE TO: '$p1'..." ;;
            "Sw_Status")      echo -e "\n 📊 CURRENT BRANCH STATUS:" ;;

            # --- TACTICAL ---
            "Stat_Title")     echo -e "\n 📊 REPOSITORY STATUS:" ;;
            "Stat_Hist")      echo -e "\n 📊 RECENT HISTORY (Last 5 commits):" ;;
            "Stash_O1")       echo -e "\n [1] Store changes in drawer (Stash Push)" ;;
            "Stash_O2")       echo " [2] Restore last drawer (Stash Pop)" ;;
            "Stash_O3")       echo " [3] View saved drawers (Stash List)" ;;
            "Stash_Ask")      echo -ne " [?] Choose tactical action: " ;;
            "Stash_Save")     echo " [OK] Changes stored." ;;
            "Stash_Rest")     echo " [OK] Changes restored." ;;
            "Cancel")         echo " [!] Action canceled." ;;
            "Aud_O1")         echo -e "\n [1] Inspect unstaged files (git diff)" ;;
            "Aud_O2")         echo " [2] Inspect staged files ready for commit (git diff --staged)" ;;
            "Aud_Ask")        echo -ne " [?] Choose audit type: " ;;
            "Aud_Hint")       echo -e "\n [>] Press 'q' to exit the inspection screen." ;;
            "Rad_Init")       echo -e "\n 📡 INITIATING RADAR SCAN (Fetch)..." ;;
            "Rad_Comp")       echo -e "\n 📡 COMPARING ROUTES (Status)..." ;;
            "Rad_Ok")         echo -e "\n [OK] Scan completed. Your local code was not altered." ;;
            "Rev_Warn")       echo -e "\n ⏪ [!!!] WARNING: PANIC BUTTON TRIGGERED [!!!]" ;;
            "Rev_Desc")       echo " Undoes your LAST commit, keeping files intact for a new commit." ;;
            "Rev_Ask")        echo -ne " [?] Are you sure you want to revert the last commit? (y/n): " ;;
            "Rev_Ok")         echo -e "\n [OK] Last commit undone. Your files are in the 'stage area'." ;;
            "Abort")          echo -e "\n [>] Operation aborted." ;;
            "Dis_Warn")       echo -e "\n 💥 [!!!] DESTRUCTION PROTOCOL [!!!]" ;;
            "Dis_Desc")       echo " DISCARDS ALL unsaved changes. Files return to last committed state." ;;
            "Dis_Ask")        echo -ne " [?] Are you absolutely sure? (y/n): " ;;
            "Dis_Ok")         echo -e "\n [OK] All unsaved changes vaporized. Code is clean." ;;

            # --- SYSTEM ---
            "Inst_Warn")      echo -e "\n ⚙️ [!!!] GLOBAL INJECTION PROTOCOL [!!!]" ;;
            "Inst_Err")       echo " [!] ERROR: Terminal could not identify its own directory." ;;
            "Inst_Src")       echo " [+] Source directory detected: $p1" ;;
            "Inst_Ask")       echo -ne " [?] Enter the command name to call the terminal. Default: git-ops: " ;;
            "Inst_Exist")     echo -e "\n [!] ALERT: The command '$p1' is already installed in your \$PROFILE_FILE!" ;;
            "Inst_Ok")        echo -e "\n [OK] Command '$p1' injected globally in \$PROFILE_FILE." ;;
            "Inst_Hint")      echo " [>] Run 'source \$PROFILE_FILE' or open a new terminal." ;;
            "Lang_Ok")        echo -e "\n [OK] Language switched to English (EN)." ;;
            "Net_Title")      echo -e "\n 🌍 [ NETWORK CONTROL PANEL ]" ;;
            "Net_O1")         echo -e "\n [1] Add New Remote (GitLab, Keybase)" ;;
            "Net_O2")         echo " [2] Remove Existing Remote" ;;
            "Net_O0")         echo " [0] Back to Main Menu" ;;
            "Net_Ask")        echo -ne " [?] Choose an option: " ;;
            "Net_Ask1")       echo -ne " [?] Enter remote name (e.g. gitlab): " ;;
            "Net_AskUrl")     echo -ne " [?] Enter repository URL: " ;;
            "Net_OkAdd")      echo " [OK] Network '$p1' added successfully." ;;
            "Net_Ask2")       echo -ne " [?] Enter remote name to remove: " ;;
            "Net_OkRem")      echo " [OK] Network '$p1' removed." ;;
            "Auth_Err")       echo -e "\n [!] Auth module (auth-ops.sh) not found in the folder." ;;
            "Upd_Init")       echo -e "\n 🔄 INITIATING UPDATE PROTOCOL..." ;;
            "Upd_Ok")         echo -e " [OK] Terminal successfully updated. Restart the session to apply." ;;
            "Upd_Err")        echo -e " [!] Update failed. Check for unsaved local changes or your connection." ;;
            "Sh_Init")        echo -e "\n 🛡️ INITIATING SHIELD OPS PROTOCOL..." ;;
            "Sh_NoGit")       echo -e " [!] ERROR: Current directory is not a Git repository." ;;
            "Sh_Ok")          echo -e " [OK] Shield installed! Your future commits will be scanned for leaked credentials." ;;
        esac
    fi
}

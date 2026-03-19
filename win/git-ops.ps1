$Script:Lang = "en"

function Show-Menu {
    Clear-Host
    Write-Host "`n"
    Write-Host "      _/_/_/  _/_/_/_/  _/      _/  _/_/_/_/_/  _/  _/      _/  _/_/_/_/  _/        " -ForegroundColor Cyan
    Write-Host "   _/        _/        _/_/    _/      _/      _/  _/_/    _/  _/        _/         " -ForegroundColor Cyan
    Write-Host "    _/_/    _/_/_/    _/  _/  _/      _/      _/  _/  _/  _/  _/_/_/    _/          " -ForegroundColor DarkCyan
    Write-Host "       _/  _/        _/    _/_/      _/      _/  _/    _/_/  _/        _/           " -ForegroundColor DarkCyan
    Write-Host "_/_/_/    _/_/_/_/  _/      _/      _/      _/  _/      _/  _/_/_/_/  _/_/_/_/_/    " -ForegroundColor DarkBlue
    Write-Host "                                                                                    "
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor DarkGray
    Write-Host "                     Chavatte Security | Sentinel Git-OPS                         " -ForegroundColor Magenta
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor DarkGray
    
    if ($Script:Lang -eq "en") {
        Write-Host "  [ MAIN WORKFLOW ]" -ForegroundColor White
        Write-Host "  ⚡ 1. INITIATE : Provision Feature Branch + Push" -ForegroundColor Yellow
        Write-Host "  💾 2. COMMIT   : Record Changes (Add + Commit)" -ForegroundColor Yellow
        Write-Host "  🚀 3. DEPLOY   : Merge to Main + Push" -ForegroundColor Yellow
        Write-Host "  🔥 4. PURGE    : Clean Local Node (Delete Branch)" -ForegroundColor Yellow
        Write-Host "  🔀 5. SWITCH   : Change Node (Checkout Branch)" -ForegroundColor Cyan
        Write-Host " "
        Write-Host "  [ TACTICAL TOOLS ]" -ForegroundColor White
        Write-Host "  📊 6.  STATUS  : Check Integrity (Status & Log)" -ForegroundColor Cyan
        Write-Host "  📦 7.  STASH   : Tactical Storage (Guard/Restore)" -ForegroundColor Cyan
        Write-Host "  🕵️ 8.  AUDIT   : Inspect Code (Diff)" -ForegroundColor DarkYellow
        Write-Host "  📡 9.  RADAR   : Remote Scan (Fetch + Status)" -ForegroundColor DarkYellow
        Write-Host "  ⏪ 10. REVERT  : Panic Button (Undo Last Commit)" -ForegroundColor Red
        Write-Host "  💥 11. DISCARD : Reset Unsaved Changes" -ForegroundColor Red
        Write-Host " "
        Write-Host "  [ SYSTEM ]" -ForegroundColor White
        Write-Host "  ⚙️ 12. INSTALL : Inject Terminal into `$PROFILE (Global)" -ForegroundColor Green
        Write-Host "  🌐 13. LANG    : Switch Language (EN / PT-BR) -> Current: EN" -ForegroundColor Green
        Write-Host "  📖 99. MANUAL  : Command Documentation (Help)" -ForegroundColor Magenta
        Write-Host "  🛑 0.  EXIT    : Close Terminal" -ForegroundColor DarkGray
    } else {
        Write-Host "  [ WORKFLOW PRINCIPAL ]" -ForegroundColor White
        Write-Host "  ⚡ 1. INITIATE : Provisionar Feature Branch + Push" -ForegroundColor Yellow
        Write-Host "  💾 2. COMMIT   : Registrar Alterações (Add + Commit)" -ForegroundColor Yellow
        Write-Host "  🚀 3. DEPLOY   : Realizar Merge na Main + Push" -ForegroundColor Yellow
        Write-Host "  🔥 4. PURGE    : Limpar Node Local (Excluir Branch)" -ForegroundColor Yellow
        Write-Host "  🔀 5. SWITCH   : Mudar de Node (Trocar de Branch)" -ForegroundColor Cyan
        Write-Host " "
        Write-Host "  [ FERRAMENTAS TÁTICAS ]" -ForegroundColor White
        Write-Host "  📊 6.  STATUS  : Verificar Integridade (Status & Log)" -ForegroundColor Cyan
        Write-Host "  📦 7.  STASH   : Armazenamento Tático (Guardar/Restaurar)" -ForegroundColor Cyan
        Write-Host "  🕵️ 8.  AUDIT   : Inspecionar Código (Diff)" -ForegroundColor DarkYellow
        Write-Host "  📡 9.  RADAR   : Varredura Remota (Fetch + Status)" -ForegroundColor DarkYellow
        Write-Host "  ⏪ 10. REVERT  : Botão de Pânico (Desfazer Último Commit)" -ForegroundColor Red
        Write-Host "  💥 11. DISCARD : Resetar Alterações Não Salvas" -ForegroundColor Red
        Write-Host " "
        Write-Host "  [ SISTEMA ]" -ForegroundColor White
        Write-Host "  ⚙️ 12. INSTALL : Injetar Terminal no `$PROFILE (Global)" -ForegroundColor Green
        Write-Host "  🌐 13. LANG    : Alternar Idioma (EN / PT-BR) -> Atual: PT-BR" -ForegroundColor Green
        Write-Host "  📖 99. MANUAL  : Documentação de Comandos (Help)" -ForegroundColor Magenta
        Write-Host "  🛑 0.  EXIT    : Encerrar Terminal" -ForegroundColor DarkGray
    }
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor DarkGray
}

do {
    Show-Menu
    
    $promptMsg = if ($Script:Lang -eq "en") { " [chavatte@sentinel] ❯" } else { " [chavatte@sentinel] ❯" }
    $choice = Read-Host "`n$promptMsg"

    switch ($choice) {
        '1' {
            $msg1 = if ($Script:Lang -eq "en") { " [?] Enter the new branch name" } else { " [?] Insira o nome da nova branch" }
            $branchName = Read-Host $msg1
            if ([string]::IsNullOrWhiteSpace($branchName)) { break }
            
            if ($Script:Lang -eq "en") {
                Write-Host "`n ⚡ ENGAGING: Provisioning branch '$branchName'..." -ForegroundColor Cyan
                git switch -c $branchName
                Write-Host " ⚡ UPLINK: Establishing connection to remote repo..." -ForegroundColor Cyan
                git push -u origin $branchName
                Write-Host "`n [OK] Link established. Terminal cleared for code." -ForegroundColor Green
            } else {
                Write-Host "`n ⚡ ENGAGING: Provisionando branch '$branchName'..." -ForegroundColor Cyan
                git switch -c $branchName
                Write-Host " ⚡ UPLINK: Estabelecendo conexão com o repositório remoto..." -ForegroundColor Cyan
                git push -u origin $branchName
                Write-Host "`n [OK] Link estabelecido. Terminal liberado para código." -ForegroundColor Green
            }
            Pause
        }
        '2' {
            if ($Script:Lang -eq "en") { Write-Host "`n 📊 SCANNING MODIFIED FILES:" -ForegroundColor Cyan } else { Write-Host "`n 📊 ESCANEANDO ARQUIVOS MODIFICADOS:" -ForegroundColor Cyan }
            git status -s
            Write-Host ""
            
            $msg2 = if ($Script:Lang -eq "en") { " [?] Enter commit message (or leave empty to abort)" } else { " [?] Insira a mensagem do commit (ou deixe vazio para abortar)" }
            $commitMsg = Read-Host $msg2
            
            if ([string]::IsNullOrWhiteSpace($commitMsg)) {
                if ($Script:Lang -eq "en") { Write-Host " [!] ALERT: Commit operation canceled." -ForegroundColor Yellow } else { Write-Host " [!] ALERTA: Operação de commit cancelada." -ForegroundColor Yellow }
                Pause
                break
            }

            if ($Script:Lang -eq "en") {
                Write-Host "`n 💾 Preparing packages (git add .)..." -ForegroundColor DarkGray
                git add .
                Write-Host " 💾 Encrypting record in history (git commit)..." -ForegroundColor DarkGray
                git commit -m $commitMsg
                Write-Host "`n [OK] Changes successfully recorded on current node." -ForegroundColor Green
            } else {
                Write-Host "`n 💾 Preparando pacotes (git add .)..." -ForegroundColor DarkGray
                git add .
                Write-Host " 💾 Criptografando registro no histórico (git commit)..." -ForegroundColor DarkGray
                git commit -m $commitMsg
                Write-Host "`n [OK] Alterações registradas com sucesso no node atual." -ForegroundColor Green
            }
            Pause
        }
        '3' {
            $currentBranch = git branch --show-current
            if ($currentBranch -eq 'main') {
                if ($Script:Lang -eq "en") { Write-Host "`n [!] ALERT: You are already on the main branch. Operation aborted." -ForegroundColor Red } else { Write-Host "`n [!] ALERTA: Você já está na branch main. Operação abortada." -ForegroundColor Red }
                Pause
                break
            }

            if ($Script:Lang -eq "en") {
                Write-Host "`n 🚀 INITIATING MERGE SEQUENCE: '$currentBranch' -> 'main'..." -ForegroundColor Yellow
                Write-Host " [*] Switching to main..." -ForegroundColor DarkGray
                git switch main
                Write-Host " [*] Synchronizing remote packages (git pull)..." -ForegroundColor DarkGray
                git pull origin main
                Write-Host " [*] Injecting code from '$currentBranch'..." -ForegroundColor DarkGray
                git merge $currentBranch
                Write-Host " [*] Deploying to cloud..." -ForegroundColor DarkGray
                git push origin main
                Write-Host "`n [OK] Deploy completed successfully. Code secured in main." -ForegroundColor Green
                $msgDel = " [?] Execute PURGE protocol on branch '$currentBranch'? (y/n)"
            } else {
                Write-Host "`n 🚀 INICIANDO SEQUÊNCIA DE MERGE: '$currentBranch' -> 'main'..." -ForegroundColor Yellow
                Write-Host " [*] Alterando para main..." -ForegroundColor DarkGray
                git switch main
                Write-Host " [*] Sincronizando pacotes remotos (git pull)..." -ForegroundColor DarkGray
                git pull origin main
                Write-Host " [*] Injetando código da '$currentBranch'..." -ForegroundColor DarkGray
                git merge $currentBranch
                Write-Host " [*] Realizando deploy para a nuvem..." -ForegroundColor DarkGray
                git push origin main
                Write-Host "`n [OK] Deploy concluído com sucesso. Código seguro na main." -ForegroundColor Green
                $msgDel = " [?] Executar protocolo PURGE na branch '$currentBranch'? (s/n)"
            }
            
            $delete = Read-Host $msgDel
            if ($delete -match '^[ys]$') {
                git branch -d $currentBranch
                git push origin --delete $currentBranch
                if ($Script:Lang -eq "en") { Write-Host " [OK] Branch '$currentBranch' eliminated." -ForegroundColor Green } else { Write-Host " [OK] Branch '$currentBranch' eliminada." -ForegroundColor Green }
            }
            Pause
        }
        '4' {
            git branch
            $msgPurge = if ($Script:Lang -eq "en") { "`n [?] Enter the target for the PURGE protocol" } else { "`n [?] Insira o alvo para o protocolo PURGE" }
            $branchToDelete = Read-Host $msgPurge
            
            if ($branchToDelete -eq 'main') {
                if ($Script:Lang -eq "en") { Write-Host " [!] ACCESS DENIED: Main branch cannot be deleted." -ForegroundColor Red } else { Write-Host " [!] ACESSO NEGADO: A branch main não pode ser excluída." -ForegroundColor Red }
            } elseif (![string]::IsNullOrWhiteSpace($branchToDelete)) {
                git branch -d $branchToDelete
                git push origin --delete $branchToDelete
                if ($Script:Lang -eq "en") { Write-Host " [OK] Node purge completed." -ForegroundColor Green } else { Write-Host " [OK] Limpeza de node concluída." -ForegroundColor Green }
            }
            Pause
        }
        '5' {
            if ($Script:Lang -eq "en") { Write-Host "`n 🔀 AVAILABLE NODES (Local Branches):" -ForegroundColor Cyan } else { Write-Host "`n 🔀 NODES DISPONÍVEIS (Branches Locais):" -ForegroundColor Cyan }
            git branch
            
            $msgNode = if ($Script:Lang -eq "en") { "`n [?] Enter target node (branch) name" } else { "`n [?] Insira o nome do node (branch) de destino" }
            $targetBranch = Read-Host $msgNode
            
            if (![string]::IsNullOrWhiteSpace($targetBranch)) {
                if ($Script:Lang -eq "en") {
                    Write-Host "`n 🔀 TRANSFERRING ROUTE TO: '$targetBranch'..." -ForegroundColor Yellow
                    git switch $targetBranch
                    Write-Host "`n 📊 CURRENT BRANCH STATUS:" -ForegroundColor Cyan
                } else {
                    Write-Host "`n 🔀 TRANSFERINDO ROTA PARA: '$targetBranch'..." -ForegroundColor Yellow
                    git switch $targetBranch
                    Write-Host "`n 📊 STATUS DA BRANCH ATUAL:" -ForegroundColor Cyan
                }
                git status -s
            }
            Pause
        }
        '6' {
            if ($Script:Lang -eq "en") {
                Write-Host "`n 📊 REPOSITORY STATUS:" -ForegroundColor Cyan
                git status -s
                Write-Host "`n 📊 RECENT HISTORY (Last 5 commits):" -ForegroundColor Cyan
            } else {
                Write-Host "`n 📊 STATUS DO REPOSITÓRIO:" -ForegroundColor Cyan
                git status -s
                Write-Host "`n 📊 HISTÓRICO RECENTE (Últimos 5 commits):" -ForegroundColor Cyan
            }
            git log --oneline --graph -n 5
            Write-Host " "
            Pause
        }
        '7' {
            if ($Script:Lang -eq "en") {
                Write-Host "`n [1] Store changes in drawer (Stash Push)" -ForegroundColor Yellow
                Write-Host " [2] Restore last drawer (Stash Pop)" -ForegroundColor Yellow
                Write-Host " [3] View saved drawers (Stash List)" -ForegroundColor Yellow
                $stashChoice = Read-Host " [?] Choose tactical action"
                switch ($stashChoice) {
                    '1' { git stash; Write-Host " [OK] Changes stored." -ForegroundColor Green }
                    '2' { git stash pop; Write-Host " [OK] Changes restored." -ForegroundColor Green }
                    '3' { git stash list }
                    default { Write-Host " [!] Action canceled." -ForegroundColor Red }
                }
            } else {
                Write-Host "`n [1] Guardar alterações na gaveta (Stash Push)" -ForegroundColor Yellow
                Write-Host " [2] Restaurar última gaveta (Stash Pop)" -ForegroundColor Yellow
                Write-Host " [3] Ver gavetas salvas (Stash List)" -ForegroundColor Yellow
                $stashChoice = Read-Host " [?] Escolha a ação tática"
                switch ($stashChoice) {
                    '1' { git stash; Write-Host " [OK] Alterações guardadas." -ForegroundColor Green }
                    '2' { git stash pop; Write-Host " [OK] Alterações restauradas." -ForegroundColor Green }
                    '3' { git stash list }
                    default { Write-Host " [!] Ação cancelada." -ForegroundColor Red }
                }
            }
            Pause
        }
        '8' {
            if ($Script:Lang -eq "en") {
                Write-Host "`n [1] Inspect unstaged files (git diff)" -ForegroundColor Yellow
                Write-Host " [2] Inspect staged files ready for commit (git diff --staged)" -ForegroundColor Yellow
                $diffChoice = Read-Host " [?] Choose audit type"
                Write-Host "`n [>] Press 'q' to exit the inspection screen after reading." -ForegroundColor Magenta
            } else {
                Write-Host "`n [1] Inspecionar arquivos não preparados (git diff)" -ForegroundColor Yellow
                Write-Host " [2] Inspecionar arquivos prontos para commit (git diff --staged)" -ForegroundColor Yellow
                $diffChoice = Read-Host " [?] Escolha o tipo de auditoria"
                Write-Host "`n [>] Pressione 'q' para sair da tela de inspeção após ler." -ForegroundColor Magenta
            }
            Start-Sleep -Seconds 2
            if ($diffChoice -eq '1') { git diff }
            elseif ($diffChoice -eq '2') { git diff --staged }
            else { 
                if ($Script:Lang -eq "en") { Write-Host " [!] Action canceled." -ForegroundColor Red } else { Write-Host " [!] Ação cancelada." -ForegroundColor Red }
            }
            Pause
        }
        '9' {
            if ($Script:Lang -eq "en") {
                Write-Host "`n 📡 INITIATING RADAR SCAN (Fetch)..." -ForegroundColor Cyan
                git fetch --all
                Write-Host "`n 📡 COMPARING ROUTES (Status)..." -ForegroundColor Cyan
                git status
                Write-Host "`n [OK] Scan completed. Your local code was not altered." -ForegroundColor Green
            } else {
                Write-Host "`n 📡 INICIANDO VARREDURA DE RADAR (Fetch)..." -ForegroundColor Cyan
                git fetch --all
                Write-Host "`n 📡 COMPARANDO ROTAS (Status)..." -ForegroundColor Cyan
                git status
                Write-Host "`n [OK] Varredura concluída. Seu código local não foi alterado." -ForegroundColor Green
            }
            Pause
        }
        '10' {
            if ($Script:Lang -eq "en") {
                Write-Host "`n ⏪ [!!!] WARNING: PANIC BUTTON TRIGGERED [!!!]" -ForegroundColor Red
                Write-Host " This will undo your LAST commit, but keep your files intact and ready for a new commit." -ForegroundColor Yellow
                $confirmRevert = Read-Host " [?] Are you sure you want to revert the last commit? (y/n)"
                if ($confirmRevert -match '^[ys]$') {
                    git reset --soft HEAD~1
                    Write-Host "`n [OK] Last commit undone. Your files are in the 'stage area' awaiting review." -ForegroundColor Green
                    git status -s
                } else {
                    Write-Host "`n [>] Operation aborted." -ForegroundColor Green
                }
            } else {
                Write-Host "`n ⏪ [!!!] ATENÇÃO: BOTÃO DE PÂNICO ACIONADO [!!!]" -ForegroundColor Red
                Write-Host " Isso vai desfazer o seu ÚLTIMO commit, mas manterá seus arquivos intactos e prontos para um novo commit." -ForegroundColor Yellow
                $confirmRevert = Read-Host " [?] Tem certeza que deseja reverter o último commit? (s/n)"
                if ($confirmRevert -match '^[ys]$') {
                    git reset --soft HEAD~1
                    Write-Host "`n [OK] Último commit desfeito. Seus arquivos estão na 'stage area' aguardando revisão." -ForegroundColor Green
                    git status -s
                } else {
                    Write-Host "`n [>] Operação abortada." -ForegroundColor Green
                }
            }
            Pause
        }
        '11' {
            if ($Script:Lang -eq "en") {
                Write-Host "`n 💥 [!!!] DESTRUCTION PROTOCOL [!!!]" -ForegroundColor Red
                Write-Host " This will DISCARD ALL unsaved changes. Files will return to their last committed state." -ForegroundColor Yellow
                $confirmRestore = Read-Host " [?] Are you absolutely sure? This action CANNOT be undone! (y/n)"
                if ($confirmRestore -match '^[ys]$') {
                    git restore .
                    Write-Host "`n [OK] All unsaved changes vaporized. Code is clean." -ForegroundColor Green
                } else {
                    Write-Host "`n [>] Operation aborted." -ForegroundColor Green
                }
            } else {
                Write-Host "`n 💥 [!!!] PROTOCOLO DE DESTRUIÇÃO [!!!]" -ForegroundColor Red
                Write-Host " Isso vai DESCARTAR TODAS as alterações não salvas. Os arquivos voltarão ao estado do último commit." -ForegroundColor Yellow
                $confirmRestore = Read-Host " [?] Tem certeza absoluta? Essa ação NÃO PODE ser desfeita! (s/n)"
                if ($confirmRestore -match '^[ys]$') {
                    git restore .
                    Write-Host "`n [OK] Todas as alterações não salvas foram vaporizadas. Código limpo." -ForegroundColor Green
                } else {
                    Write-Host "`n [>] Operação abortada." -ForegroundColor Green
                }
            }
            Pause
        }
        '12' {
            if ($Script:Lang -eq "en") {
                Write-Host "`n ⚙️ [!!!] GLOBAL INJECTION PROTOCOL [!!!]" -ForegroundColor Yellow
            } else {
                Write-Host "`n ⚙️ [!!!] PROTOCOLO DE INJEÇÃO GLOBAL [!!!]" -ForegroundColor Yellow
            }
            
            $currentScriptPath = $PSCommandPath
            
            if ([string]::IsNullOrEmpty($currentScriptPath)) {
                if ($Script:Lang -eq "en") {
                    Write-Host " [!] ERROR: Terminal could not identify its own directory." -ForegroundColor Red
                    Write-Host "     Hint: Run the script calling its direct path (e.g., .\git-flow.ps1) to install." -ForegroundColor Magenta
                } else {
                    Write-Host " [!] ERRO: O terminal não conseguiu identificar o próprio diretório." -ForegroundColor Red
                    Write-Host "     Dica: Rode o script chamando pelo caminho direto (ex: .\git-flow.ps1) para instalar." -ForegroundColor Magenta
                }
            } else {
                if ($Script:Lang -eq "en") { Write-Host " [+] Source directory detected: $currentScriptPath" -ForegroundColor DarkGray } else { Write-Host " [+] Diretório de origem detectado: $currentScriptPath" -ForegroundColor DarkGray }
                
                $execPolicy = Get-ExecutionPolicy -Scope CurrentUser
                if ($execPolicy -eq 'Restricted' -or $execPolicy -eq 'Undefined') {
                    if ($Script:Lang -eq "en") { Write-Host " [*] Adjusting execution policy to allow local scripts..." -ForegroundColor DarkGray } else { Write-Host " [*] Ajustando política de execução para permitir scripts locais..." -ForegroundColor DarkGray }
                    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
                }

                $msgAlias = if ($Script:Lang -eq "en") { " [?] Enter the command name to call the terminal (e.g., git-flow, sentinel, vxr). Default: git-flow" } else { " [?] Digite o comando que deseja usar para chamar o terminal (ex: git-flow, sentinel, vxr). Padrão: git-flow" }
                $funcName = Read-Host $msgAlias
                if ([string]::IsNullOrWhiteSpace($funcName)) { $funcName = "git-flow" }
                
                $profileContext = "function $funcName { & `"$currentScriptPath`" }"
                
                if (!(Test-Path -Path $PROFILE)) {
                    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
                }
                
                $profileContent = Get-Content $PROFILE -Raw -ErrorAction SilentlyContinue
                if ($profileContent -match "function $funcName ") {
                    if ($Script:Lang -eq "en") { Write-Host "`n [!] ALERT: The command '$funcName' is already installed in your `$PROFILE!" -ForegroundColor Yellow } else { Write-Host "`n [!] ALERTA: O comando '$funcName' já está instalado no seu `$PROFILE!" -ForegroundColor Yellow }
                } else {
                    Add-Content -Path $PROFILE -Value "`n# Vexor DevSec Terminal`n$profileContext"
                    if ($Script:Lang -eq "en") {
                        Write-Host "`n [OK] Success! Command '$funcName' injected globally." -ForegroundColor Green
                        Write-Host " [>] Installation completed with correct policies applied." -ForegroundColor Cyan
                        Write-Host " [>] Run '. `$PROFILE' in your terminal or open a new window to use it." -ForegroundColor Cyan
                    } else {
                        Write-Host "`n [OK] Sucesso! O comando '$funcName' foi injetado globalmente." -ForegroundColor Green
                        Write-Host " [>] A instalação foi concluída com as políticas corretas configuradas." -ForegroundColor Cyan
                        Write-Host " [>] Rode '. `$PROFILE' no seu terminal ou abra uma nova janela para usar." -ForegroundColor Cyan
                    }
                }
            }
            Pause
        }
        '13' {
            if ($Script:Lang -eq "en") { 
                $Script:Lang = "pt"
                Write-Host "`n [OK] Idioma alterado para Português (PT-BR)." -ForegroundColor Green
            } else { 
                $Script:Lang = "en" 
                Write-Host "`n [OK] Language switched to English (EN)." -ForegroundColor Green
            }
            Start-Sleep -Seconds 1
        }
        '99' {
            Clear-Host
            if ($Script:Lang -eq "en") {
                Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor Magenta
                Write-Host "                  OPERATIONS MANUAL SENTINEL GIT-OPS                         " -ForegroundColor Magenta
                Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor Magenta
                Write-Host "`n [ NODE AND BRANCH MANAGEMENT ]" -ForegroundColor DarkGray
                Write-Host "  🔀 git branch                 : Lists all available local branches." -ForegroundColor Cyan
                Write-Host "  🔀 git switch <branch>        : Transfers workspace to the specified branch." -ForegroundColor Cyan
                Write-Host "  ⚡ git switch -c <branch>     : Creates a new branch and transfers context immediately." -ForegroundColor Cyan
                Write-Host "  🔥 git branch -d <branch>     : Deletes a branch locally." -ForegroundColor Cyan
                Write-Host "  🔥 git push origin --delete   : Permanently removes a branch from the server (GitHub)." -ForegroundColor Cyan
                Write-Host "`n [ DEPLOYMENT WORKFLOW ]" -ForegroundColor DarkGray
                Write-Host "  💾 git add .                  : Moves folder changes to the 'staging area'." -ForegroundColor Cyan
                Write-Host "  💾 git commit -m `"msg`"        : Encrypts/saves staged changes in local history." -ForegroundColor Cyan
                Write-Host "  ⚡ git push -u origin <br>    : Pushes branch to remote for the 1st time, linking them (-u)." -ForegroundColor Cyan
                Write-Host "  🚀 git pull origin main       : Syncs code by downloading updates from remote main." -ForegroundColor Cyan
                Write-Host "  🚀 git merge <branch>         : Merges (injects) target branch code into current branch." -ForegroundColor Cyan
                Write-Host "`n [ AUDIT AND SECURITY ]" -ForegroundColor DarkGray
                Write-Host "  📊 git status -s              : Displays short state of files (modified, new, etc)." -ForegroundColor Cyan
                Write-Host "  📊 git log --oneline --graph  : Shows the chronological tree of recent commits." -ForegroundColor Cyan
                Write-Host "  🕵️ git diff                   : Audits modified lines of code before staging." -ForegroundColor Cyan
                Write-Host "  📡 git fetch --all            : Updates remote repository metadata without altering files." -ForegroundColor Cyan
                Write-Host "`n [ RECOVERY AND TACTICAL MANEUVERS ]" -ForegroundColor DarkGray
                Write-Host "  📦 git stash                  : Saves loose code in a temporary drawer, clearing the screen." -ForegroundColor Cyan
                Write-Host "  📦 git stash pop              : Restores saved changes from the last drawer." -ForegroundColor Cyan
                Write-Host "  ⏪ git reset --soft HEAD~1    : Panic Button. Undoes last commit preserving code." -ForegroundColor Cyan
                Write-Host "  💥 git restore .              : Destruction Protocol. Discards unsaved changes." -ForegroundColor Cyan
            } else {
                Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor Magenta
                Write-Host "                  MANUAL DE OPERAÇÕES SENTINEL GIT-OPS                          " -ForegroundColor Magenta
                Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor Magenta
                Write-Host "`n [ GESTÃO DE NODES E BRANCHES ]" -ForegroundColor DarkGray
                Write-Host "  🔀 git branch                 : Lista todas as branches locais disponíveis." -ForegroundColor Cyan
                Write-Host "  🔀 git switch <branch>        : Transfere a área de trabalho para a branch especificada." -ForegroundColor Cyan
                Write-Host "  ⚡ git switch -c <branch>     : Cria uma nova branch e transfere o contexto imediatamente." -ForegroundColor Cyan
                Write-Host "  🔥 git branch -d <branch>     : Exclui uma branch localmente." -ForegroundColor Cyan
                Write-Host "  🔥 git push origin --delete   : Remove uma branch permanentemente do servidor (GitHub)." -ForegroundColor Cyan
                Write-Host "`n [ WORKFLOW DE DEPLOY ]" -ForegroundColor DarkGray
                Write-Host "  💾 git add .                  : Move as alterações da pasta para a 'staging area' (preparação)." -ForegroundColor Cyan
                Write-Host "  💾 git commit -m `"msg`"        : Criptografa/salva as alterações preparadas no histórico local." -ForegroundColor Cyan
                Write-Host "  ⚡ git push -u origin <br>    : Faz o 1º envio da branch ao remoto, criando o vínculo (-u)." -ForegroundColor Cyan
                Write-Host "  🚀 git pull origin main       : Sincroniza o código baixando as novidades da main remota." -ForegroundColor Cyan
                Write-Host "  🚀 git merge <branch>         : Funde (injeta) o código da branch alvo dentro da branch atual." -ForegroundColor Cyan
                Write-Host "`n [ AUDITORIA E SEGURANÇA ]" -ForegroundColor DarkGray
                Write-Host "  📊 git status -s              : Exibe o estado resumido dos arquivos (modificados, novos, etc)." -ForegroundColor Cyan
                Write-Host "  📊 git log --oneline --graph  : Mostra a árvore cronológica dos últimos commits." -ForegroundColor Cyan
                Write-Host "  🕵️ git diff                   : Audita as linhas de código modificadas antes da preparação." -ForegroundColor Cyan
                Write-Host "  📡 git fetch --all            : Atualiza metadados do repositório remoto sem alterar arquivos." -ForegroundColor Cyan
                Write-Host "`n [ RECUPERAÇÃO E MANOBRAS TÁTICAS ]" -ForegroundColor DarkGray
                Write-Host "  📦 git stash                  : Salva código solto em uma gaveta temporária, limpando a tela." -ForegroundColor Cyan
                Write-Host "  📦 git stash pop              : Restaura as alterações salvas na última gaveta." -ForegroundColor Cyan
                Write-Host "  ⏪ git reset --soft HEAD~1    : Botão de Pânico. Desfaz o último commit preservando o código." -ForegroundColor Cyan
                Write-Host "  💥 git restore .              : Protocolo de Destruição. Descarta alterações não salvas." -ForegroundColor Cyan
            }
            Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor Magenta
            Pause
        }
        '0' {
            if ($Script:Lang -eq "en") { Write-Host " 🛑 Closing session..." -ForegroundColor DarkGray } else { Write-Host " 🛑 Encerrando sessão..." -ForegroundColor DarkGray }
        }
        default {
            if ($Script:Lang -eq "en") { Write-Host " [!] Command not recognized." -ForegroundColor Red } else { Write-Host " [!] Comando não reconhecido." -ForegroundColor Red }
            Start-Sleep -Seconds 1
        }
    }
} until ($choice -eq '0')
# ==============================================================================
# Chavatte Security | Sentinel Git-OPS v2.3.1 (Core Router)
# ==============================================================================

$corePath = Join-Path -Path $PSScriptRoot -ChildPath "core"
. (Join-Path -Path $corePath -ChildPath "i18n.ps1")
. (Join-Path -Path $corePath -ChildPath "actions.ps1")

Set-Language "pt"

function Show-Menu {
    Clear-Host
    
    $currentNode = "N/A (Not a Git Repository)"
    $currentStatus = "N/A"
    $currentRemotes = "N/A"
    $isGitRepo = git rev-parse --is-inside-work-tree 2>$null
    
    if ($isGitRepo -eq 'true') {
        $currentNode = git branch --show-current
        if ([string]::IsNullOrEmpty($currentNode)) { $currentNode = "Detached HEAD" }
        
        $modFiles = (git status -s | Measure-Object).Count
        if ($modFiles -eq 0) {
            $currentStatus = "Limpo / Clean"
        }
        else {
            $currentStatus = "$modFiles arquivos modificados / modified files"
        }
        
        $rems = git remote
        if ($rems) { $currentRemotes = $rems -join ', ' } else { $currentRemotes = "Nenhum / None" }
    }

    Write-Host "`n"
    Write-Host "      _/_/_/  _/_/_/_/  _/      _/  _/_/_/_/_/  _/  _/      _/  _/_/_/_/  _/        " -ForegroundColor Cyan
    Write-Host "   _/        _/        _/_/    _/      _/      _/  _/_/    _/  _/        _/         " -ForegroundColor Cyan
    Write-Host "    _/_/    _/_/_/    _/  _/  _/      _/      _/  _/  _/  _/  _/_/_/    _/          " -ForegroundColor DarkCyan
    Write-Host "       _/  _/        _/    _/_/      _/      _/  _/    _/_/  _/        _/           " -ForegroundColor DarkCyan
    Write-Host "_/_/_/    _/_/_/_/  _/      _/      _/      _/  _/      _/  _/_/_/_/  _/_/_/_/_/    " -ForegroundColor DarkBlue
    Write-Host "                                                                                    "
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor DarkGray
    Write-Host (Get-Msg "Menu_Header") -ForegroundColor Magenta
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor DarkGray
    Write-Host (Get-Msg "Dash_Node" -P1 $currentNode) -ForegroundColor Green
    Write-Host (Get-Msg "Dash_Status" -P1 $currentStatus) -ForegroundColor Yellow
    Write-Host (Get-Msg "Dash_Remote" -P1 $currentRemotes) -ForegroundColor Cyan
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor DarkGray
    
    Write-Host (Get-Msg "Menu_Main") -ForegroundColor White
    Write-Host (Get-Msg "Menu_1") -ForegroundColor Yellow
    Write-Host (Get-Msg "Menu_2") -ForegroundColor Yellow
    Write-Host (Get-Msg "Menu_3") -ForegroundColor Yellow
    Write-Host (Get-Msg "Menu_4") -ForegroundColor Yellow
    Write-Host (Get-Msg "Menu_5") -ForegroundColor Cyan
    Write-Host " "
    Write-Host (Get-Msg "Menu_Tactical") -ForegroundColor White
    Write-Host (Get-Msg "Menu_6") -ForegroundColor Cyan
    Write-Host (Get-Msg "Menu_7") -ForegroundColor Cyan
    Write-Host (Get-Msg "Menu_8") -ForegroundColor DarkYellow
    Write-Host (Get-Msg "Menu_9") -ForegroundColor DarkYellow
    Write-Host (Get-Msg "Menu_10") -ForegroundColor Red
    Write-Host (Get-Msg "Menu_11") -ForegroundColor Red
    Write-Host " "
    Write-Host (Get-Msg "Menu_System") -ForegroundColor White
    Write-Host (Get-Msg "Menu_12") -ForegroundColor Green
    Write-Host (Get-Msg "Menu_13") -ForegroundColor Green
    Write-Host (Get-Msg "Menu_14") -ForegroundColor Green
    Write-Host (Get-Msg "Menu_15") -ForegroundColor Green
    Write-Host (Get-Msg "Menu_16") -ForegroundColor Yellow
    Write-Host (Get-Msg "Menu_17") -ForegroundColor Cyan
    Write-Host (Get-Msg "Menu_99") -ForegroundColor Magenta
    Write-Host (Get-Msg "Menu_0") -ForegroundColor DarkGray
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor DarkGray
}
function Show-Manual {
    Clear-Host
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor Magenta
    if ($global:GitOpsLang -eq "en") {
        Write-Host "                  OPERATIONS MANUAL SENTINEL GIT-OPS                         " -ForegroundColor Magenta
        Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor Magenta
        Write-Host "`n [ NETWORK & MULTI-PUSH ]" -ForegroundColor DarkGray
        Write-Host "  🌍 TYPE 'ALL'                 : During push/deploy, sends code to ALL configured remotes." -ForegroundColor Cyan
        Write-Host "  🌍 git remote add <name> <url>: Links a new remote repository (GitLab, Keybase)." -ForegroundColor Cyan
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
    }
    else {
        Write-Host "                  MANUAL DE OPERAÇÕES SENTINEL GIT-OPS                          " -ForegroundColor Magenta
        Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor Magenta
        Write-Host "`n [ REDE E MULTI-PUSH ]" -ForegroundColor DarkGray
        Write-Host "  🌍 DIGITAR 'ALL'              : Durante o push/deploy, envia o código para TODAS as redes." -ForegroundColor Cyan
        Write-Host "  🌍 git remote add <nome> <url>: Conecta a um novo repositório (GitLab, Keybase)." -ForegroundColor Cyan
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

do {
    Show-Menu
    $choice = Read-Host "`n$(Get-Msg 'Prompt')"

    switch ($choice) {
        '1' { Invoke-Initiate }
        '2' { Invoke-Commit }
        '3' { Invoke-Deploy }
        '4' { Invoke-Purge }
        '5' { Invoke-Switch }
        '6' { Invoke-Status }
        '7' { Invoke-Stash }
        '8' { Invoke-Audit }
        '9' { Invoke-Radar }
        '10' { Invoke-Revert }
        '11' { Invoke-Discard }
        '12' { Invoke-Install }
        '13' { 
            if ($global:GitOpsLang -eq "en") { Set-Language "pt" } else { Set-Language "en" }
            Write-Host (Get-Msg "Lang_Ok") -ForegroundColor Green
            Start-Sleep -Seconds 1
        }
        '14' { Invoke-Network }
        '15' { 
            $authScript = Join-Path -Path $corePath -ChildPath "auth-ops.ps1"
            if (Test-Path $authScript) {
                & $authScript -PassedLang $global:GitOpsLang
            }
            else {
                Write-Host (Get-Msg "Auth_Err") -ForegroundColor Red
                Pause
            }
        }
        '16' { Invoke-Update }
        '17' { Invoke-Shield }
        '99' { Show-Manual }
        '0' { Write-Host (Get-Msg "Exit") -ForegroundColor DarkGray }
        default { Write-Host (Get-Msg "Invalid") -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }
} until ($choice -eq '0')
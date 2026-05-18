# ==============================================================================
# CHAVATTE SECURITY | ACTIONS MODULE (Git Operations)
# ==============================================================================

function Invoke-Initiate {
    $branchName = Read-Host (Get-Msg "Init_AskBranch")
    if ([string]::IsNullOrWhiteSpace($branchName)) { return }

    $remotes = git remote
    if (!$remotes) {
        Write-Host (Get-Msg "NoRemote") -ForegroundColor Red
        Pause; return
    }
    
    Write-Host (Get-Msg "Init_Engage" -P1 $branchName) -ForegroundColor Cyan
    git switch -c $branchName
    
    $formattedRemotes = $remotes -join ', '
    Write-Host (Get-Msg "Networks" -P1 $formattedRemotes) -ForegroundColor DarkGray
    
    $targetRemote = Read-Host (Get-Msg "Init_AskRem")
    if ([string]::IsNullOrWhiteSpace($targetRemote)) { $targetRemote = "origin" }

    if ($targetRemote -match '^(ALL|all)$') {
        foreach ($r in $remotes) {
            Write-Host (Get-Msg "Uplink" -P1 $r) -ForegroundColor Cyan
            git push -u $r $branchName
        }
    }
    else {
        Write-Host (Get-Msg "Uplink" -P1 $targetRemote) -ForegroundColor Cyan
        git push -u $targetRemote $branchName
    }
    
    Write-Host (Get-Msg "Init_Ok") -ForegroundColor Green
    Pause
}

function Invoke-Commit {
    Write-Host (Get-Msg "Com_Scan") -ForegroundColor Cyan
    git status -s
    Write-Host ""
    
    $commitMsg = Read-Host (Get-Msg "Com_AskMsg")
    if ([string]::IsNullOrWhiteSpace($commitMsg)) {
        Write-Host (Get-Msg "Com_Cancel") -ForegroundColor Yellow
        Pause; return
    }

    Write-Host (Get-Msg "Com_Prep") -ForegroundColor DarkGray
    git add .
    Write-Host (Get-Msg "Com_Crypt") -ForegroundColor DarkGray
    git commit -m $commitMsg
    Write-Host (Get-Msg "Com_Ok") -ForegroundColor Green
    Pause
}

function Invoke-Deploy {
    $currentBranch = git branch --show-current
    if ($currentBranch -eq 'main') {
        Write-Host (Get-Msg "Dep_AlrMain") -ForegroundColor Red
        Pause; return
    }

    $remotes = git remote
    if (!$remotes) {
        Write-Host (Get-Msg "NoRemote") -ForegroundColor Red
        Pause; return
    }

    Write-Host (Get-Msg "Dep_Seq" -P1 $currentBranch) -ForegroundColor Yellow
    Write-Host (Get-Msg "Dep_SwMain") -ForegroundColor DarkGray
    git switch main
    Write-Host (Get-Msg "Dep_Sync") -ForegroundColor DarkGray
    git pull origin main
    Write-Host (Get-Msg "Dep_Merge" -P1 $currentBranch) -ForegroundColor DarkGray
    git merge $currentBranch

    $formattedRemotes = $remotes -join ', '
    Write-Host (Get-Msg "Networks" -P1 $formattedRemotes) -ForegroundColor DarkGray
    
    $targetRemote = Read-Host (Get-Msg "Dep_AskRem")
    if ([string]::IsNullOrWhiteSpace($targetRemote)) { $targetRemote = "origin" }

    Write-Host (Get-Msg "Dep_Cloud") -ForegroundColor DarkGray
    if ($targetRemote -match '^(ALL|all)$') {
        foreach ($r in $remotes) {
            Write-Host (Get-Msg "Uplink" -P1 $r) -ForegroundColor Cyan
            git push $r main
        }
    }
    else {
        git push $targetRemote main
    }
    
    Write-Host (Get-Msg "Dep_Ok") -ForegroundColor Green
    $delete = Read-Host (Get-Msg "Dep_AskPurge" -P1 $currentBranch)
    if ($delete -match '^[ysYS]$') {
        git branch -d $currentBranch
        if ($targetRemote -match '^(ALL|all)$') {
            foreach ($r in $remotes) { git push $r --delete $currentBranch }
        }
        else {
            git push $targetRemote --delete $currentBranch
        }
        Write-Host (Get-Msg "Dep_PurgeOk" -P1 $currentBranch) -ForegroundColor Green
    }
    Pause
}

function Invoke-Purge {
    git branch
    $branchToDelete = Read-Host (Get-Msg "Purg_AskBranch")
    if ($branchToDelete -eq 'main') {
        Write-Host (Get-Msg "Purg_MainDeny") -ForegroundColor Red
    }
    elseif (![string]::IsNullOrWhiteSpace($branchToDelete)) {
        git branch -d $branchToDelete
        $remotes = git remote
        if ($remotes) {
            $formattedRemotes = $remotes -join ', '
            Write-Host (Get-Msg "Networks" -P1 $formattedRemotes) -ForegroundColor DarkGray
            $targetRemote = Read-Host (Get-Msg "Purg_AskRem")
            if ([string]::IsNullOrWhiteSpace($targetRemote)) { $targetRemote = "origin" }
            
            if ($targetRemote -match '^(ALL|all)$') {
                foreach ($r in $remotes) { git push $r --delete $branchToDelete }
            }
            else {
                git push $targetRemote --delete $branchToDelete
            }
        }
        Write-Host (Get-Msg "Purg_Ok") -ForegroundColor Green
    }
    Pause
}

function Invoke-Switch {
    Write-Host (Get-Msg "Sw_Avail") -ForegroundColor Cyan
    git branch
    
    $targetBranch = Read-Host (Get-Msg "Sw_AskNode")
    if (![string]::IsNullOrWhiteSpace($targetBranch)) {
        Write-Host (Get-Msg "Sw_Transf" -P1 $targetBranch) -ForegroundColor Yellow
        git switch $targetBranch
        Write-Host (Get-Msg "Sw_Status") -ForegroundColor Cyan
        git status -s
    }
    Pause
}

function Invoke-Status {
    Write-Host (Get-Msg "Stat_Title") -ForegroundColor Cyan
    git status -s
    Write-Host (Get-Msg "Stat_Hist") -ForegroundColor Cyan
    git log --oneline --graph -n 5
    Write-Host " "
    Pause
}

function Invoke-Stash {
    Write-Host (Get-Msg "Stash_O1") -ForegroundColor Yellow
    Write-Host (Get-Msg "Stash_O2") -ForegroundColor Yellow
    Write-Host (Get-Msg "Stash_O3") -ForegroundColor Yellow
    $stashChoice = Read-Host (Get-Msg "Stash_Ask")
    
    switch ($stashChoice) {
        '1' { git stash; Write-Host (Get-Msg "Stash_Save") -ForegroundColor Green }
        '2' { git stash pop; Write-Host (Get-Msg "Stash_Rest") -ForegroundColor Green }
        '3' { git stash list }
        default { Write-Host (Get-Msg "Cancel") -ForegroundColor Red }
    }
    Pause
}

function Invoke-Audit {
    Write-Host (Get-Msg "Aud_O1") -ForegroundColor Yellow
    Write-Host (Get-Msg "Aud_O2") -ForegroundColor Yellow
    $diffChoice = Read-Host (Get-Msg "Aud_Ask")
    Write-Host (Get-Msg "Aud_Hint") -ForegroundColor Magenta
    
    Start-Sleep -Seconds 2
    if ($diffChoice -eq '1') { git diff }
    elseif ($diffChoice -eq '2') { git diff --staged }
    else { Write-Host (Get-Msg "Cancel") -ForegroundColor Red }
    Pause
}

function Invoke-Radar {
    Write-Host (Get-Msg "Rad_Init") -ForegroundColor Cyan
    git fetch --all
    Write-Host (Get-Msg "Rad_Comp") -ForegroundColor Cyan
    git status
    Write-Host (Get-Msg "Rad_Ok") -ForegroundColor Green
    Pause
}

function Invoke-Revert {
    Write-Host (Get-Msg "Rev_Warn") -ForegroundColor Red
    Write-Host (Get-Msg "Rev_Desc") -ForegroundColor Yellow
    $confirmRevert = Read-Host (Get-Msg "Rev_Ask")
    
    if ($confirmRevert -match '^[ysYS]$') {
        git reset --soft HEAD~1
        Write-Host (Get-Msg "Rev_Ok") -ForegroundColor Green
        git status -s
    }
    else {
        Write-Host (Get-Msg "Abort") -ForegroundColor Green
    }
    Pause
}

function Invoke-Discard {
    Write-Host (Get-Msg "Dis_Warn") -ForegroundColor Red
    Write-Host (Get-Msg "Dis_Desc") -ForegroundColor Yellow
    $confirmRestore = Read-Host (Get-Msg "Dis_Ask")
    
    if ($confirmRestore -match '^[ysYS]$') {
        git restore .
        Write-Host (Get-Msg "Dis_Ok") -ForegroundColor Green
    }
    else {
        Write-Host (Get-Msg "Abort") -ForegroundColor Green
    }
    Pause
}

function Invoke-Network {
    Write-Host (Get-Msg "Net_Title") -ForegroundColor Cyan
    git remote -v
    Write-Host (Get-Msg "Net_O1") -ForegroundColor Yellow
    Write-Host (Get-Msg "Net_O2") -ForegroundColor Yellow
    Write-Host (Get-Msg "Net_O0") -ForegroundColor DarkGray
    $netChoice = Read-Host " [?] "
    
    if ($netChoice -eq '1') {
        $rName = Read-Host (Get-Msg "Net_Ask1")
        $rUrl = Read-Host (Get-Msg "Net_AskUrl")
        git remote add $rName $rUrl
        Write-Host (Get-Msg "Net_OkAdd" -P1 $rName) -ForegroundColor Green
    }
    elseif ($netChoice -eq '2') {
        $rName = Read-Host (Get-Msg "Net_Ask2")
        git remote remove $rName
        Write-Host (Get-Msg "Net_OkRem" -P1 $rName) -ForegroundColor Green
    }
    Pause
}

function Invoke-Install {
    Write-Host (Get-Msg "Inst_Warn") -ForegroundColor Yellow
    $currentScriptPath = $PSScriptRoot | Split-Path -Parent | Join-Path -ChildPath "git-ops.ps1"
    
    if ([string]::IsNullOrEmpty($currentScriptPath)) {
        Write-Host (Get-Msg "Inst_Err") -ForegroundColor Red
    }
    else {
        Write-Host (Get-Msg "Inst_Src" -P1 $currentScriptPath) -ForegroundColor DarkGray
        
        $execPolicy = Get-ExecutionPolicy -Scope CurrentUser
        if ($execPolicy -eq 'Restricted' -or $execPolicy -eq 'Undefined') {
            Write-Host (Get-Msg "Inst_Pol") -ForegroundColor DarkGray
            Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
        }

        $funcName = Read-Host (Get-Msg "Inst_Ask")
        if ([string]::IsNullOrWhiteSpace($funcName)) { $funcName = "git-ops" }
        
        $profileContext = "function $funcName { & `"$currentScriptPath`" }"
        if (!(Test-Path -Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force | Out-Null }
        
        $profileContent = Get-Content $PROFILE -Raw -ErrorAction SilentlyContinue
        if ($profileContent -match "function $funcName ") {
            Write-Host (Get-Msg "Inst_Exist" -P1 $funcName) -ForegroundColor Yellow
        }
        else {
            Add-Content -Path $PROFILE -Value "`n# Chavatte Security Terminal`n$profileContext"
            Write-Host (Get-Msg "Inst_Ok" -P1 $funcName) -ForegroundColor Green
        }
    }
    Pause
}

function Invoke-Update {
    Write-Host (Get-Msg "Upd_Init") -ForegroundColor Cyan
    $repoRoot = (Get-Item "$PSScriptRoot\..\..").FullName
    
    try {
        $updateLog = git -C $repoRoot pull origin main 2>&1
        Write-Host $updateLog -ForegroundColor DarkGray
        Write-Host (Get-Msg "Upd_Ok") -ForegroundColor Green
    }
    catch {
        Write-Host (Get-Msg "Upd_Err") -ForegroundColor Red
    }
    Pause
}

function Invoke-Shield {
    Write-Host (Get-Msg "Sh_Init") -ForegroundColor Cyan
    
    $gitDir = git rev-parse --git-dir 2>$null
    if ([string]::IsNullOrWhiteSpace($gitDir)) {
        Write-Host (Get-Msg "Sh_NoGit") -ForegroundColor Red
        Pause; return
    }

    $hookPath = Join-Path (Resolve-Path $gitDir).Path "hooks\pre-commit"

    $hookContent = @"
#!/bin/bash
# ==========================================================
# Chavatte Security - Sentinel Shield (Pre-commit hook)
# ==========================================================

echo -e "\033[0;36m[Sentinel Shield] Scanning for exposed secrets...\033[0m"

# Regex para segredos comuns (AWS, GitHub, Slack, RSA Keys)
PATTERNS=(
    "BEGIN RSA PRIVATE KEY"
    "ghp_[0-9a-zA-Z]{36}"
    "AKIA[0-9A-Z]{16}"
    "xox[baprs]-[0-9a-zA-Z]{10,48}"
)

STAGED_FILES=`$(git diff --cached --name-only --diff-filter=ACM)

if [ -z "`$STAGED_FILES" ]; then
    exit 0
fi

for FILE in `$STAGED_FILES; do
    for PATTERN in "`${PATTERNS[@]}"; do
        if git diff --cached "`$FILE" | grep -Eiq "`$PATTERN"; then
            echo -e "\033[1;31m[!] ALERTA DE SEGURANÇA: Possível credencial exposta!\033[0m"
            echo -e "Arquivo: `$FILE"
            echo -e "Padrão detectado: `$PATTERN"
            echo -e "Commit bloqueado! Remova o segredo ou force com 'git commit --no-verify'."
            exit 1
        fi
    done
done

echo -e "\033[0;32m[Sentinel Shield] Scan limpo. Prosseguindo...\033[0m"
exit 0
"@

    Set-Content -Path $hookPath -Value $hookContent -Force
    Write-Host (Get-Msg "Sh_Ok") -ForegroundColor Green
    Pause
}
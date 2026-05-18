#!/bin/bash

# ==============================================================================
# CHAVATTE SECURITY | ACTIONS MODULE (Git Operations - Bash)
# ==============================================================================

invoke_initiate() {
    local branchName
    read -p "$(get_msg "Init_AskBranch")" branchName
    if [ -z "$(echo -n "$branchName" | xargs)" ]; then return; fi

    local remotes=$(git remote)
    if [ -z "$remotes" ]; then
        echo -e "${RED}$(get_msg "NoRemote")${NC}"
        pause
        return
    fi

    echo -e "${CYAN}$(get_msg "Init_Engage" "$branchName")${NC}"
    git switch -c "$branchName"

    local formatted_remotes=$(echo "$remotes" | tr '\n' ', ' | sed 's/, $//')
    echo -e "${DARKGRAY}$(get_msg "Networks" "$formatted_remotes")${NC}"

    local targetRemote
    read -p "$(get_msg "Init_AskRem")" targetRemote
    if [ -z "$(echo -n "$targetRemote" | xargs)" ]; then targetRemote="origin"; fi

    if [[ "$targetRemote" =~ ^[Aa][Ll][Ll]$ ]]; then
        for r in $remotes; do
            echo -e "${CYAN}$(get_msg "Uplink" "$r")${NC}"
            git push -u $r "$branchName"
        done
    else
        echo -e "${CYAN}$(get_msg "Uplink" "$targetRemote")${NC}"
        git push -u "$targetRemote" "$branchName"
    fi

    echo -e "${GREEN}$(get_msg "Init_Ok")${NC}"
    pause
}

invoke_commit() {
    echo -e "${CYAN}$(get_msg "Com_Scan")${NC}"
    git status -s
    echo ""

    local commitMsg
    read -p "$(get_msg "Com_AskMsg")" commitMsg
    if [ -z "$(echo -n "$commitMsg" | xargs)" ]; then
        echo -e "${YELLOW}$(get_msg "Com_Cancel")${NC}"
        pause
        return
    fi

    echo -e "${DARKGRAY}$(get_msg "Com_Prep")${NC}"
    git add .
    echo -e "${DARKGRAY}$(get_msg "Com_Crypt")${NC}"
    git commit -m "$commitMsg"
    echo -e "${GREEN}$(get_msg "Com_Ok")${NC}"
    pause
}

invoke_deploy() {
    local currentBranch=$(git branch --show-current)
    if [ "$currentBranch" == "main" ]; then
        echo -e "${RED}$(get_msg "Dep_AlrMain")${NC}"
        pause
        return
    fi

    local remotes=$(git remote)
    if [ -z "$remotes" ]; then
        echo -e "${RED}$(get_msg "NoRemote")${NC}"
        pause
        return
    fi

    echo -e "${YELLOW}$(get_msg "Dep_Seq" "$currentBranch")${NC}"
    echo -e "${DARKGRAY}$(get_msg "Dep_SwMain")${NC}"
    git switch main
    echo -e "${DARKGRAY}$(get_msg "Dep_Sync")${NC}"
    git pull origin main
    echo -e "${DARKGRAY}$(get_msg "Dep_Merge" "$currentBranch")${NC}"
    git merge "$currentBranch"

    local formatted_remotes=$(echo "$remotes" | tr '\n' ', ' | sed 's/, $//')
    echo -e "${DARKGRAY}$(get_msg "Networks" "$formatted_remotes")${NC}"

    local targetRemote
    read -p "$(get_msg "Dep_AskRem")" targetRemote
    if [ -z "$(echo -n "$targetRemote" | xargs)" ]; then targetRemote="origin"; fi

    echo -e "${DARKGRAY}$(get_msg "Dep_Cloud")${NC}"
    if [[ "$targetRemote" =~ ^[Aa][Ll][Ll]$ ]]; then
        for r in $remotes; do
            echo -e "${CYAN}$(get_msg "Uplink" "$r")${NC}"
            git push $r main
        done
    else
        git push "$targetRemote" main
    fi

    echo -e "${GREEN}$(get_msg "Dep_Ok")${NC}"

    local deleteChoice
    read -p "$(get_msg "Dep_AskPurge" "$currentBranch")" deleteChoice
    if [[ "$deleteChoice" =~ ^[YySs]$ ]]; then
        git branch -d "$currentBranch"

        if [[ "$targetRemote" =~ ^[Aa][Ll][Ll]$ ]]; then
            for r in $remotes; do git push $r --delete "$currentBranch"; done
        else
            git push "$targetRemote" --delete "$currentBranch"
        fi
        echo -e "${GREEN}$(get_msg "Dep_PurgeOk" "$currentBranch")${NC}"
    fi
    pause
}

invoke_purge() {
    git branch
    echo ""
    local branchToDelete
    read -p "$(get_msg "Purg_AskBranch")" branchToDelete

    if [ "$branchToDelete" == "main" ]; then
        echo -e "${RED}$(get_msg "Purg_MainDeny")${NC}"
    elif [ -n "$(echo -n "$branchToDelete" | xargs)" ]; then
        git branch -d "$branchToDelete"

        local remotes=$(git remote)
        if [ -n "$remotes" ]; then
            local formatted_remotes=$(echo "$remotes" | tr '\n' ', ' | sed 's/, $//')
            echo -e "${DARKGRAY}$(get_msg "Networks" "$formatted_remotes")${NC}"

            local targetRemote
            read -p "$(get_msg "Purg_AskRem")" targetRemote
            if [ -z "$(echo -n "$targetRemote" | xargs)" ]; then targetRemote="origin"; fi

            if [[ "$targetRemote" =~ ^[Aa][Ll][Ll]$ ]]; then
                for r in $remotes; do git push $r --delete "$branchToDelete"; done
            else
                git push "$targetRemote" --delete "$branchToDelete"
            fi
        fi
        echo -e "${GREEN}$(get_msg "Purg_Ok")${NC}"
    fi
    pause
}

invoke_switch() {
    echo -e "${CYAN}$(get_msg "Sw_Avail")${NC}"
    git branch
    echo ""

    local targetBranch
    read -p "$(get_msg "Sw_AskNode")" targetBranch

    if [ -n "$(echo -n "$targetBranch" | xargs)" ]; then
        echo -e "${YELLOW}$(get_msg "Sw_Transf" "$targetBranch")${NC}"
        git switch "$targetBranch"
        echo -e "${CYAN}$(get_msg "Sw_Status")${NC}"
        git status -s
    fi
    pause
}

invoke_status() {
    echo -e "${CYAN}$(get_msg "Stat_Title")${NC}"
    git status -s
    echo -e "${CYAN}$(get_msg "Stat_Hist")${NC}"
    git log --oneline --graph -n 5
    echo " "
    pause
}

invoke_stash() {
    echo -e "${YELLOW}$(get_msg "Stash_O1")${NC}"
    echo -e "${YELLOW}$(get_msg "Stash_O2")${NC}"
    echo -e "${YELLOW}$(get_msg "Stash_O3")${NC}"
    local stashChoice
    read -p "$(get_msg "Stash_Ask")" stashChoice

    case $stashChoice in
        1) git stash; echo -e "${GREEN}$(get_msg "Stash_Save")${NC}" ;;
        2) git stash pop; echo -e "${GREEN}$(get_msg "Stash_Rest")${NC}" ;;
        3) git stash list ;;
        *) echo -e "${RED}$(get_msg "Cancel")${NC}" ;;
    esac
    pause
}

invoke_audit() {
    echo -e "${YELLOW}$(get_msg "Aud_O1")${NC}"
    echo -e "${YELLOW}$(get_msg "Aud_O2")${NC}"
    local diffChoice
    read -p "$(get_msg "Aud_Ask")" diffChoice
    echo -e "${MAGENTA}$(get_msg "Aud_Hint")${NC}"
    sleep 2

    if [ "$diffChoice" == "1" ]; then git diff
    elif [ "$diffChoice" == "2" ]; then git diff --staged
    else echo -e "${RED}$(get_msg "Cancel")${NC}"
    fi
    pause
}

invoke_radar() {
    echo -e "${CYAN}$(get_msg "Rad_Init")${NC}"
    git fetch --all
    echo -e "${CYAN}$(get_msg "Rad_Comp")${NC}"
    git status
    echo -e "${GREEN}$(get_msg "Rad_Ok")${NC}"
    pause
}

invoke_revert() {
    echo -e "${RED}$(get_msg "Rev_Warn")${NC}"
    echo -e "${YELLOW}$(get_msg "Rev_Desc")${NC}"
    local confirmRevert
    read -p "$(get_msg "Rev_Ask")" confirmRevert

    if [[ "$confirmRevert" =~ ^[YySs]$ ]]; then
        git reset --soft HEAD~1
        echo -e "${GREEN}$(get_msg "Rev_Ok")${NC}"
        git status -s
    else
        echo -e "${GREEN}$(get_msg "Abort")${NC}"
    fi
    pause
}

invoke_discard() {
    echo -e "${RED}$(get_msg "Dis_Warn")${NC}"
    echo -e "${YELLOW}$(get_msg "Dis_Desc")${NC}"
    local confirmRestore
    read -p "$(get_msg "Dis_Ask")" confirmRestore

    if [[ "$confirmRestore" =~ ^[YySs]$ ]]; then
        git restore .
        echo -e "${GREEN}$(get_msg "Dis_Ok")${NC}"
    else
        echo -e "${GREEN}$(get_msg "Abort")${NC}"
    fi
    pause
}

invoke_network() {
    echo -e "${CYAN}$(get_msg "Net_Title")${NC}"
    git remote -v
    echo -e "${YELLOW}$(get_msg "Net_O1")${NC}"
    echo -e "${YELLOW}$(get_msg "Net_O2")${NC}"
    echo -e "${DARKGRAY}$(get_msg "Net_O0")${NC}"
    local netChoice
    read -p "$(get_msg "Net_Ask")" netChoice

    if [ "$netChoice" == "1" ]; then
        local rName rUrl
        read -p "$(get_msg "Net_Ask1")" rName
        read -p "$(get_msg "Net_AskUrl")" rUrl
        git remote add "$rName" "$rUrl"
        echo -e "${GREEN}$(get_msg "Net_OkAdd" "$rName")${NC}"
    elif [ "$netChoice" == "2" ]; then
        local rName
        read -p "$(get_msg "Net_Ask2")" rName
        git remote remove "$rName"
        echo -e "${GREEN}$(get_msg "Net_OkRem" "$rName")${NC}"
    fi
    pause
}

invoke_install() {
    echo -e "${YELLOW}$(get_msg "Inst_Warn")${NC}"
    
    local current_script_path=$(readlink -f "$0")

    if [ -z "$current_script_path" ]; then
        echo -e "${RED}$(get_msg "Inst_Err")${NC}"
    else
        echo -e "${DARKGRAY}$(get_msg "Inst_Src" "$current_script_path")${NC}"

        local user_shell=$(basename "$SHELL")
        local profile_file="$HOME/.${user_shell}rc"
        if [ ! -f "$profile_file" ]; then profile_file="$HOME/.bashrc"; fi

        local funcName
        read -p "$(get_msg "Inst_Ask")" funcName
        if [ -z "$(echo -n "$funcName" | xargs)" ]; then funcName="git-ops"; fi

        if grep -q "alias $funcName=" "$profile_file"; then
            echo -e "${YELLOW}$(get_msg "Inst_Exist" "$funcName")${NC}"
        else
            echo "" >> "$profile_file"
            echo "# Chavatte Security Terminal" >> "$profile_file"
            echo "alias $funcName=\"bash '$current_script_path'\"" >> "$profile_file"

            echo -e "${GREEN}$(get_msg "Inst_Ok" "$funcName")${NC}"
            echo -e "${CYAN}$(get_msg "Inst_Hint")${NC}"
        fi
    fi
    pause
}

invoke_update() {
    echo -e "${CYAN}$(get_msg "Upd_Init")${NC}"
    
    local current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    local repo_root="$( cd "$current_dir/../.." && pwd )"
    
    if git -C "$repo_root" pull origin main; then
        echo -e "${GREEN}$(get_msg "Upd_Ok")${NC}"
    else
        echo -e "${RED}$(get_msg "Upd_Err")${NC}"
    fi
    pause
}

invoke_shield() {
    echo -e "${CYAN}$(get_msg "Sh_Init")${NC}"
    
    local git_dir=$(git rev-parse --git-dir 2>/dev/null)
    if [ -z "$git_dir" ]; then
        echo -e "${RED}$(get_msg "Sh_NoGit")${NC}"
        pause
        return
    fi

    local hook_path="$git_dir/hooks/pre-commit"
    
    cat << 'EOF' > "$hook_path"
#!/bin/bash
# ==========================================================
# Chavatte Security - Sentinel Shield (Pre-commit hook)
# ==========================================================

echo -e "\033[0;36m[Sentinel Shield] Scanning for exposed secrets...\033[0m"

PATTERNS=(
    "BEGIN RSA PRIVATE KEY"
    "ghp_[0-9a-zA-Z]{36}"
    "AKIA[0-9A-Z]{16}"
    "xox[baprs]-[0-9a-zA-Z]{10,48}"
)

STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM)

if [ -z "$STAGED_FILES" ]; then
    exit 0
fi

for FILE in $STAGED_FILES; do
    for PATTERN in "${PATTERNS[@]}"; do
        if git diff --cached "$FILE" | grep -Eiq "$PATTERN"; then
            echo -e "\033[1;31m[!] ALERTA DE SEGURANÇA: Possível credencial exposta!\033[0m"
            echo -e "Arquivo: $FILE"
            echo -e "Padrão detectado: $PATTERN"
            echo -e "Commit bloqueado! Remova o segredo ou force com 'git commit --no-verify'."
            exit 1
        fi
    done
done

echo -e "\033[0;32m[Sentinel Shield] Scan limpo. Prosseguindo...\033[0m"
exit 0
EOF

    chmod +x "$hook_path"
    echo -e "${GREEN}$(get_msg "Sh_Ok")${NC}"
    pause
}
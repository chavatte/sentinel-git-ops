param(
    [string]$PassedLang = "en"
)

$Script:Lang = $PassedLang

function Show-AuthMenu {
    Clear-Host
    Write-Host "`n"
    Write-Host "      _/_/_/  _/_/_/_/  _/      _/  _/_/_/_/_/  _/  _/      _/  _/_/_/_/  _/        " -ForegroundColor Cyan
    Write-Host "   _/        _/        _/_/    _/      _/      _/  _/_/    _/  _/        _/         " -ForegroundColor Cyan
    Write-Host "    _/_/    _/_/_/    _/  _/  _/      _/      _/  _/  _/  _/  _/_/_/    _/          " -ForegroundColor DarkCyan
    Write-Host "       _/  _/        _/    _/_/      _/      _/  _/    _/_/  _/        _/           " -ForegroundColor DarkCyan
    Write-Host "_/_/_/    _/_/_/_/  _/      _/      _/      _/  _/      _/  _/_/_/_/  _/_/_/_/_/    " -ForegroundColor DarkBlue
    Write-Host "                                                                                    "
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor DarkGray
    Write-Host "                CHAVATTE SECURITY | AUTH-OPS MODULE V1.0                            " -ForegroundColor Magenta
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor DarkGray
    
    if ($Script:Lang -eq "en") {
        Write-Host "  [ IDENTITY AND ACCESS MANAGEMENT ]" -ForegroundColor White
        Write-Host "  🔑 1. GITHUB  : Initiate Login (Requires GitHub CLI or uses PAT/SSH)" -ForegroundColor Yellow
        Write-Host "  🦊 2. GITLAB  : Initiate Login (Requires GitLab CLI or uses PAT/SSH)" -ForegroundColor Yellow
        Write-Host "  🔐 3. KEYBASE : Initiate Login (Requires Keybase App)" -ForegroundColor Yellow
        Write-Host "  🛡️  4. SSH KEY : Generate new cryptographic key (Ed25519)" -ForegroundColor Cyan
        Write-Host "  🌐 5. LANG    : Switch Language (EN / PT-BR) -> Current: EN" -ForegroundColor Green
        Write-Host "  🛑 0. BACK    : Return to Main Terminal" -ForegroundColor DarkGray
    }
    else {
        Write-Host "  [ GERENCIAMENTO DE IDENTIDADE E ACESSO ]" -ForegroundColor White
        Write-Host "  🔑 1. GITHUB  : Iniciar Login (Requer GitHub CLI ou usa PAT/SSH)" -ForegroundColor Yellow
        Write-Host "  🦊 2. GITLAB  : Iniciar Login (Requer GitLab CLI ou usa PAT/SSH)" -ForegroundColor Yellow
        Write-Host "  🔐 3. KEYBASE : Iniciar Login (Requer Keybase App)" -ForegroundColor Yellow
        Write-Host "  🛡️  4. SSH KEY : Gerar nova chave criptográfica (Ed25519)" -ForegroundColor Cyan
        Write-Host "  🌐 5. LANG    : Alternar Idioma (EN / PT-BR) -> Atual: PT-BR" -ForegroundColor Green
        Write-Host "  🛑 0. VOLTAR  : Retornar ao Terminal Principal" -ForegroundColor DarkGray
    }
    Write-Host " ────────────────────────────────────────────────────────────────────────────────── " -ForegroundColor DarkGray
}

do {
    Show-AuthMenu
    $promptMsg = if ($Script:Lang -eq "en") { " [auth-ops] ❯" } else { " [auth-ops] ❯" }
    $authChoice = Read-Host "`n$promptMsg"

    switch ($authChoice) {
        '1' {
            if ($Script:Lang -eq "en") { Write-Host "`n [>] Initiating GITHUB authentication protocol..." -ForegroundColor Cyan } else { Write-Host "`n [>] Iniciando protocolo de autenticação GITHUB..." -ForegroundColor Cyan }
            
            if (Get-Command gh -ErrorAction SilentlyContinue) {
                gh auth login
            }
            else {
                if ($Script:Lang -eq "en") {
                    Write-Host " [!] GitHub CLI (gh) not detected." -ForegroundColor Yellow
                    Write-Host " [*] Configuring Git Credential Manager..." -ForegroundColor DarkGray
                    git config --global credential.helper manager
                    Write-Host " [OK] Credential Manager activated. Login will be prompted on your next 'git push'." -ForegroundColor Green
                }
                else {
                    Write-Host " [!] GitHub CLI (gh) não detectado." -ForegroundColor Yellow
                    Write-Host " [*] Configurando Git Credential Manager..." -ForegroundColor DarkGray
                    git config --global credential.helper manager
                    Write-Host " [OK] Credential Manager ativado. O login será solicitado no seu próximo 'git push'." -ForegroundColor Green
                }
            }
            Pause
        }
        '2' {
            if ($Script:Lang -eq "en") { Write-Host "`n [>] Initiating GITLAB authentication protocol..." -ForegroundColor Cyan } else { Write-Host "`n [>] Iniciando protocolo de autenticação GITLAB..." -ForegroundColor Cyan }
            
            if (Get-Command glab -ErrorAction SilentlyContinue) {
                glab auth login
            }
            else {
                if ($Script:Lang -eq "en") {
                    Write-Host " [!] GitLab CLI (glab) not detected." -ForegroundColor Yellow
                    Write-Host " [*] Hint: Generate an SSH key (Option 4) and add it to GitLab settings," -ForegroundColor DarkGray
                    Write-Host "     or use a Personal Access Token (PAT) on your next push." -ForegroundColor DarkGray
                }
                else {
                    Write-Host " [!] GitLab CLI (glab) não detectado." -ForegroundColor Yellow
                    Write-Host " [*] Dica: Gere uma chave SSH (Opção 4) e adicione nas configurações do GitLab," -ForegroundColor DarkGray
                    Write-Host "     ou use um Personal Access Token (PAT) no próximo push." -ForegroundColor DarkGray
                }
            }
            Pause
        }
        '3' {
            if ($Script:Lang -eq "en") { Write-Host "`n [>] Initiating KEYBASE authentication protocol..." -ForegroundColor Cyan } else { Write-Host "`n [>] Iniciando protocolo de autenticação KEYBASE..." -ForegroundColor Cyan }
            
            if (Get-Command keybase -ErrorAction SilentlyContinue) {
                keybase login
            }
            else {
                if ($Script:Lang -eq "en") { Write-Host " [!] Keybase client not detected. Please install and add it to PATH." -ForegroundColor Red } else { Write-Host " [!] Cliente Keybase não detectado. Certifique-se de instalá-lo e adicioná-lo ao PATH." -ForegroundColor Red }
            }
            Pause
        }
        '4' {
            if ($Script:Lang -eq "en") { 
                Write-Host "`n 🛡️ [ HIGH SECURITY SSH KEY GENERATOR (Ed25519) ]" -ForegroundColor Cyan
                $email = Read-Host " [?] Enter the email associated with your accounts (e.g., dev@chavatte.online)"
            }
            else { 
                Write-Host "`n 🛡️ [ GERADOR DE CHAVE SSH DE ALTA SEGURANÇA (Ed25519) ]" -ForegroundColor Cyan
                $email = Read-Host " [?] Digite o email associado às suas contas (ex: dev@chavatte.online)"
            }
            
            if ([string]::IsNullOrWhiteSpace($email)) { break }

            $sshPath = "$env:USERPROFILE\.ssh\id_ed25519"
            if (Test-Path $sshPath) {
                if ($Script:Lang -eq "en") { Write-Host " [!] ALERT: An Ed25519 key already exists on your machine!" -ForegroundColor Red } else { Write-Host " [!] ALERTA: Uma chave Ed25519 já existe na sua máquina!" -ForegroundColor Red }
            }
            else {
                if ($Script:Lang -eq "en") { Write-Host " [*] Forging cryptographic key..." -ForegroundColor DarkGray } else { Write-Host " [*] Forjando chave criptográfica..." -ForegroundColor DarkGray }
                ssh-keygen -t ed25519 -C "$email" -f "$sshPath" -N ""
                if ($Script:Lang -eq "en") { Write-Host " [OK] Key generated successfully!" -ForegroundColor Green } else { Write-Host " [OK] Chave gerada com sucesso!" -ForegroundColor Green }
            }

            if (Test-Path "$sshPath.pub") {
                if ($Script:Lang -eq "en") { 
                    Write-Host "`n [>] YOUR PUBLIC KEY (Copy and paste into GitHub/GitLab):" -ForegroundColor Magenta
                    Get-Content "$sshPath.pub" | Write-Host -ForegroundColor Yellow
                    Write-Host "`n [*] Hint: Add this key to your Git provider's SSH settings." -ForegroundColor DarkGray
                }
                else {
                    Write-Host "`n [>] SUA CHAVE PÚBLICA (Copie e cole no GitHub/GitLab):" -ForegroundColor Magenta
                    Get-Content "$sshPath.pub" | Write-Host -ForegroundColor Yellow
                    Write-Host "`n [*] Dica: Adicione essa chave nas configurações SSH do seu provedor Git." -ForegroundColor DarkGray
                }
            }
            Pause
        }
        '5' {
            if ($Script:Lang -eq "en") { 
                $Script:Lang = "pt"
                Write-Host "`n [OK] Idioma alterado para Português (PT-BR)." -ForegroundColor Green
            }
            else { 
                $Script:Lang = "en" 
                Write-Host "`n [OK] Language switched to English (EN)." -ForegroundColor Green
            }
            Start-Sleep -Seconds 1
        }
        '0' {
            if ($Script:Lang -eq "en") { Write-Host " [>] Returning to main node..." -ForegroundColor DarkGray } else { Write-Host " [>] Retornando ao nó principal..." -ForegroundColor DarkGray }
        }
        default {
            if ($Script:Lang -eq "en") { Write-Host " [!] Command not recognized." -ForegroundColor Red } else { Write-Host " [!] Comando não reconhecido." -ForegroundColor Red }
            Start-Sleep -Seconds 1
        }
    }
} until ($authChoice -eq '0')
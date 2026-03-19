<pre style="font-size: 0.5rem;">

                              \\\\\\
                           \\\\\\\\\\\\
                          \\\\\\\\\\\\\\\
-------------,-|           |C>   // )\\\\|    .o88b. db   db  .d8b.  db    db  .d8b.  d888888b d888888b d88888b
           ,','|          /    || ,'/////|   d8P  Y8 88   88 d8' '8b 88    88 d8' '8b '~~88~~' '~~88~~' 88'  
---------,','  |         (,    ||   /////    8P      88ooo88 88ooo88 Y8    8P 88ooo88    88       88    88ooooo 
         ||    |          \\  ||||//''''|    8b      88~~~88 88~~~88 '8b  d8' 88~~~88    88       88    88~~~~~ 
         ||    |           |||||||     _|    Y8b  d8 88   88 88   88  '8bd8'  88   88    88       88    88.   
         ||    |______      ''''\____/ \      'Y88P' YP   YP YP   YP    YP    YP   YP    YP       YP    Y88888P
         ||    |     ,|         _/_____/ \
         ||  ,'    ,' |        /          |                 ___________________________________________
         ||,'    ,'   |       |         \  |              / \                                           \ 
_________|/    ,'     |      /           | |             |  |                                            | 
_____________,'      ,',_____|      |    | |              \ |      chavatte@duck.com                     | 
             |     ,','      |      |    | |                |                       chavatte.vercel.app  | 
             |   ,','    ____|_____/    /  |                |    ________________________________________|___
             | ,','  __/ |             /   |                |  /                                            /
_____________|','   ///_/-------------/   |                 \_/____________________________________________/ 
              |===========,'                                                                                  
			  

</pre>

<div align="center">
  <h1>🛡️ Sentinel Git-OPS </h1>
  <p>An interactive, DevSecOps-oriented CLI tool to streamline Git workflows across Windows and Linux.</p>

  [![PowerShell](https://img.shields.io/badge/PowerShell-%E2%89%A55.1-blue?logo=powershell&style=flat-square)](https://docs.microsoft.com/en-us/powershell/) [![Bash](https://img.shields.io/badge/Bash-Native-4EAA25?logo=gnu-bash&style=flat-square)](https://www.gnu.org/software/bash/) [![Git](https://img.shields.io/badge/Git-Workflow-F05032?logo=git&style=flat-square)](https://git-scm.com/) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

  <br><br>

  **[ 🇺🇸 English ](#english)** &nbsp; | &nbsp; **[ 🇧🇷 Português ](#portugues)**

</div>

---

<a id="english"></a>

## 🇺🇸 English

### 📌 Overview

**Sentinel Git-OPS** is a robust, interactive command-line interface designed by **DevChavatte** to automate and secure the Git development lifecycle. Built with a DevSecOps mindset, it replaces repetitive Git commands with a unified, menu-driven experience. It includes tactical tools for code auditing, safe rollbacks, and stash management.

### ✨ Key Features

* **Cross-Platform:** Native versions for both Windows (PowerShell) and Linux (Bash/Zsh).
* **Global Injection:** Features an auto-installer that injects the script globally into your `.bashrc`, `.zshrc`, or `$PROFILE`.
* **Built-in i18n:** Swap between English and Portuguese interfaces on the fly.
* **DevSecOps Tactical Tools:** Built-in commands for `diff` auditing, `fetch` radar, and a "Panic Button" for soft resets.

### 📂 Repository Structure

```text
📦 sentinel-git-ops
 ┣ 📂 win
 ┃ ┗ 📜 git-ops.ps1    # PowerShell script for Windows
 ┣ 📂 linux
 ┃ ┗ 📜 git-ops.sh     # Bash script for Linux/macOS
 ┗ 📜 README.md
```


### 🚀 Installation & Usage

#### Windows (PowerShell)

1. Clone the repository and navigate to the directory:
   **PowerShell**

   ```
   git clone [https://github.com/chavatte/sentinel-git-ops.git](https://github.com/chavatte/sentinel-git-ops.git)
   cd sentinel-git-ops
   ```
2. Run the script:
   **PowerShell**

   ```
   .\win\git-ops.ps1
   ```
3. **Make it Global:** Select option `[12] INSTALL` from the menu. It will automatically configure your Execution Policies and inject the command into your `$PROFILE`.

#### Linux / macOS (Bash)

1. Clone the repository and navigate to the directory:
   **Bash**

   ```
   git clone [https://github.com/chavatte/sentinel-git-ops.git](https://github.com/chavatte/sentinel-git-ops.git)
   cd sentinel-git-ops
   ```
2. Grant execution permissions and run the script:
   **Bash**

   ```
   chmod +x linux/git-ops.sh
   ./linux/git-ops.sh
   ```
3. **Make it Global:** Select option `[12] INSTALL` from the menu. It will create an alias in your `~/.bashrc` or `~/.zshrc`.

### 🛠️ Command Reference

| **Category** | **Command** | **Description**                                                     |
| ------------------ | ----------------- | ------------------------------------------------------------------------- |
| **Workflow** | `1. INITIATE`   | Creates a new branch and pushes it to remote (`switch -c`&`push -u`). |
| **Workflow** | `2. COMMIT`     | Stages and commits changes securely (`add .`&`commit -m`).            |
| **Workflow** | `3. DEPLOY`     | Switches to main, pulls updates, merges current branch, and pushes.       |
| **Workflow** | `4. PURGE`      | Deletes a local branch to keep nodes clean.                               |
| **Workflow** | `5. SWITCH`     | Easily check out existing local branches.                                 |
| **Tactical** | `6. STATUS`     | Displays repository status and recent commit tree.                        |
| **Tactical** | `7. STASH`      | Quick access to stash, pop, and list commands.                            |
| **Tactical** | `8. AUDIT`      | Triggers `git diff`to inspect code before committing.                   |
| **Tactical** | `9. RADAR`      | Runs `git fetch --all`to check remote updates passively.                |
| **Tactical** | `10. REVERT`    | **Panic Button:**Soft resets `HEAD~1`, keeping files staged.            |
| **Tactical** | `11. DISCARD`   | Drops all uncommitted local changes (`git restore .`).                  |
| **System**   | `12. INSTALL`   | Injects the terminal command globally.                                    |
| **System**   | `13. LANG`      | Toggles UI language (EN / PT-BR).                                         |

---

<a id="portugues"></a>

## 🇧🇷 Português

### 📌 Sobre o Projeto

O **Sentinel Git-OPS** é uma interface de linha de comando interativa e robusta, desenvolvida pela **Chavatte Security** para automatizar e proteger o ciclo de vida do desenvolvimento com Git. Construído com a mentalidade de DevSecOps, ele substitui comandos repetitivos por uma experiência unificada de menu, incluindo ferramentas táticas para auditoria de código, reversões seguras e gerenciamento de stash.

### ✨ Principais Recursos

* **Multiplataforma:** Versões nativas projetadas para Windows (PowerShell) e Linux (Bash/Zsh).
* **Injeção Global:** Possui um auto-instalador que injeta o script globalmente no seu `.bashrc`, `.zshrc` ou `$PROFILE`.
* **i18n Nativo:** Alterne entre as interfaces em Inglês e Português em tempo real.
* **Ferramentas Táticas DevSecOps:** Comandos embutidos para auditoria via `diff`, radar com `fetch` e um "Botão de Pânico" para soft resets imediatos.

### 📂 Estrutura do Repositório

**Plaintext**

```
📦 sentinel-git-ops
 ┣ 📂 win
 ┃ ┗ 📜 git-ops.ps1    # Script PowerShell para Windows
 ┣ 📂 linux
 ┃ ┗ 📜 git-ops.sh     # Script Bash para Linux/macOS
 ┗ 📜 README.md
```

### 🚀 Instalação e Uso

#### Windows (PowerShell)

1. Clone o repositório e acesse a pasta:
   **PowerShell**

   ```
   git clone [https://github.com/chavatte/sentinel-git-ops.git](https://github.com/chavatte/sentinel-git-ops.git)
   cd sentinel-git-ops
   ```
2. Execute o script:
   **PowerShell**

   ```
   .\win\git-ops.ps1
   ```
3. **Tornar Global:** Selecione a opção `[12] INSTALL` no menu. O script configurará automaticamente suas Políticas de Execução e injetará o comando no seu `$PROFILE`.

#### Linux / macOS (Bash)

1. Clone o repositório e acesse a pasta:
   **Bash**

   ```
   git clone [https://github.com/chavatte/sentinel-git-ops.git](https://github.com/chavatte/sentinel-git-ops.git)
   cd sentinel-git-ops
   ```
2. Dê permissão de execução e rode o script:
   **Bash**

   ```
   chmod +x linux/git-ops.sh
   ./linux/git-ops.sh
   ```
3. **Tornar Global:** Selecione a opção `[12] INSTALL` no menu. Ele criará um alias diretamente no seu `~/.bashrc` ou `~/.zshrc`.

### 🛠️ Referência de Comandos

| **Categoria** | **Comando** | **Descrição**                                                                              |
| ------------------- | ----------------- | -------------------------------------------------------------------------------------------------- |
| **Workflow**  | `1. INITIATE`   | Cria uma nova branch e já estabelece o vínculo remoto (`switch -c`&`push -u`).               |
| **Workflow**  | `2. COMMIT`     | Prepara e comita as alterações de forma segura (`add .`&`commit -m`).                        |
| **Workflow**  | `3. DEPLOY`     | Alterna para a main, atualiza, injeta a branch atual (merge) e faz o push.                         |
| **Workflow**  | `4. PURGE`      | Deleta uma branch local para manter os nodes limpos.                                               |
| **Workflow**  | `5. SWITCH`     | Alterna rapidamente entre as branches locais existentes.                                           |
| **Tático**   | `6. STATUS`     | Exibe o status do repositório e a árvore de commits recentes.                                    |
| **Tático**   | `7. STASH`      | Acesso rápido aos comandos de guardar, restaurar e listar stashes.                                |
| **Tático**   | `8. AUDIT`      | Aciona o `git diff`para inspecionar o código antes do commit.                                   |
| **Tático**   | `9. RADAR`      | Executa `git fetch --all`para checar atualizações remotas passivamente.                        |
| **Tático**   | `10. REVERT`    | **Botão de Pânico:**Realiza um `soft reset`no último commit, mantendo os arquivos preparados. |
| **Tático**   | `11. DISCARD`   | Descarta todas as alterações locais não comitadas (`git restore .`).                          |
| **Sistema**   | `12. INSTALL`   | Injeta o comando do terminal globalmente no sistema.                                               |
| **Sistema**   | `13. LANG`      | Alterna o idioma da interface (EN / PT-BR).                                                        |

---

<div align="center">

<sub>Developed with 💻 & 🛡️ by <b>DevChavatte</b></sub>

</div>

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
  <h1>🛡️ Sentinel Git-OPS (v2.3.1)</h1>
  <p><strong>Uma CLI Tática de DevSecOps para Padronização e Segurança de Fluxos Git</strong></p>

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22904347.svg)](https://doi.org/10.5281/zenodo.22904347) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT) 
[![PowerShell](https://img.shields.io/badge/PowerShell-%E2%89%A55.1-blue?logo=powershell&style=flat-square)](https://docs.microsoft.com/en-us/powershell/) [![Bash](https://img.shields.io/badge/Bash-Native-4EAA25?logo=gnu-bash&style=flat-square)](https://www.gnu.org/software/bash/) [![Git](https://img.shields.io/badge/Git-Workflow-F05032?logo=git&style=flat-square)](https://git-scm.com/)

<br>

  **[ 🇺🇸 English ](README.md)** &nbsp; | &nbsp; **[ 🇧🇷 Português ](README.pt-br.md)**

</div>

---

## 📖 Índice

- [Visão Geral](#-visão-geral)
- [Arquitetura e Recursos](#-arquitetura-e-recursos)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação e Setup Global](#-instalação-e-setup-global)
- [Referência de Comandos](#-referência-de-comandos)
- [Casos de Uso DevSecOps](#-casos-de-uso-devsecops)
- [Política de Segurança](#-política-de-segurança)

---

## 📌 Visão Geral

O **Sentinel Git-OPS**, desenvolvido pela **Chavatte Security**, é uma Interface de Linha de Comando (CLI) interativa projetada para fortalecer e automatizar o ciclo de vida do desenvolvimento via Git.

Ao substituir comandos Git repetitivos por uma experiência guiada no terminal, o Sentinel minimiza erros operacionais humanos (como pushes acidentais para a main ou commits sem revisão) e introduz princípios de DevSecOps diretamente no fluxo de trabalho diário do desenvolvedor.

## 🏗️ Arquitetura e Recursos

Construído com base nos princípios de **Clean Code**, a versão **v2.3.1** introduz uma arquitetura altamente modular onde o roteador central é estritamente separado das ações lógicas e dos dicionários dinâmicos de tradução (i18n).

* 📊 **Dashboard Tático:** Telemetria em tempo real exibindo o node atual (branch), status de modificação de arquivos e redes na nuvem conectadas diretamente no cabeçalho do terminal.
* 🛡️ **Shield Ops (Pre-Commit Hook):** Injeta um script de segurança para auditar ativamente e bloquear commits que contenham segredos expostos (chaves AWS, chaves RSA, tokens do GitHub).
* 🔄 **Protocolo Self-Update:** Mantenha sua CLI atualizada com um único comando usando o mecanismo de auto-pull integrado.
* 🌐 **Omnicast Multi-Push:** Adicionado suporte estendido para **GitLab** e **Keybase** como infraestruturas de rede adicionais. Realize o deploy do seu código simultaneamente em múltiplos ambientes remotos direcionando o push para `ALL`.
* 🔐 **Auth-Ops e Camada de Autorização:** Módulo de gestão de identidade independente com suporte nativo para login e autorização via CLI no **GitHub**, **GitLab** e **Keybase**. Forje chaves SSH `Ed25519` de alta segurança diretamente pela ferramenta.
* 💻 **Multiplataforma Nativo:** Ambientes de execução nativos para Windows (PowerShell) e Linux/macOS (Bash/Zsh).
* 🌍 **i18n Nativo:** Alterne a interface entre Inglês e Português em tempo real.

---

## ⚙️ Pré-requisitos

Certifique-se de que o seu ambiente atende aos seguintes requisitos antes de implantar o Sentinel:

- **Git** `v2.0` ou superior.
- **Windows:** PowerShell `5.1` ou PowerShell Core `7+`.
- **Linux/macOS:** Ambiente padrão `bash` ou `zsh`.
- *(Opcional)* GitHub CLI (`gh`), GitLab CLI (`glab`), ou aplicativo Keybase para uso do módulo Auth-Ops.

---

## 🚀 Instalação e Setup Global

O Sentinel Git-OPS possui um injetor global integrado. Você não precisa configurar o seu PATH manualmente.

### Para Ambientes Windows

```powershell
# 1. Clone o repositório
git clone https://github.com/chavatte/sentinel-git-ops.git
cd sentinel-git-ops

# 2. Inicie o terminal
.\win\git-ops.ps1
```

> **Tornar Global:** Com o menu aberto, selecione a opção `[12] INSTALL`. O Sentinel configurará automaticamente as Políticas de Execução e injetará o alias no seu `$PROFILE`.

### Para Ambientes Linux/macOS

```
# 1. Clone o repositório
git clone https://github.com/chavatte/sentinel-git-ops.git
cd sentinel-git-ops

# 2. Conceda permissões de execução
chmod +x linux/git-ops.sh linux/core/*.sh

# 3. Inicie o terminal
./linux/git-ops.sh
```

> **Tornar Global:** Selecione a opção `[12] INSTALL`. O Sentinel gravará um alias diretamente no seu `~/.bashrc` ou `~/.zshrc`.

---

## 🛠️ Referência de Comandos

| **Categoria** | **Comando** | **Descrição**                                                                  |
| ------------------- | ----------------- | -------------------------------------------------------------------------------------- |
| **Workflow**  | `1. INITIATE`   | Provisiona uma nova branch e já a vincula ao repositório remoto.                     |
| **Workflow**  | `2. COMMIT`     | Prepara as alterações e registra um commit local após exibir os arquivos modificados.      |
| **Workflow**  | `3. DEPLOY`     | Alterna para a main, atualiza, injeta a sua feature (merge) e faz o push.              |
| **Workflow**  | `4. PURGE`      | Exclui com segurança uma branch local para manter a higiene dos nodes.                |
| **Workflow**  | `5. SWITCH`     | Checkout interativo entre nodes locais existentes.                                     |
| **Tático**   | `6. STATUS`     | Exibe a integridade do repositório e a árvore cronológica de commits.               |
| **Tático**   | `7. STASH`      | Acesso rápido aos comandos de guardar, restaurar e listar stashes.                    |
| **Tático**   | `8. AUDIT`      | Abre o diff das alterações locais ou preparadas para revisão.       |
| **Tático**   | `9. RADAR`      | Executa `git fetch --all` e exibe o status do repositório.          |
| **Tático**   | `10. REVERT`    | **Botão de Pânico:** executa `git reset --soft HEAD~1` para reescrever o commit local mais recente, preservando as alterações. |
| **Tático**   | `11. DISCARD`   | **Protocolo de Destruição:** executa `git restore .` para descartar alterações de arquivos rastreados no working tree.    |
| **Sistema**   | `12. INSTALL`   | Injeta o alias do terminal globalmente no seu sistema.                                 |
| **Sistema**   | `13. LANG`      | Alterna o idioma da interface (EN / PT-BR).                                            |
| **Sistema**   | `14. NETWORK`   | Gerencia remotes e habilita o roteamento Omnicast Multi-Push.                          |
| **Sistema**   | `15. AUTH`      | Gerencia Credenciais e forja chaves SSH seguras (Ed25519).                             |
| **Sistema**   | `16. UPDATE`    | **Self-Update:** atualiza automaticamente para a última versão do Sentinel.           |
| **Sistema**   | `17. SHIELD`    | **Shield Ops:** instala um hook pre-commit opcional baseado em padrões para detectar formatos comuns de segredos.          |

---

## 📚 Casos de Uso DevSecOps

### 1. Redundância Multi-Remote (Omnicast)

Manter mais de um remote pode melhorar a redundância operacional, mas não substitui backup, controle de acesso ou segurança do repositório.

1. Abra o terminal e selecione `14` ( **NETWORK** ).
2. Escolha `1` para vincular um novo remote (ex: nomeie como `gitlab` e cole a URL).
3. Durante qualquer operação de `INITIATE` ou `DEPLOY`, quando solicitado o remote de destino, digite `ALL`.
4. O Sentinel fará o broadcast do seu código para *ambos* o GitHub e o GitLab simultaneamente.

### 2. Detecção por Padrões de Segredos (Shield Ops)

Use o hook opcional como uma camada adicional para detectar formatos comuns de credenciais. Ele pode gerar falsos positivos/negativos e pode ser ignorado com `git commit --no-verify`; por isso, o uso de ferramentas dedicadas de secret scanning continua recomendado.

1. Execute a opção `17` ( **SHIELD** ) dentro do seu projeto.
2. Se um desenvolvedor tentar comitar uma credencial exposta (como uma chave da AWS ou token do GitHub), o Sentinel intercepta o processo.
3. O commit é instantaneamente **bloqueado** com um alerta detalhando o arquivo e o padrão de segredo detectado.

### 3. Recuperação de Commit Local

Se você acidentalmente preparar (stage) uma função quebrada ou precisar retrabalhar seu último commit:

1. Pressione imediatamente `10` ( **REVERT** ).
2. O Sentinel executa um `git reset --soft HEAD~1` cirúrgico.
3. Isso reescreve o commit local mais recente preservando as alterações no índice. Use em histórico local/não publicado; para histórico compartilhado, prefira um commit corretivo ou `git revert`.

---


## 📝 Notas de Segurança

O Sentinel pode alterar o estado do repositório, perfis do shell, remotes e hooks Git. Revise a saída dos comandos antes de usar operações destrutivas ou de reescrita de histórico. O Shield é uma verificação limitada baseada em padrões e não substitui soluções dedicadas de secret scanning.

## 📚 Citação

Caso você utilize o Sentinel Git-OPS em pesquisas, trabalhos acadêmicos, ensino ou estudos de engenharia de software, cite a versão 2.3.1 por meio do DOI:

**DOI:** https://doi.org/10.5281/zenodo.22904347

### Citação recomendada

Chavatte, João Carlos. 2026. *Sentinel Git-OPS: A DevSecOps Tactical CLI for Standardized and Secure Git Workflows*. Versão 2.3.1. Zenodo. https://doi.org/10.5281/zenodo.22904347

## 🛡️ Política de Segurança

Como um projeto mantido pela  **Chavatte Security** , levamos a integridade de nossas ferramentas a sério. Se você descobrir uma vulnerabilidade ou um possível vetor de ataque nos scripts da CLI (como falhas de injeção de comandos), por favor, **não** abra uma issue pública. Consulte [`SECURITY.md`](SECURITY.md) para o processo de divulgação privada.

## 📝 Licença e Autoria

Este projeto é distribuído sob a licença  **MIT** . Consulte o arquivo `LICENSE` para mais detalhes.

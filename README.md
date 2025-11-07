# Carls — Sistema Operacional Simulado (Bash / Termux)

Carls é um sistema operacional **simulado** escrito inteiramente em **Bash**, projetado para rodar no **Termux** (Android). Seu objetivo é oferecer uma experiência interativa, modular e educativa — funcionando como um mini ambiente de sistema completo, com shell, gerenciador de arquivos, processos e pacotes.

---

## 🚀 Recursos Principais

* 🧠 **Shell interno**: ambiente de comandos simulado com prompt isolado.
* 📂 **Gerenciador de arquivos**: listar, criar, editar e remover arquivos dentro de `~/.carls/fs`.
* ✏️ **Editor rápido** embutido (modo `:wq` para salvar e sair).
* ⚙️ **Gerenciador de processos simulado**: cria e remove jobs armazenados em `~/.carls/jobs`.
* 📦 **Gerenciador de pacotes (**``**)**: instala scripts externos (ex: via GitHub RAW URLs).
* 🌐 **Utilitários de rede**: ping e curl integrados.
* 🧩 **Sistema modular**: fácil de estender com novos pacotes Bash leves.

---

## 📦 Instalação no Termux

### 1️⃣ Instalar dependências básicas

```bash
pkg update && pkg upgrade -y
pkg install bash curl git dialog -y
```

### 2️⃣ Clonar o repositório

```bash
git clone https://github.com/SEU_USUARIO/carls.git
cd carls
chmod +x carls.sh
```

### 3️⃣ Instalar como comando global

```bash
mkdir -p ~/bin
cp carls.sh ~/bin/carls
chmod +x ~/bin/carls
```

> 💡 Dica: Adicione `~/bin` ao PATH no arquivo `~/.bashrc` ou `~/.profile`.

---

## 🧭 Uso

Execute o comando principal:

```bash
carls
```

### Menu Principal (modo texto)

```
1) Abrir shell interno
2) Gerenciador de arquivos (fs)
3) Editor rápido
4) Processos simulados
5) Gerenciador de pacotes
6) Rede
7) Configurações
8) Sobre / Ajuda
0) Sair
```

> Se o pacote `dialog` estiver instalado, Carls exibirá um menu visual interativo.

---

## 🧠 Estrutura de Diretórios

```
~/.carls/
├── fs/           # Sistema de arquivos simulado
├── packages/     # Pacotes instalados via carls-get
├── jobs          # Lista de processos simulados
├── carls.log     # Log do sistema
└── config        # Configurações persistentes
```

---

## 🧩 Criando um Pacote Compatível (carls-get)

Um pacote é simplesmente um script executável Bash. Exemplo: `hello-world.sh`

```bash
#!/usr/bin/env bash
echo "Olá do pacote Hello World!"
```

Publique como **GitHub RAW** (exemplo):

```
https://raw.githubusercontent.com/usuario/repositorio/main/hello-world.sh
```

Instale no Carls:

```
carls-get
# Escolha opção 1 e insira a URL acima
```

Execute depois:

```
carls-get → opção 3 → hello-world.sh
```

---

## ⚙️ Configurações

As configurações ficam em `~/.carls/config`.

Exemplo:

```
EDITOR=nano
WELCOME_SHOWN=1
```

Você pode alterá-las pelo menu de Configurações.

---

## 🪪 Licença

Este projeto é distribuído sob a **Licença MIT**.

---

## 💡 Contribuindo

1. Faça um fork do repositório.
2. Crie uma branch de feature:

   ```bash
   git checkout -b minha-feature
   ```
3. Faça suas alterações e envie um pull request.

Sugestões de melhorias são bem-vindas! 🧩

---

## 👨‍💻 Autor

Desenvolvido por **Ghessé Luís** — criador de programas Bash no Termux.

---

## 🧱 Exemplo de Sessão

```
$ carls
Bem-vindo ao Carls — v0.9.0
1) Abrir shell interno
$ echo "hello world"
hello world
$ exit
Retornando ao Carls...
```

---

## 🌌 Futuras versões

*

---

> ⚡ Projeto experimental e educativo — ideal para aprender Bash avançado e automação no Termux.
> 

<h1 align="center">Inkordious Dotfiles</h1>

> *Repositorio simple para mis dotfiles de Zsh y Git*

---

Estos Dotfiles integran varias funciones para Zsh y Git, haciendo más simple su uso e integrando varias funciones más <3

Pero antes de seguir con nada, vamos a poner un poco en cuenta la estructura de este repositorio:

<details>
<summary>Estructura de este repositorio</summary>
```text
  .
├── core
│   ├── .config
│   │   └── zsh
│   │       ├── aliases.zsh
│   │       ├── exports.zsh
│   │       ├── functions.zsh
│   │       ├── heavy-functions.zsh
│   │       ├── hooks.zsh
│   │       ├── prompt.zsh
│   │       ├── startup.zsh
│   │       ├── variables.zsh
│   │       ├── .zshignore
│   │       └── .zshrc
│   ├── .local
│   │   └── bin
│   │       ├── git-cc
│   │       ├── git-db
│   │       └── git-nb
│   └── .zshenv
├── .git
│   ├── config
│   ├── description
│   ├── HEAD
│   ├── hooks
│   │   ├── applypatch-msg.sample
│   │   ├── commit-msg.sample
│   │   ├── fsmonitor-watchman.sample
│   │   ├── post-update.sample
│   │   ├── pre-applypatch.sample
│   │   ├── pre-commit.sample
│   │   ├── pre-merge-commit.sample
│   │   ├── prepare-commit-msg.sample
│   │   ├── pre-push.sample
│   │   ├── pre-rebase.sample
│   │   ├── pre-receive.sample
│   │   ├── push-to-checkout.sample
│   │   ├── sendemail-validate.sample
│   │   └── update.sample
│   ├── index
│   ├── info
│   │   └── exclude
│   ├── logs
│   │   ├── HEAD
│   │   └── refs
│   │       ├── heads
│   │       │   ├── docs
│   │       │   │   └── ange
│   │       │   └── main
│   │       └── remotes
│   │           └── origin
│   │               ├── docs
│   │               │   └── ange
│   │               └── HEAD
│   ├── objects
│   │   ├── info
│   │   └── pack
│   │       ├── pack-e12a4d88b8aebf7e0454c6162ba5c0a939369a1d.idx
│   │       ├── pack-e12a4d88b8aebf7e0454c6162ba5c0a939369a1d.pack
│   │       └── pack-e12a4d88b8aebf7e0454c6162ba5c0a939369a1d.rev
│   ├── packed-refs
│   └── refs
│       ├── heads
│       │   ├── docs
│       │   │   └── ange
│       │   └── main
│       ├── remotes
│       │   └── origin
│       │       ├── docs
│       │       │   └── ange
│       │       └── HEAD
│       └── tags
├── .gitignore
├── LICENSE
└── README.md
  ```

</details>

---

Ahora, con la estructura de este repositorio explicada, vamos a lo interesante, pero antes de saltar de suicida a la instalación, hay que verificar que tengas todas las dependencias instaladas:
*(para Arch y derivados)*

```bash
sudo pacman -S stow git zsh
```

_(para Debian y derivados)*

```bash
sudo apt install stow git zsh
```

_(para Fedora y sus derivados)*

```bash
sudo dnf/dnf5 install stow git zsh
```

Y ahora sí, con todo terminado es hora de seguir con la instalación

<h3 align="center">Instrucciónes de Instalación</h3>

la instalación es el paso más simple, ya que se simplifica mucho al usar un **install.sh** que aporta color y una buena experiencia de instalación >:3

```bash
mkdir $HOME/dotfiles
cd $HOME/dotfiles
git clone https://github.com/Axxel-otl/InkordiousDotfiles
chmod +x install.sh
./isntall.sh
```

---

Y pues, eso es todo, algo fácil y rapido, así que nos vemos <3

> -- By Axxel-otl & Ange

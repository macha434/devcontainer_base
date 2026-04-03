# devcontainer_base

主要なプログラミング言語用のdevcontainer ベース雛形を置いているにゃ。

- `base`: git と zsh を使える最小の共通ベース構成
- `node`: `mcr.microsoft.com/devcontainers/base:ubuntu` を土台に features で整える構成

## テンプレートごとの内容

### `base`

- git
- zsh
- ホストの `~/.gitconfig` をコンテナから参照

### `node`

- Node 22 LTS
- pnpm
- ESLint
- Prettier
- git
- zsh
- ホストの `~/.gitconfig` をコンテナから参照

## 配置

- `base`
- `node`

各ディレクトリをそのままコピーすると、プロジェクト root として使える構成にしてあるにゃ。  
`base` は `.devcontainer/devcontainer.json` と `.gitignore` を、`node` はそれに加えて `package.json` と ESLint / Prettier 設定を同梱しているにゃ。

## CLI

`bin/devcontainer-base` でテンプレートを配置できるにゃ。

```sh
bin/devcontainer-base <base> [destination]
```

例:

```sh
bin/devcontainer-base base
bin/devcontainer-base node ./my-app
```

補完定義は `completions/` に置いてあり、後から `Makefile` 側でインストールできる前提にしてあるにゃ。

```sh
make help
make install
make update
make uninstall
```

`make` だけを実行した時は `make help` と同じ案内が出るにゃ。  
`make install` と `make update` は `~/.local/bin` と `~/.local/share/...` に CLI、補完、テンプレート本体を配置するにゃ。

詳しい使い方はそれぞれの README を見るにゃ。

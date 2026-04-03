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

詳しい使い方はそれぞれの README を見るにゃ。

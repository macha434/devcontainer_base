# node

Node 向けの devcontainer ベース雛形だにゃ。

## 仕様

- image: `mcr.microsoft.com/devcontainers/base:ubuntu`
- features:
  - `ghcr.io/devcontainers/features/node:1`
  - `ghcr.io/devcontainers/features/git:1`
- Node 22 LTS
- pnpm を `corepack` で有効化
- ESLint / Prettier をグローバル CLI として導入
- `zsh` を既定シェルとして使う
- VS Code の ESLint / Prettier 拡張を自動で入れる
- ホストの `~/.gitconfig` を bind mount

## 同梱サンプル

- `.devcontainer/devcontainer.json`
- `.gitignore`
- `package.json`
- `eslint.config.mjs`
- `.prettierrc.json`
- `.prettierignore`

## 使い方

1. `node` ディレクトリを丸ごとコピーして、利用先プロジェクトとして使うにゃ
2. そのディレクトリを VS Code で開いて Dev Containers / Codespaces を起動するにゃ
3. コンテナ内で `pnpm install` を実行するにゃ
4. `node -v`、`pnpm -v`、`eslint -v`、`prettier -v` を確認するにゃ

`package.json` に依存と scripts を入れてあるので、実運用ではグローバル CLI より `pnpm lint` や `pnpm format` を使う想定だにゃ。

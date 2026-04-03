# base

git と `zsh` だけを入れた、最小の devcontainer ベース雛形だにゃ。

## 仕様

- image: `mcr.microsoft.com/devcontainers/base:ubuntu`
- features:
  - `ghcr.io/devcontainers/features/common-utils:2`
  - `ghcr.io/devcontainers/features/git:1`
- `zsh` を既定シェルとして使う
- ホストの `~/.gitconfig` を bind mount

## 同梱サンプル

- `.devcontainer/devcontainer.json`
- `.gitignore`

## 使い方

1. `base` ディレクトリを丸ごとコピーして、利用先プロジェクトとして使うにゃ
2. そのディレクトリを VS Code で開いて Dev Containers / Codespaces を起動するにゃ
3. コンテナ内で `git --version` と `zsh --version` を確認するにゃ
4. 必要に応じて、利用する言語やツールの設定をこの上に足していくにゃ

ホストの git 設定は `~/.gitconfig` をそのまま参照する形にしてあるにゃ。

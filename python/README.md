# python

Python 向けの devcontainer ベース雛形だにゃ。

## 仕様

- image: `mcr.microsoft.com/devcontainers/base:ubuntu`
- features:
  - `ghcr.io/devcontainers/features/python:1`
  - `ghcr.io/devcontainers/features/git:1`
- Python 3.12
- `ruff` を formatter / linter として利用
- `pre-commit` で commit 時に `ruff` と基本的なファイル整形を実行
- `zsh` を既定シェルとして使う
- VS Code の Python / Pylance / Ruff 拡張を自動で入れる
- ホストの `~/.gitconfig` と `~/.zshrc` を read-only で bind mount

## 同梱サンプル

- `.devcontainer/devcontainer.json`
- `.gitignore`
- `.python-version`
- `.pre-commit-config.yaml`
- `pyproject.toml`

## 使い方

1. `python` ディレクトリを丸ごとコピーして、利用先プロジェクトとして使うにゃ
2. そのディレクトリを VS Code で開いて Dev Containers / Codespaces を起動するにゃ
3. 必要なら `python -m venv .venv && source .venv/bin/activate` で仮想環境を作るにゃ
4. `pip install -e '.[dev]'` を実行して、プロジェクトローカルにも開発用依存を入れるにゃ
5. `python --version`、`ruff --version`、`pre-commit --version` を確認するにゃ

コンテナ作成時に `ruff` と `pre-commit` をユーザー環境へ入れて、`.git` がある時だけ `pre-commit install --install-hooks` を走らせるにゃ。

## pre-commit

- `check-yaml`、`end-of-file-fixer`、`trailing-whitespace` を回すにゃ
- Python ファイルには `ruff-check --fix` と `ruff-format` を回すにゃ
- 自動修正が入った時は、差分を確認して add し直してから再度 commit するにゃ
- 緊急時だけ `git commit --no-verify` で回避できるけれど、通常は非推奨だにゃ

CLI から入れる場合は、リポジトリ root で `bin/devcontainer-base python [destination]` を使うにゃ。

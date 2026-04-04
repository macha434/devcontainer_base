---
name: pre-commit-tooling-selector
description: この devcontainer_base リポジトリで新しい言語テンプレートを追加する前に、commit 時に実行する formatter と linter の主流構成をまとめて調査して推奨案を決めるスキル。formatter と linter を同じツールでまかなう構成が主流なら、その旨も明示して返す。選んだツールを導入するための公式 devcontainer feature があれば feature ベースの導入案を返し、無ければ通常のセットアップ方法と pre-commit で実行するコマンド例を返す。対象言語が曖昧な場合は先に確認する。
---

# Pre-commit Tooling Selector

このスキルは、pre-commit で回す前提で formatter と linter をまとめて選び、導入方法まで handoff するにゃ。

## 役割

- 対象言語の pre-commit 向け formatter と linter を選定する
- 一次情報を優先する
- formatter と linter を同じツールでまかなうのが主流なら、その構成を優先候補として返す
- feature があれば feature ベースの導入案を返す
- feature が無ければ通常セットアップ方法を返す
- hook フレームワークそのものの実装方式選定は扱わない

## 基本の流れ

1. 対象言語を確認するにゃ。
2. [references/tooling-research-guidelines.md](references/tooling-research-guidelines.md) を読むにゃ。
3. [references/pre-commit-integration-guidelines.md](references/pre-commit-integration-guidelines.md) を読んで、commit 時に回す観点を確認するにゃ。
4. 主流 formatter と linter を一次情報で調査するにゃ。
5. formatter と linter を同じツールでまかなう構成が主流か確認するにゃ。
6. 採用候補を導入するための feature があるかを [references/devcontainer-features.md](references/devcontainer-features.md) を使って確認するにゃ。
7. feature 有り / 無しに応じて導入案と commit 時に実行するコマンド例を返すにゃ。

## 出力形式

1. 対象言語
2. 推奨 formatter
3. 推奨 linter
4. formatter と linter を同一ツールでまかなうのが主流か
5. 選定理由
6. feature がある場合
   - feature 名
   - option
   - devcontainer に組み込む時の要点
7. feature が無い場合
   - 通常のセットアップ方法
   - install 手段
   - 最小設定ファイル候補
8. commit 時に実行するコマンド例
9. open questions

## 具体例

### Python

- 現時点で主流の formatter と linter を確認する
- 同じツールで format と lint をまかなう構成が主流か確認する
- その構成を feature で導入できるか確認する
- feature が無ければ標準的な install 方法と commit 時のコマンド例を返す

### Go

- 言語標準 formatter を基準にする
- lint は別ツールが主流か、同一ツール運用が主流かを確認する
- feature 有無で導入方式を分けて返す
- commit 時に回しても重すぎない構成かを確認する

### 言語未指定

- 先に対象言語をユーザーに確認する

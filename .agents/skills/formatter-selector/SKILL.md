---
name: formatter-selector
description: この devcontainer_base リポジトリで新しい言語テンプレートを追加する前に、対象言語の主流 formatter を調査して推奨構成を決めるスキル。推奨 formatter が決まったら、その導入に使える公式 devcontainer feature があるかも確認し、feature があれば feature ベースの導入案を返し、無ければ通常のセットアップ方法を返す。formatter と linter を同じツールでまかなう構成が主流な場合は、その旨も明示して返す。対象言語が曖昧な場合は先に確認する。
---

# Formatter Selector

このスキルは、対象言語の formatter を選び、その導入方法まで handoff するにゃ。

## 役割

- 主流 formatter を選定する
- 一次情報を優先する
- formatter と linter を同じツールでまかなうのが主流なら、その旨を返す
- feature があれば feature ベースの導入案を返す
- feature が無ければ通常セットアップ方法を返す

## 基本の流れ

1. 対象言語を確認するにゃ。
2. [references/tooling-research-guidelines.md](references/tooling-research-guidelines.md) を読むにゃ。
3. [references/devcontainer-features.md](references/devcontainer-features.md) を読んで、feature 確認の基準を揃えるにゃ。
4. 主流 formatter を一次情報で調査するにゃ。
5. 推奨 formatter を決めるにゃ。
6. formatter と linter を同じツールでまかなう構成が主流か確認するにゃ。
7. その formatter に使える feature があるかを reference に沿って確認するにゃ。
8. feature 有り / 無しに応じて導入案を返すにゃ。

## 出力形式

1. 対象言語
2. 推奨 formatter
3. 選定理由
4. formatter と linter を同じツールでまかなうのが主流か
5. feature がある場合
   - feature 名
   - option
   - devcontainer に組み込む時の要点
6. feature が無い場合
   - 通常のセットアップ方法
   - install 手段
   - 最小設定ファイル候補
7. open questions

## 具体例

### Python

- 現時点で主流の formatter を確認する
- 同じツールで lint まで担う構成が主流か確認する
- その formatter を feature で導入できるか確認する
- feature が無ければ標準的な install 方法を返す

### Go

- 言語標準 formatter を基準にする
- 同じツールで lint まで担うのが主流か確認する
- 追加 formatter が必要かを慎重に判断する
- 導入方式を feature 有無で分けて返す

### 言語未指定

- 先に対象言語をユーザーに確認する

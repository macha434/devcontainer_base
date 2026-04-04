---
name: devcontainer-feature-selector
description: この devcontainer_base リポジトリで新しい言語テンプレートやツール導入方法を決める際に、公式 devcontainer feature が使えるかを調査するスキル。runtime や formatter、linter などを導入したい時に、対応する feature 名、option、既定値、採用時の注意点を確認し、feature を使うべきか `no feature` にすべきかを判断したい時に使う。
---

# Devcontainer Feature Selector

このスキルは、公式 devcontainer feature を調べて採用可否を判断するためのものだにゃ。

## 役割

- 公式 feature の有無を調べる
- feature 名、option、既定値を確認する
- 採用時の注意点を整理する
- feature が無い場合は `no feature` と判断する

## 基本の流れ

1. 導入したい対象を確認するにゃ。
2. [references/devcontainer-features.md](references/devcontainer-features.md) を読むにゃ。
3. 公式 `devcontainers/features` で feature を調べるにゃ。
4. 採用するか `no feature` にするかを判断するにゃ。
5. 後続スキルが使える形で結果を返すにゃ。

## 出力形式

1. 対象
2. 採用する feature 名、または `no feature`
3. 設定すべき option
4. 既定値のうち重要なもの
5. 採用時の注意点
6. `no feature` の場合は通常セットアップへ切り替えるべき理由

## 判断基準

- まず公式 feature を第一候補として確認するにゃ。
- feature が存在しても、言語標準の導入方法より複雑なら `no feature` を検討するにゃ。
- 既存の共通 feature と素直に併用できるかを見るにゃ。
- 後続スキルが実装しやすい構成になるかを重視するにゃ。

## 境界

このスキルは formatter や linter 自体の選定はしないにゃ。
その役割は `formatter-selector` と `linter-selector` が持つにゃ。

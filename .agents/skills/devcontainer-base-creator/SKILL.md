---
name: devcontainer-base-creator
description: この devcontainer_base リポジトリに新しい devcontainer ベースを追加するための上位スキル。主に言語テンプレート追加を対象にして、対象言語と用途を確認したうえで、devcontainer-feature-selector、formatter-selector、linter-selector、pre-commit-tooling-selector を明示的に使い、<base>/ の構成、README、devcontainer-base CLI と補完への影響確認まで含む実装計画をまとめたい時に使う。
---

# Devcontainer Base Creator

このスキルは、この repo に新しい devcontainer ベースを追加する時の全体設計をまとめる上位スキルだにゃ。

## 役割

- 新しい言語テンプレート追加の全体像を決める
- 既存の選定スキルを明示的に使って判断を束ねる
- `<base>/` に必要な構成とファイル一覧を返す
- README に何を書くかを整理する
- `devcontainer-base` CLI と補完への影響確認まで含める

## 使うスキル

1. `devcontainer-feature-selector`
   - runtime や共通ツールを feature で入れるか判断するにゃ。
2. `formatter-selector`
   - 通常の formatter 構成を決めるにゃ。
3. `linter-selector`
   - 通常の linter 構成を決めるにゃ。
4. `pre-commit-tooling-selector`
   - commit 時に走らせる formatter / linter 構成を必ず決めるにゃ。

## 基本の流れ

1. 対象言語と、このベースの想定用途を確認するにゃ。
2. [references/repo-template-rules.md](references/repo-template-rules.md) を読んで、この repo のテンプレート配置ルールを確認するにゃ。
3. `devcontainer-feature-selector` を使って、image / features の方針を決めるにゃ。
4. `formatter-selector` と `linter-selector` を使って、通常の tooling を決めるにゃ。
5. `pre-commit-tooling-selector` を使って、commit 時の tooling 構成を決めるにゃ。
6. それらの結果をまとめて、`<base>/` に必要なファイル一覧と設定方針を作るにゃ。
7. [references/integration-checklist.md](references/integration-checklist.md) を使って、README、CLI、補完への影響を確認するにゃ。
8. 実装ターンでそのまま使える決定事項一覧として返すにゃ。

## 出力形式

1. ベース名
2. 想定用途
3. 採用 image / features
4. formatter / linter 構成
5. pre-commit 構成
6. `<base>/` に必要なファイル一覧
7. README に書くべき内容
8. `bin/devcontainer-base` と補完への影響確認結果
9. open questions

## 具体例

### Python を追加する場合

- Python 用の image / feature 方針を決める
- formatter / linter / pre-commit 構成を決める
- `python/` に必要なファイルと README 内容を整理する
- CLI と補完で自然に検出される構成か確認する

### Go を追加する場合

- Go 用の image / feature 方針を決める
- 言語標準 tooling と追加ツールの切り分けを整理する
- pre-commit で回す構成が現実的か確認する
- `go/` の構成と README 内容をまとめる

### 言語未指定の場合

- 先に対象言語と想定用途をユーザーに確認する

## 境界

- このスキルは既存 4 スキルの代わりにはならないにゃ。
- formatter / linter / feature の個別選定は各スキルに委ねるにゃ。
- hook フレームワーク自体の詳細実装は、このスキル単体では決めないにゃ。

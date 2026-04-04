# 連携チェックリスト

新しいベースを追加する時は、次を確認するにゃ。

- ルート README に新しいテンプレートの説明を追加するか
- `<base>/README.md` を用意して、用途と同梱物を説明するか
- `<base>/.devcontainer/devcontainer.json` が存在して、トップレベルテンプレートとして成立しているか
- `bin/devcontainer-base` の動的列挙条件に自然に乗るか
- bash / zsh 補完がトップレベルテンプレートとして自然に候補へ出せるか
- package manager、formatter、linter、pre-commit 関連ファイルがテンプレート内で完結しているか
- ホスト設定参照や shell 設定など、この repo の既存方針と整合しているか

CLI や補完が動的検出を前提にしている場合でも、新しいテンプレートがその条件を満たしているかは必ず確認するにゃ。

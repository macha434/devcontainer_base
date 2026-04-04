# Repo のテンプレート配置ルール

この repo では、新しいテンプレートをトップレベルの `<base>/` ディレクトリとして置くにゃ。

基本ルール:

- `<base>/` 配下に `.devcontainer/devcontainer.json` を置く
- コピー単位は `<base>/` ディレクトリそのものにする
- テンプレートだけで最低限使える構成にする
- 言語テンプレートでは `.gitignore`、README、言語固有設定ファイルを同梱できる
- `base` のような共通テンプレートと、`node` のような言語テンプレートは同じ配置ルールに乗せる

言語テンプレートでよく含めるもの:

- `.devcontainer/devcontainer.json`
- `.gitignore`
- 言語ごとの formatter / linter 設定
- package manager や tooling を表す設定ファイル
- `<base>/README.md`

テンプレートは、`devcontainer-base` CLI から見てトップレベルの候補として自然に扱える構成にするにゃ。

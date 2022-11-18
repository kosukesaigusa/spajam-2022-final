# spajam2022final

Flutter Lovers チームが参加する SPAJAM 2022 本戦のリポジトリです。

## Flutter

これから書きます。

## Firebase Local Emulator

`firebase/functions` ディレクトリで必要な依存関係をインストールしてください。

```shell
npm ci
```

VSCode に functions ディレクトリの場所を正しく認識させるために、`.vscode/settings.json` に下記を追加してください。

`.vscode/settings.base.json` にも記載しています。

```json:.vscode/settings.json
{
  "eslint.workingDirectories": ["./firebase/functions"]
}
```

Firebase CLI の最新バージョンをマシンのグローバルにインストールしてください。

```shell
npm install -g firebase-tools
```

プロジェクトルートで次のコマンドを実行してください。

```shell
npm --prefix functions run build && firebase emulators:start --inspect-functions --import data --export-on-exit
```

VSCode でブレイクポイントを打ちながらデバッグできるようにするために、`.vscode/launch.json` に次の設定を追加して、実行してください。

```json:.vscode/launch.json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug Functions (local)",
      "type": "node",
      "request": "attach",
      "restart": true,
      "port": 9229
    }
  ]
}
```

成功すると、上記で `firebase emulators:start` したコンソールに "Debugger attached." という出力が現れます。

これで VSCode で `firebase/functions/src/firebase-functions` 下の Firebase Functions のソースコードにブレイクポイントを打ちながらデバッグすることが可能になりました。

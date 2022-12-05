# riverpod

Flutter 3.3, Riverpod 2.0.0-dev, Dart 2.18対応🤝

## 参考

- [Flutter x Riverpod でアプリ開発！実践入門](https://zenn.dev/riscait/books/flutter-riverpod-practical-introduction)
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod/install)
- [Riverpod公式ドキュメント](https://riverpod.dev/ja/)
- [【Flutter】 Riverpod チートシート(書きかけ)](https://zenn.dev/sakusin/articles/5715b1ed2d9761)

## 各Providerの役割と使い分け

|種類|説明|
|:--|:--|
|`Provider`|最も基本的なProvider|
|`StateProvider`|外部から変更可能な状態を提供する|
|`StateNotifierProvider`|外部から変更可能な状態と、状態操作メソッドクラスを提供する|
|`FutureProvider`|非同期で取得した値を提供する|
|`StreamProvider`|断続的に最新の値を提供する|
|`ChangeNotifierProvider`|変更可能な状態を持つクラスを提供する|

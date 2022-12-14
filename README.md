# riverpod

Flutter 3.3, Riverpod 2.0.0-dev, Dart 2.18å¯¾å¿ð¤

## åè

- [Flutter x Riverpod ã§ã¢ããªéçºï¼å®è·µå¥é](https://zenn.dev/riscait/books/flutter-riverpod-practical-introduction)
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod/install)
- [Riverpodå¬å¼ãã­ã¥ã¡ã³ã](https://riverpod.dev/ja/)
- [ãFlutterã Riverpod ãã¼ãã·ã¼ã(æ¸ããã)](https://zenn.dev/sakusin/articles/5715b1ed2d9761)

## åProviderã®å½¹å²ã¨ä½¿ãåã

|ç¨®é¡|èª¬æ|
|:--|:--|
|`Provider`|æãåºæ¬çãªProvider|
|`StateProvider`|å¤é¨ããå¤æ´å¯è½ãªç¶æãæä¾ãã|
|`StateNotifierProvider`|å¤é¨ããå¤æ´å¯è½ãªç¶æã¨ãç¶ææä½ã¡ã½ããã¯ã©ã¹ãæä¾ãã|
|`FutureProvider`|éåæã§åå¾ããå¤ãæä¾ãã|
|`StreamProvider`|æ­ç¶çã«ææ°ã®å¤ãæä¾ãã|
|`ChangeNotifierProvider`|å¤æ´å¯è½ãªç¶æãæã¤ã¯ã©ã¹ãæä¾ãã|

## ä½¿ãæ¹

### 1. Providerãã¢ããªåã§å©ç¨å¯è½ã«ããããã®ç¯å²ï¼ã¹ã³ã¼ãï¼ãæå®

``` dart
void main() {
  runApp(const ProviderScope(child: MyApp()));
}
```

### 2. ç¶æ¿ããWidgetãæ¸ãæã

- `StatelessWidget` => `ConsumerWidget` ã«ãã
- `build` ã« `ref` ãè¿½å 

``` dart
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sample App')),
        body: Container(),
      ),
    );
  }
}
```

### çªå¤ç·¨ï¼`StatefulWidget` + riverpodï¼

- `StatefulWidget` => `ConsumerStatefulWidget` ã«ãã
- `build` ã® `ref` ãåé¤

``` dart
class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sample App')),
        body: Container(),
      ),
    );
  }
}
```

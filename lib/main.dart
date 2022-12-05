import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // Providerをアプリ内で利用可能にするための範囲（スコープ）を指定
  runApp(const ProviderScope(child: MyApp()));
}

// Providerの定数をグローバルに宣言しましょう。
// このProviderの値の型は推論されてString型となります。
// 型を明示する場合： `Provider<String>((ref) => '');`
final appNameProvider = Provider((ref) => 'My TODO');

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerを監視し値を取得するには `watch` を使います。
    final appName = ref.watch(appNameProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // Providerの値を使用して文字列を表示しています。
        appBar: AppBar(title: Text(appName)),
        body: ListView(
          children: const [],
        ),
      ),
    );
  }
}

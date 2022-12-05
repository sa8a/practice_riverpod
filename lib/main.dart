import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // Providerをアプリ内で利用可能にするための範囲（スコープ）を指定
  runApp(const ProviderScope(child: MyApp()));
}

// Providerの定数をグローバルに宣言
final counterProvider = StateProvider(((ref) => 0));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerを読み取る
    // `.notifier`をつけると`StateController`が、
    // つけなければ、`state` つまり int が取得できる
    final counter = ref.watch(counterProvider.notifier);

    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: ElevatedButton(
          onPressed: () => counter.update((state) => state + 1),

          // counterProviderの状態をTextで表示。値が変わると再描画。
          child: Text('Count: ${ref.watch(counterProvider)}'),
        ),
      )),
    );
  }
}

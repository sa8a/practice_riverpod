import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // Providerをアプリ内で利用可能にするための範囲（スコープ）を指定
  runApp(const ProviderScope(child: MyApp()));
}

// 外部から変更可能なStateProviderを例に用います。
final counterProvider = StateProvider((ref) => 10);
// カウンターの値を2倍にした値を提供するProvider
final doubleCounterProvider = Provider((ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // doubleCounterProvider を読み取る。
    // counterProvider の状態が更新されると doubleCounterProvider も変更され、再構築される。
    final doubleCount = ref.watch(doubleCounterProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('')),
        // doubleCounterProvider の値を表示
        body: Text('2倍されたカウント値：$doubleCount'),
      ),
    );
  }
}

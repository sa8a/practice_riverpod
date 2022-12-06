import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // Providerをアプリ内で利用可能にするための範囲（スコープ）を指定
  runApp(const ProviderScope(child: MyApp()));
}

final configProvider = FutureProvider<Map<String, Object?>>((ref) async {
  final jsonString = await rootBundle.loadString('assets/config.json');
  final content = json.decode(jsonString) as Map<String, Object?>;
  return content;
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FutureProviderを読み取る（取得できる型は `AsyncValue<T>`）
    final config = ref.watch(configProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App'),
        ),
        // AsyncValue は `.when` を使ってハンドリングする
        body: config.when(
          // 非同期処理中は `loading` で指定したWidgetが表示される
          loading: () => const CircularProgressIndicator(),
          // エラーが発生した場合に表示されるWidgetを指定
          error: (error, stack) => Text('Error: $error'),
          // 非同期処理が完了すると、取得した `config` が `data` で使用できる
          data: (config) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(config['appName'].toString()),
                  Text(config['isDebug'].toString()),
                  Text(config['defaultAge'].toString()),
                  Text(config['defaultGenders'].toString()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

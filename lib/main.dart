import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/state_notifier_provider_page.dart';

void main() {
  // Providerをアプリ内で利用可能にするための範囲（スコープ）を指定
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateNotifierProviderを読み取る。watchを使用しているので、
    // state（状態）であるTODOリストが更新されると、buildメソッドが再実行されて画面が更新される
    final todoList = ref.watch(todoListNotifierProvider);
    // TodoListNotifier を使用する場合は `.notifier` を付けてProviderを読み取る
    final notifier = ref.watch(todoListNotifierProvider.notifier);

    // 新しいTodoを追加する、プライベートメソッドを定義
    void addTodo() {
      final newTodo = Todo(
        id: Random().nextDouble().toString(),
        title: 'タスク: ',
        completed: false,
      );
      notifier.add(newTodo);
      print(todoList);
      print(todoList[1].id);
      print(todoList[1].title);
      print(todoList[1].completed);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo App'),
          actions: [
            // ボタンを押して新しいTodoを追加できる（実際はTodoのタイトル等を入力できるようにすると良い）
            IconButton(onPressed: addTodo, icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return ListTile(
              // TodoのタイトルをTextで表示
              title: Text(
                '${todo.title}${todo.id}',
                style: TextStyle(
                  decoration:
                      todo.completed ? TextDecoration.lineThrough : null,
                ),
              ),
              leading: Icon(
                todo.completed
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
              ),
              trailing: TextButton(
                onPressed: () => notifier.remove(todo.id),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '削除',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // タップでTODOの完了状態を切り替える
              onTap: () => notifier.toggle(todo.id),
            );
          },
        ),
      ),
    );
  }
}

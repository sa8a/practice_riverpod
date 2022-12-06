import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  const Todo({required this.id, required this.title, required this.completed});

  // イミュータブルなクラスのプロパティはすべて `final` にする必要があります。
  final String id;
  final String title;
  final bool completed;

  // Todo はイミュータブルであり、内容を直接変更できないためコピーを作る必要があります。
  // これはオブジェクトの各プロパティの内容をコピーして新たな Todo を返すメソッドです。
  Todo copyWith({String? id, String? title, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}

class TodoListNotifier extends StateNotifier<List<Todo>> {
  // `super([])`で空のTODOリストを初期値として入れる
  TodoListNotifier() : super([]);

  // 新しいTODO追加メソッド
  void add(Todo todo) {
    // スプレッド演算子（「…」）とは、端的に言えばデータにデータを結合する場合に使われるオペレータ
    // stateというリストにtodoのリストを追加する意味
    // state = [0, 1, 2]; todo = [3, 4];
    // state = [0, 1, 2, 3, 4];
    state = [...state, todo];
  }

  void remove(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}

// Providerの定数をグローバルに宣言
// StateNotifierProviderの後に続けて、Notifierクラスの型と、格納する状態の型を明示する
final todoListNotifierProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>(
  (ref) => TodoListNotifier(),
);

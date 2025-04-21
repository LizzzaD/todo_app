import 'dart:async';

Stream<int> counter() async* {
  for (int i = 0; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    if (i == 3) {
      throw Exception('3 — не позволено');
    }
    yield i;
  }
}

void main() async {
  Stream<int> stream = counter();
  try {
    await for (var val in stream) {
      print(val);
    }
  } catch (e) {
    print('Ошибка от потока: $e');
  }
}

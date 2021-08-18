import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({String? name, @Default(false) isDone, String? id}) = _Task;
}

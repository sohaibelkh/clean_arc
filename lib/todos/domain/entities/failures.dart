import 'package:json_place_holder/core/domain/entities/failures.dart';

class TodoFailure implements Failure {
  final String message;

  TodoFailure(this.message);
  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}

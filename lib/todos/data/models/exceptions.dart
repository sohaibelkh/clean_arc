import 'package:equatable/equatable.dart';

class TodoException  extends Equatable implements Exception{
  final String message;

  const TodoException(this.message);
  
  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}
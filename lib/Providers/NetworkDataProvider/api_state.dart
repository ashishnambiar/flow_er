import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class ApiState extends Equatable {
  const ApiState();
  @override
  List<Object?> get props => [];
}

final class ApiIdleState extends ApiState {
  const ApiIdleState();
}

final class ApiLoadingState extends ApiState {
  const ApiLoadingState();
}

final class ApiSuccessState extends ApiState {
  final Response response;
  const ApiSuccessState({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}

final class ApiErrorState extends ApiState {
  final String message;
  const ApiErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

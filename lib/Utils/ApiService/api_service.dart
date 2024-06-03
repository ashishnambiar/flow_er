import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ApiService {
  static Future<(Response? response, ErrorResponse? error)> call({
    required String baseUrl,
    required String path,
    required String method,
    Map<String, dynamic> headers = const {},
    String data = '',
  }) async {
    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: baseUrl,
          method: method,
        ),
      ).request(
        path,
        data: data,
      );
      return (response, null);
    } on DioException catch (e, st) {
      return (
        null,
        ErrorResponse(
          message: e.message ?? 'Unknown DioException',
          stackTrace: st.toString(),
        )
      );
    } catch (e, st) {
      return (
        null,
        ErrorResponse(
          message: e.toString(),
          stackTrace: st.toString(),
        )
      );
    }
  }
}

class ErrorResponse extends Equatable {
  final String message;
  final String? stackTrace;
  const ErrorResponse({
    required this.message,
    this.stackTrace,
  });

  @override
  List<Object?> get props => [message];
}

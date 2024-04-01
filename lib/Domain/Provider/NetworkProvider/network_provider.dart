import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flow_er/Domain/Node/node_functions.dart';
import 'package:flow_er/Domain/Provider/NetworkProvider/network_state.dart';
import 'package:flow_er/Utils/Router/router.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final networkProvider =
    NotifierProvider<NetworkNotifier, NetworkState>(() => NetworkNotifier());

class NetworkNotifier extends Notifier<NetworkState> {
  @override
  NetworkState build() {
    return const NetworkState(
      dataNode: null,
      baseUrl: '',
      path: '',
    );
  }

  Future<void> call({
    required String baseUrl,
    required String path,
    required String method,
    Map<String, dynamic> headers = const {},
    String data = '',
  }) async {
    try {
      if (data.isEmpty) {
        state = NetworkState(
          dataNode: null,
          baseUrl: baseUrl,
          path: path,
          progress: Progress.loading,
        );
      } else {
        state = NetworkState(
          dataNode: null,
          baseUrl: baseUrl,
          path: path,
          data: jsonDecode(data),
          progress: Progress.loading,
        );
      }

      final response = await Dio(
        BaseOptions(
          baseUrl: baseUrl,
          method: method,
        ),
      )
          .request(
        path,
        data: data,
      )
          .onError((error, stackTrace) async {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text('There was an Error'),
            backgroundColor: Colors.red,
          ),
        );
        return Response(
          requestOptions: RequestOptions(),
          data: {"error": "$error"},
        );
      });

      final castState = state;
      state = castState.copyWith(
        dataNode: parseToDataNode(response.data),
        progress: Progress.loaded,
      );
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('$e'),
          backgroundColor: Colors.red,
        ),
      );
      final castState = state;
      state = castState.copyWith(
        progress: Progress.error,
      );
    }
  }
}

Future<Map<String, dynamic>> call(String path) async {
  const baseUrl = 'https://pokeapi.co/api/v2/';

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );

  final repsonse = await dio.get(path);
  return repsonse.data;
}

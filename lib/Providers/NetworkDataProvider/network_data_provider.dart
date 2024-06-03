import 'package:flow_er/Providers/NetworkDataProvider/network_data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkDataNotifier extends Notifier<NetworkDataState> {
  @override
  NetworkDataState build() {
    return const NetworkDataState();
  }
}

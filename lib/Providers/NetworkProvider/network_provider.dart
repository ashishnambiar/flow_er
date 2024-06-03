import 'package:flow_er/Providers/NetworkProvider/network_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkProvider extends Notifier<NetworkState> {
  @override
  NetworkState build() {
    return const NetworkInitialState();
  }
}

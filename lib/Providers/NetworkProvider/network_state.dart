import 'package:equatable/equatable.dart';

sealed class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object?> get props => [];
}

final class NetworkInitialState extends NetworkState {
  const NetworkInitialState();
}

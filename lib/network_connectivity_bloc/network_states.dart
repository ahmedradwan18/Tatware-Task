import 'package:equatable/equatable.dart';

class NetworkStates extends Equatable {
  final bool isConnected;

  const NetworkStates({
    this.isConnected = true,
  });

  NetworkStates copyWith({
    bool? isConnected,
  }) {
    return NetworkStates(
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object?> get props => [
        isConnected,
      ];
}

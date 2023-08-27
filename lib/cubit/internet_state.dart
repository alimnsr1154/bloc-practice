part of 'internet_cubit.dart';

enum Connection{Wifi,Mobile}

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {
  @override
  String toString() {
    return 'InternetLoading{}';
  }
}

class InternetConnected extends InternetState {
  late final Connection connectiontype;

  InternetConnected({required this.connectiontype});
}

class InternetDisconnected extends InternetState {

}


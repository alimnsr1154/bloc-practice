import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  Stream<ConnectivityResult> get connectivityStream =>
      connectivity.onConnectivityChanged;

  InternetCubit({required this.connectivity}) : super(InternetLoading())
  {
    connectivityStreamSubscription  = connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.wifi)
        {
          emitInternetConnected(Connection.Wifi);
        }
      else if(event == ConnectivityResult.mobile)
        {
          emitInternetConnected(Connection.Mobile);
        }
      else if(event == ConnectivityResult.none)
        {
          emitInternetDisconnected();
        }
    });
  }

  void emitInternetConnected(Connection val) => emit(InternetConnected(connectiontype: val));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

}

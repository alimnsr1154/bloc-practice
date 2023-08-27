import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit()
      : super(
    SettingState(
      appNotifications: false,
      emailNotifications: false,
    ),
  );

  void toggleAppNotifications(bool newValue) {
    emit(state.copyWith(appNotifications: newValue));
  }

  void toggleEmailNotifications(bool newValue) =>
      emit(state.copyWith(emailNotifications: newValue));

}
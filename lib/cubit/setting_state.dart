part of 'setting_cubit.dart';

class SettingState extends Equatable {
  late  bool appNotifications;
  late  bool emailNotifications;

  SettingState({
   required this.appNotifications,
   required this.emailNotifications,
  });

  SettingState copyWith({
    bool? appNotifications,
    bool? emailNotifications,
  }) {
    return SettingState(
      appNotifications: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  @override
  List<Object> get props => [
    emailNotifications,
    appNotifications,
  ];

  @override
  String toString() {
    return 'SettingState{appNotifications: $appNotifications, emailNotifications: $emailNotifications}';
  }
}
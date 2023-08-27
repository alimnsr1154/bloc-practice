import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_project/cubit/setting_cubit.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: const Text('Settings',),
      ),
      body: BlocListener<SettingCubit, SettingState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
            duration: const Duration(milliseconds: 700),
            content: Text(
              'App ${state.appNotifications.toString().toUpperCase()}, Email ${state.emailNotifications.toString().toUpperCase()}',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
        },
        child: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            return Column(
              children: [
                SwitchListTile(
                  value: state.appNotifications,
                  onChanged: (newValue) {
                    context.read<SettingCubit>().toggleAppNotifications(newValue);
                  },
                  title: const Text('App Notifications'),
                ),
                SwitchListTile(
                  value: state.emailNotifications,
                  onChanged: (newValue) {
                    context
                        .read<SettingCubit>()
                        .toggleEmailNotifications(newValue);
                  },
                  title: const Text('Email Notifications'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
import 'package:bloc_project/cubit/counter_cubit.dart';
import 'package:bloc_project/cubit/internet_cubit.dart';
import 'package:bloc_project/cubit/setting_cubit.dart';
import 'package:bloc_project/presentation/Screens/Second_screen.dart';
import 'package:bloc_project/presentation/Screens/Setting_screen.dart';
import 'package:bloc_project/presentation/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'cubit/utility/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  Bloc.observer = AppBlocObserver();
  runApp(MyApp(conectivity: Connectivity()));
}

class MyApp extends StatelessWidget {
  late final Connectivity conectivity;
   MyApp({super.key,required this.conectivity});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: conectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<SettingCubit>(
          create: (counterCubitContext) => SettingCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) =>
              HomeScreen(
                  title: 'Home Page',
                  color: Colors.blue
              ),
          '/second': (context) =>
              Second_screen(
                  title: 'Second Page',
                  color: Colors.red
              ),
          '/settings': (context) =>
              SettingScreen(),
        },
      ),
    );
  }
}


import 'package:bloc_project/cubit/counter_cubit.dart';
import 'package:bloc_project/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title,required this.color});


  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => Navigator.pushNamed(context, '/settings')),
          ],
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected) {
                    return Text(
                      state.connectiontype == Connection.Wifi
                          ? 'WIFI'
                          : 'Mobile',
                      style: TextStyle(
                        color: state.connectiontype == Connection.Wifi
                            ? Colors.green
                            : Colors.grey,
                        fontSize: 30.0,
                      ),
                    );
                  } else if (state is InternetDisconnected) {
                    return Text(
                      'Disconnected',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  final snackBar = SnackBar(
                    content: Text(
                      state.isincrement
                          ? 'Value is Incremented by 1'
                          : 'Value is Decremented by 1',
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(milliseconds: 500),
                    backgroundColor: state.isincrement ? widget.color : Colors.red,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                builder: (context, state) {
                  return Text(
                    state.countervalue.toString(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Builder(builder: (context) {
                final counterState = context.watch<CounterCubit>().state;
                final internetState = context.watch<InternetCubit>().state;

                String internetStatus = 'Disconnected';
                if (internetState is InternetConnected) {
                  internetStatus = internetState.connectiontype == Connection.Wifi ? 'WIFI' : 'Mobile';
                }

                return Text(
                  'Counter: ${counterState.countervalue.toString()}  Internet: $internetStatus',
                  style: Theme.of(context).textTheme.headlineSmall,
                );
              }),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    key: Key('DecrementButton'),
                    heroTag: 'DecrementButton',

                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    key: Key('IncrementButton'),
                    heroTag: 'IncrementButton',
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  // This trailing comma makes auto-formatting nicer for build methods.
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              MaterialButton(
                color: Colors.green,
                child: Text('Second Screen',style: TextStyle(color: Colors.white),),
                onPressed: (){
                Navigator.of(context).pushNamed('/second');
              },),
            ],
          ),
        ),
      );
  }
}

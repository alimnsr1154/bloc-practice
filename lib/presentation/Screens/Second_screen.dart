import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_project/cubit/counter_cubit.dart';
class Second_screen extends StatefulWidget {
  const Second_screen({super.key, required this.title,required this.color});


  final String title;
  final Color color;

  @override
  State<Second_screen> createState() => _Second_screenState();
}

class _Second_screenState extends State<Second_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if(state.isincrement == true)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Value is Incremented by 1',textAlign: TextAlign.center,),
                      duration: Duration(milliseconds: 500),
                      backgroundColor:  widget.color,
                    ),
                  );
                }
                else
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Value is Decremented by 1',textAlign: TextAlign.center,),
                      duration: Duration(milliseconds: 500),
                      backgroundColor:  widget.color,
                    ),
                  );
                }
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
          ],
        ),
      ),
    );
  }
}

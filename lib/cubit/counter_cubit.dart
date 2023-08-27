import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_state.dart';


class CounterCubit extends Cubit<CounterState> with HydratedMixin{
  CounterCubit() : super(CounterState(countervalue: 0,isincrement : true));

  void increment() => emit(CounterState(countervalue: state.countervalue + 1,isincrement : true));

  void decrement() => emit(CounterState(countervalue: state.countervalue - 1,isincrement : false));

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    return state.toMap();
  }
}

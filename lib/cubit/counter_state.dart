part of 'counter_cubit.dart';


class CounterState {

  late int countervalue;
  late bool isincrement;

  CounterState({
    required this.countervalue,required this.isincrement
});


  Map<String, dynamic> toMap() {
    return {
      'countervalue': countervalue,
      'isincrement': isincrement,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return CounterState(
        countervalue: 0,
        isincrement: false,
      );
    };
    return CounterState(
      countervalue: map['countervalue'],
      isincrement: map['isincrement'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CounterState{countervalue: $countervalue, isincrement: $isincrement}';
  }
}

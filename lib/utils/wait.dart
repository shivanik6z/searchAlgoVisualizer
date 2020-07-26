import 'dart:ui';

Future sleepSum(int valueOne, int valueTwo)
{
  return Future.delayed(
    const Duration(seconds:1),
      ()=> valueOne+ valueTwo);
}
Future wait({double speed =0.5})
{
  final milliseconds = lerpDouble(2000000, 10, speed).toInt();
  //20000 100 se change kra hai ye lmao
  //lerpdouble used to calculate mid data
  return Future.delayed(Duration(microseconds: milliseconds));
}
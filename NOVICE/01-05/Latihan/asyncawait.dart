import 'dart:async';
import 'dart:math';

class Employee {
  int id;
  String firstName, lastName;

  Employee(this.id, this.firstName, this.lastName);
}

Future<String> firstAsync() async {
  await Future<String>.delayed(const Duration(seconds: 2));
  return "First";
}

Future<String> secondAsync() async {
  await Future<String>.delayed(const Duration(seconds: 2));
  return "Second";
}

Future<String> thirdAsync() async {
  await Future<String>.delayed(const Duration(seconds: 2));
  return "Third";
}

Future<Employee> getEmployee(int id) async {
  await Future<Employee>.delayed(const Duration(seconds: 2));

  var e = new Employee(id, "Cahyo", "Arif Andiyarto");

  return e;
}

Future<bool> isPrimeNumber(int number) async {
  if (number == 1) return false;
  if (number == 2) return true;

  double mysqry = sqrt(number);
  int limit = mysqry.ceil();

  for (int i = 2; i <= limit; ++i) {
    if (number % i == 0) return false;
  }

  return true;
}

Future<int> getRanbomNumber() async {
  var random = new Random();
  return random.nextInt(100);
}

findSmallNumber(List<int> lst) {
  print("all numbers are in:");
  lst.forEach((l) => print(l));
  lst.sort();
  int largest = lst.first;
  print("The smallest random # we generated was: ${largest}");
}

main() async {
  print("Get employe..");
  var x = await getEmployee(33);
  print("Got back ${x.firstName} ${x.lastName} with id ${x.id}");

  var f = await firstAsync();
  print(f);
  var s = await secondAsync();
  print(s);
  var t = await thirdAsync();
  print(t);
  print('done..');

  await Future.forEach([1,2,3,4,5,6,7,8,9,10], (int n) => 
  isPrimeNumber(n)
  .then((x) => print("${n}${x ? " is" : " is not"} a prime number")));

  print('done!');

  Future.wait([getRanbomNumber(), getRanbomNumber(), getRanbomNumber()])
    .then((List<int> results) => findSmallNumber(results));
}

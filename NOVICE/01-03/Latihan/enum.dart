main() {
  Dog d = new Dog('Doggyy', 1, CurrentState.walk);
  print(d.state == CurrentState.walk);
}

enum CurrentState {
  sleep,
  walk,
  eat
}

class Dog {
  String name;
  int age;
  CurrentState state;

  Dog(this.name, this.age, this.state);

  static guguk() {
    print('Guguk guguk');
  }
}
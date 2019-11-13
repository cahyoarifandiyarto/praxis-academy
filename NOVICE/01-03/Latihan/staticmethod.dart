main() {
  Dog.guguk();
}

class Dog {
  String name;
  int age;

  Dog(this.name, this.age);

  static guguk() {
    print('gukguk');
  }
}
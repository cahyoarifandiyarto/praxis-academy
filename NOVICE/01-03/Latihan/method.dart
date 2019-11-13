main() {
  Pug p = new Pug.small('Guguk pinter');
  p.guguk();
}

class Dog {
  String name;
  int age;

  Dog(this.name, this.age);

  Dog.newDog() {
    name = 'Doggyyy';
    age = 2;
  }

  guguk() {
    print('Guk Gukkkk');
  }
}

class Pug extends Dog {
  Pug(String name, int age): super(name, age);

  Pug.small(String name): this(name, 1);
  Pug.large(String name): this(name, 2);

  @override
  guguk() {
    print('meowmeowwwww');
  }
}
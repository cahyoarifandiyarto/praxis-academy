main() {
  Pug p = new Pug.small('Levi');
      p = new Pug.large('Levi Gede');
  print(p.name);
  print(p.age);
}

class Dog {
  String name;
  int age;

  Dog(this.name, this.age);

  Dog.newDog() {
    name = 'Guguk';
    age = 1;
  }
}

class Pug extends Dog {
  Pug(String name, int age): super(name, age);
  Pug.small(String name): this(name, 1);
  Pug.large(String name): this(name, 3);
}
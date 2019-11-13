main() {
  Dog d = new Dog('Doggyyy', 2);
  d.dogName = 'Duffy';
  print(d.dogName);
}

class Dog {
  String name;
  int age;

  Dog(this.name, this.age);

  String get dogName {
    return '$name';
  }

  set dogName(String newName) {
    name = newName;
  }

  Dog.newDog() {
    name = 'Guguk';
    age = 1;
  }

  hukhuk() {
    print('huk hukk');
  }
}
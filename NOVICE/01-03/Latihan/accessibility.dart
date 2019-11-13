main() {
  Dog d = new Dog('Duffy', 4);
  print(d._name);
}

class Dog {
  String _name;
  int age;

  Dog(this._name, this.age);

  String get dogName {
    return '$_name';
  }

  set dogName(String newName) {
    _name = newName;
  }

  Dog.newDog() {
    _name = 'Guguk';
    age = 2;
  }

  gukguk() {
    print('guguk');
  }

  _hiddenMethod() {
    print('I can only be called internally');
  }
}

abstract class AbstractDog {
  void gukguk();
  void _hiddenMethod();
}
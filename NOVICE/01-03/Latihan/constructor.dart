main() {
  Employee employee = new Employee.newEmployee();
  print("${employee.name} ${employee.age}");
}

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Employee.newEmployee() {
    name = 'Cahyo';
    age = 18;
  }
}
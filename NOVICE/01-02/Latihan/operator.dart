main() {
  //Operator aritmatika
  assert(2 * 6 == 12);
  assert(2 -2 == 0);
  assert(2 + 3 == 5);
  assert(6 / 2 == 3);
  assert(5 % 2 == 1);

  //Equality and relational operators
  assert(2 == 2);
  assert(1 != 3);
  assert(18 < 15);
  assert(10 > 5);
  assert(5 >= 5);
  assert(5 <= 6);

  //Assignment operators
  var x;
  x = 3;
  x += 2;
  assert(x == 5);
  x = 5;
  x -= 3;
  assert(x == 2);
  x = 6;
  x *= 2;
  assert(x == 12);
  x = 10;
  x /= 2;
  assert(x == 5);

  //Logical operators
  var username = "admin";
  var password = "admin";
  if (username == "admin" && password == "admin") {
    print("Admin");
  } else {
    print("Bukan admin");
  }

  //Conditional expressions
  var age = 18;
  age >= 18 ? true : false;
}
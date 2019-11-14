class GenericClass<T> {
  T ob;

  GenericClass(this.ob);

  T getob() {
    return ob;
  }

  showType() {
    print("Type of T is " + T.toString());
  }
}

main() {
  GenericClass<int> iOb = new GenericClass<int>(88);
  iOb.showType();

  int v = iOb.getob();
  print("value: " + v.toString());

  GenericClass<String> strOb = new GenericClass<String>("Generic Test");
  strOb.showType();

  String str = strOb.getob();
  print("value: " + str);
}
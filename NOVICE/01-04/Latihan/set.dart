main() {
  var halogens = {'flourine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names = <String>{};
  print(names);
  names.add("Cahyo");
  names.addAll(halogens);
  print(names);
}
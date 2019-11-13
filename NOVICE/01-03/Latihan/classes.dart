class Biodata {
  String name, address;
  int age;

  Biodata(this.name, this.address, this.age);
}

void main() {
  Biodata bio = new Biodata('Cahyo', 'Sleman', 18);
  print("${bio.name} ${bio.address} ${bio.age}");
}
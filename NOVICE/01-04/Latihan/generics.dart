class Location<E> {
  E lat, lng;

  Location(this.lat, this.lng);

  toString() => "Have you been to ${lat}, ${lng}";
}

void main() {
  var location1 = new Location<double>(21.213123, -157.12315);
  print(location1);

  var location2 = new Location<String>('21.4123124', '-152.1241245');
  print(location2);

  var location3 = new Location<int>(21, -157);
  print(location3);
}
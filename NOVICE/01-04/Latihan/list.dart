main() {
  var buahBuahan = ["Apel", "Mangga", "Semangka", "Jeruk"];
  var newBuah = ["Alpukat", ...buahBuahan];

  for(var i = 0; i < buahBuahan.length; i++) {
    print(buahBuahan[i]);
  }

  print(buahBuahan.length);
  print(buahBuahan[0]);
  print(newBuah);
}
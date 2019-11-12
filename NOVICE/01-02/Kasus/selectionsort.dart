main() {
  var a = [6,2,3,1,9];

  for (int i = 0; i < a.length - 2; i++) {
    var indexMin;
    indexMin = i;

    for (int j = i + 1; j < a.length - 1; j++) {
      if (a[j] < a[indexMin]) {
        indexMin = j;
      }
    }
    
    if (indexMin != i) {
      var temp;
      temp = a[i];
      a[i] = a[indexMin];
      a[indexMin] = temp;
    }
  }
  print(a);
}
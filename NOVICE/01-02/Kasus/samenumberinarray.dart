main() {
  var arrayA = [1,4,2,6,7];
  var arrayB = [1,4,2,6,7];
  
  findMatch(a, b) {
    for (var i = 0; i < a.length; i++) {
      for (var j = 0; j < b.length; j++) {
        if (a[i] == b[j]) {
          return true;
        }
        return false;
      }
    }
  }

  print(findMatch(arrayA, arrayB));
}
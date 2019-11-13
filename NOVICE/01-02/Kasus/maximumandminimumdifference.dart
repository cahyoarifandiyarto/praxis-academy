main() {
  var myArr = [1,2,1,5,3,4];
  
  maxDifference(a) {
    var maxDiff, min;
    maxDiff = a[1] - a[0];
    min = a[0];

    for (var i = 1; i < a.length; i++) {
      if (a[i] - min > maxDiff) {
        maxDiff = a[i] - min;
      }
      if (a[i] < min) {
        min = a[i];
      }
    }
    // print(maxDiff);
    // print(min);
    print("$maxDiff $min");
  }

  maxDifference(myArr);
}
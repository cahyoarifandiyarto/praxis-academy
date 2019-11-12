main() {
  var myArr = [2,4,5,6,5];
  
  minMax(a) {
    var min,max;
    min = a[0];
    max = a[0];
    for (var i = 1; i < a.length -1; i++) {
      if (a[i] < min) {
        min = a[i];
      }
      if (a[i] > max) {
        max = a[i];
      }
    }
    print("$min $max");
  }

  minMax(myArr);
}
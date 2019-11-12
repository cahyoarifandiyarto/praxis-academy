main() {
  var myArr = [1,6,2,7,8];
  for (var i = 1; i < myArr.length -1; i++) {
    var key,j;
    key = myArr[i];
    j = i;
    
    while (j > 0 && myArr[j - 1] > key) {
      myArr[j] = myArr[j - 1];
      j = j - 1;
    }
    myArr[j] = key;
  }
  print(myArr);
}
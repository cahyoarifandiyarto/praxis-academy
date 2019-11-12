main() {
  //If else
  var nilai = 20;
  if (nilai % 2 == 0) {
    print("Bilangan Genap");
  } else {
    print("Bilangan Ganjil");
  }

  //For loop
  for (var i = 1; i <= 20; i++) {
    if (i % 2 == 0) {
      print("Nilai $i adalah Bilangan Genap");
    } else {
      print("Nilai $i adalah Bilangan Ganjil");
    }
  }

  //While
  var x = 10;
  while(x > 5) {
    print("Loopppppp");
  }

  //Do while
  do {
    print("Dooo While Loopingg");
  } while (false);

  //Switch Case
  switch (50) {
    case 100:
      print('Nilai sempurna / A');
      break;
    case 70:
      print('Nilai baik / B');
      break;
    case 60:
      print('Nilai lumayan / C');
      break;
    case 50:
      print('Belajar lagii...');
      break;
    default:
      print('Belajar terussss yaaa...');
  }
}
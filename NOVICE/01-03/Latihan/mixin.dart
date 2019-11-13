main() {
  Musician m = new Musician();
  m.showTime();
}

class Performer {
  perform() {
    print('perform...');
  }
}

mixin Dancer {
  performing() {
    print('Dance.. Dance..');
  }
}

mixin Singer {
  perform() {
    print('lalalalalala...');
  }
}

class Musician extends Performer with Dancer, Singer {
  showTime() {
    performing();
    perform();
  }
}
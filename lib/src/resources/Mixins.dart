abstract class AirborneInsect extends Insect with Fluttering {
  void buzz() {
    print("Buzzing");
  }
}

abstract class Bird with Fluttering {
  void chirp() {
    print("chirping");
  }
}

mixin Biting {
  void bite() {
    print("bitting");
  }
}

mixin Fluttering {
  void flutter() {
    print('fluttering');
  }
}

abstract class Insect {
  void crawl() {
    print("Crawling");
  }
}

class Mosquito extends AirborneInsect {
  void make() {
    crawl();
    flutter();
    buzz();
    print("bye");
  }
}

class Swallow extends Bird{
  void dowSallowThing(){
    chirp();
    flutter();
    print("eating a mosquito");
  }
}

void main(){
  Swallow();
}
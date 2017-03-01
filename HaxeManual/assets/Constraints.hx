typedef Mensuravel= {
  public var length(default, null):Int; 
} //length = tamanho, extensão

class Main {
  static public function main() {
    trace(teste([]));
    trace(teste(["bar", "foo"]));
    // String should be Iterable<String>
    //teste("foo");
  }

  static function teste<T:(Iterable<String>, Mensuravel)>(a:T) {
    if (a.length == 0) return "empty";
    return a.iterator().next();
  }
}

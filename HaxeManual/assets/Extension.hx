//Iterável com Comprimento 
typedef IterableWithLength<T> = {
  > Iterable<T>,
  // propriedade length (comprimento) apenas de leiturra
  var length(default, null):Int;
}

class Main {
  static public function main() {
    var array = [1, 2, 3];
    var t:IterableWithLength<Int> = array;
  }
}

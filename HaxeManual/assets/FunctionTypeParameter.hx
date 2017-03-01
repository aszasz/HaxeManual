class Main {
  static public function main() {
    equivale(1, 1);
    // messagem em runtime: bar deveria ser foo
    equivale("foo", "bar");
    // erro de compilação: String should be Int (String deveria ser Int)
    equivale(1, "foo");
  }

  static function equivale<T>(esperado:T, encontrado:T) {
    if (encontrado != esperado) {
      trace('$encontrado deveria ser  $esperado');
    }
  }
}

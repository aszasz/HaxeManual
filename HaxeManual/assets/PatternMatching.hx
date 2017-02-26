enum Tree<T> {
    Leaf(v:T);
    Node(l:Tree<T>, r:Tree<T>);
}

class Main {
  static public function main() {
    var myTree = Node(Leaf("foo"), Node(Leaf("bar"), Leaf("foobar")));
    // myTree é um nó (uma possibilidade para árvore)
    // (nós contém duas árvores)
    // a árvore esquerda é uma folha (v="foo"):
    // a árvore direita é um nó (que contém duas árvores):
    //   a árvore esquerda (da árvore direita) é uma folha (v="bar")
    //   e árvore direita (da árvore direita) também é uma folha (v="foobar")
    
    var match = switch(myTree) {
        case Leaf(_): "0"; // corresponde a qualquer nó 
                           //que seja apenas uma folha
        case Node(_, Leaf(_)): "1"  // corresponde a qualquer nó
                                    //que tenha uma folha na direita
        case Node(_, Node(Leaf("bar"), _)): "2"; // corresponde
                                   // a qualquer nó que tenha um nó na direita
                                   // onde a árvore esquerda seja uma folha com                               // v="bar"
        case _: "3"; // corresponde a qualquer coisa
    }
    trace(match); // 2

    var myTree = Node(Leaf("foo"), Node(Leaf("bar"), Leaf("foobar")));
    var name = switch(myTree) {
      case Leaf(s): s;
      case Node(Leaf(s), _): s;
      case _: "none";
    }
    trace(name); // foo

    var node = switch(myTree) {
      case Node(leafNode = Leaf("foo"), _): leafNode;
      case x: x;
    }
    trace(node); // Leaf(foo)

    var myStructure = {
      name: "haxe",
      rating: "awesome"
    };
    var value = switch(myStructure) {
      case { name: "haxe", rating: "poor" }:
        throw false;
      case { rating: "awesome", name: n }:
        n;
      case _:
        "no awesome language found";
    }
    trace(value); // haxe

    var myArray = [1, 6];
    var match = switch(myArray) {
      case [2, _]: "0";
      case [_, 6]: "1";
      case []: "2";
      case [_, _, _]: "3";
      case _: "4";
    }
    trace(match); // 1


    var match = switch(7) {
      case 4 | 1: "0";
      case 6 | 7: "1";
      case _: "2";
    }
    trace(match); // 1


    var myArray = [7, 6];
    var s = switch(myArray) {
      case [a, b] if (b > a):
        b + ">" +a;
      case [a, b]:
        b + "<=" +a;
      case _: "found something else";
    }
    trace(s); // 6<=7


    var s = switch [1, false, "foo"] {
      case [1, false, "bar"]: "0";
      case [_, true, _]: "1";
      case [_, false, _]: "2";
    }
    trace(s); // 2
  }
}

void main() {
  List<int> fiboList = [];

  int a = 0;
  int b = 1;

  while (a < 30) {
    fiboList.add(a);
    int next = a + b;
    a = b;
    b = next;
  }
  print("Eredeti fiboList: $fiboList");

  // 1. 
  print("Hossz: ${fiboList.length}");

  // 2. 
  print("Első elem: ${fiboList.first}");

  // 3.
  print("Utolsó elem: ${fiboList.last}");

  // 4. 
  print("3-as indexű elem: ${fiboList[3]}");

  // 5. 
  print("A 8 érték indexe: ${fiboList.indexOf(8)}");

  // 6.
  print("Fordított sorrend: ${fiboList.reversed.toList()}");

  // 7. 
  print("Nem üres-e: ${fiboList.isNotEmpty}");

  // 8.
  fiboList.clear();
  print("Törlés után üres-e: ${fiboList.isEmpty}");

  // 9. 
  fiboList.add(34);
  print("34 hozzáadva: $fiboList");

  // 10. 
  fiboList.addAll([1, 2, 3, 5, 7]);
  print("Tömb hozzáadva: $fiboList");

  // 11.
  int index34 = fiboList.indexOf(34);
  fiboList.insertAll(index34 + 1, [0, 1]);
  print("Beszúrás 34 után: $fiboList");


  // 12.
  fiboList.removeLast();
  fiboList.addAll([8, 13, 21]);

  print("Az utolso elem cserelve: $fiboList");


  // 13. 
  fiboList.removeAt(0);
  print("Első elem törölve: $fiboList");

  //5. Hozd létre a fiboSquare listát a fiboListből, úgy, hogy az értékei a FiboList négyzetei legyenek!

  List<int> fiboSquare = fiboList.map((e) => e * e).toList();

  print("A negyzetre emelt fiboList: $fiboSquare");

  List<int> allFibo = [
    ...fiboList.where((e) => e is int && e % 2 == 1),
    ...fiboSquare.where((e) => e % 2 == 1),
  ];

  allFibo.sort((a, b) => b.compareTo(a));

  print("allFibo (páratlan elemek csökkenő sorrendben): $allFibo");
}

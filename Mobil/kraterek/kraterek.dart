import "dart:io";
import "dart:math";

import "../flutter/packages/flutter/lib/widgets.dart";

void main() {
  File file = File('felszin_tpont.txt');
  List<Map<String, Object>> kraterek = [];
  List<String> filetartalom = file.readAsLinesSync();
  for (var sor in filetartalom) {
    List<String> adat = sor.trim().split('\t');
    kraterek.add({
      'x': double.tryParse(adat[0])!,
      'y': double.tryParse(adat[1])!,
      'r': double.tryParse(adat[2])!,
      'nev': adat[3],
    });
  }

  print(kraterek.toString());

  print("2. feladat");
  print("A kráterek száma: ${kraterek.length}");

  print("3. feladat");
  String nev = stdin.readLineSync()!;
  String kiirando = 'Nincs ilyen nevű kráter.';
  for (var krater in kraterek) {
    if (nev == krater['nev']) {
      kiirando =
          'A(z) ${krater['nev']} középpontja x=${krater['x']} y=${krater['y']} sugarar=${krater['r']}';
      break;
    }
  }

  print("4. feladat");
  Map<String, Object> legnagyobb = kraterek[0];
  for (var krater in kraterek) {
    if ((legnagyobb['r'] as double) < (krater['r'] as double)) {
      legnagyobb == krater;
    }
  }
  print(
    'A legnagyobb kráter neve és sugara: ${legnagyobb['nev']} ${legnagyobb['r']}',
  );

  print("5. feladat");
  double tavolsag(double x1, double y1, double x2, double y2) =>
      sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));

  print("6. feladat");
  nev = stdin.readLineSync()!;
  Map<String, Object> megadott = {};
  for (var krater in kraterek) {
    if (nev == krater['nev']) {
      megadott = krater;
      break;
    }
  }
  stdout.write('Nincs közös része!');

  List<String> nemKozos = [];
  for (var krater in kraterek) {
    if(tavolsag(x1,x2,y1,y2)) {
      nemKozos.add(krater['nev'] as String);
    }
  }

  for (var krater in kraterek) {
    nemKozos.add(krater['nev'] as String);
  }

  print('${nemKozos.join(', ')}.');

  print("feladat 7");

  
}
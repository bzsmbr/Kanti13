import 'dart:io';

void main() {
  int number = 0;

  do {
    stdout.write("Adjon meg egy számot 3 és 9 között: ");
    number = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  } while (number < 3 || number > 9);

  int i = 0;
  while (i <= 10) {
    if (i == number) {
      break;
    }

    int j = 0;
    while (j <= 10) {
      if (j == number) {
        break; 
      }

      print('i: $i, j: $j');
      j++;
    }

    i++;
  }
}

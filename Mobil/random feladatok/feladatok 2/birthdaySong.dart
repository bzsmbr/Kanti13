import "dart:io";

void main() {
    String text = '''
          Happy birthday!
          Happy birthday to you!
          ''';
    int number = 0;

    do {
        print("Adjon meg egy számot 1 és 100 között:");
        number = int.parse(stdin.readLineSync()!);
    } while (number < 1 || number > 100);

    for (int i = 1; i <= number; i++) {
        print(text);
    }
}
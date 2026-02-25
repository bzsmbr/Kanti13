void main() {
  print(headTail("alma")); // "maal"
  print(headTail("ablak")); // "aklab"

  print(evenFizz(4)); // "Even"
  print(evenFizz(9)); // "Fizz"
  print(evenFizz(12)); // "EvenFizz"
  print(evenFizz(17)); // "17"

  print(likeFibo(0)); // []
  print(likeFibo(1)); // [0]
  print(likeFibo(2)); // [0, 1]
  print(likeFibo(3)); // [0, 1, 1]
  print(likeFibo(10)); // [0, 1, 1, 1, 2, 3, 4, 6, 9, 13]

  print(vowelLower("alma")); // "aLMa"
  print(vowelLower("ablak")); // "aBLaK"
}

String headTail(String txt) {
  int mid = (txt.length / 2).floor();
  String first = txt.substring(0, mid);
  String second = txt.substring(mid);
  return second + first;
}

String evenFizz(int number) {
  bool divisibleBy2 = number % 2 == 0;
  bool divisibleBy3 = number % 3 == 0;

  if (divisibleBy2 && divisibleBy3) return "EvenFizz";
  if (divisibleBy2) return "Even";
  if (divisibleBy3) return "Fizz";
  return number.toString();
}

List<int> likeFibo(int number) {
  List<int> result = [];
  for (int i = 0; i < number; i++) {
    if (i == 0) {
      result.add(0);
    } else if (i == 1 || i == 2) {
      result.add(1);
    } else {
      result.add(result[i - 1] + result[i - 3]);
    }
  }
  return result;
}

String vowelLower(String txt) {
  String vowels = "aeiouAEIOU";
  String result = "";
  for (int i = 0; i < txt.length; i++) {
    String ch = txt[i];
    if (vowels.contains(ch)) {
      result += ch.toLowerCase();
    } else {
      result += ch.toUpperCase();
    }
  }
  return result;
}

void main() {
  print(headTail("alma")); // maal
  print(headTail("ablak")); // aklab

  print(evenFizz(4)); // Even
  print(evenFizz(9)); // Fizz
  print(evenFizz(12)); // EvenFizz
  print(evenFizz(17)); // 17

  print(likeFibo(0)); // []
  print(likeFibo(1)); // [0]
  print(likeFibo(2)); // [0, 1]
  print(likeFibo(3)); // [0, 1, 1]
  print(likeFibo(10)); // [0, 1, 1, 1, 2, 3, 4, 6, 9, 13]

  print(vowelLower("alma")); // aLMa
  print(vowelLower("ablak")); // aBLaK
}

String headTail(String txt) {
  int mid = (txt.length / 2).floor();
  String first = txt.substring(0, mid);
  String second = txt.substring(mid);
  return second + first;
}

String evenFizz(int number) {
  if (number % 6 == 0) return "EvenFizz";
  if (number % 2 == 0) return "Even";
  if (number % 3 == 0) return "Fizz";
  return number.toString();
}

List<int> likeFibo(int number) {
  if (number == 0) return [];
  if (number == 1) return [0];
  if (number == 2) return [0, 1];
  List<int> res = [0, 1, 1];
  for (int i = 3; i < number; i++) {
    res.add(res[i - 1] + res[i - 3]);
  }
  return res;
}

String vowelLower(String txt) {
  final vowels = 'aeiouAEIOU';
  return txt
      .split('')
      .map((c) => vowels.contains(c) ? c.toLowerCase() : c.toUpperCase())
      .join('');
}

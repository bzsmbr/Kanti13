void main() {
  List<int> fizzBuzz = getFizzBuzz();
  print(fizzBuzz);

  List<String> oddEven = GetOddEven(fizzBuzz);
  print(oddEven);

  List<int> oddSet = GetOddSet(fizzBuzz);
  print(oddSet);

  Map<int, dynamic> fizzBuzzMap = getFizzBuzzMap(fizzBuzz);
  print(fizzBuzzMap);
}

List<int> getFizzBuzz() {
  List<int> result = [];

  for (int i = 0; i <= 100; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      result.add(i);
    }
  }

  return result;
}

List<String> GetOddEven(List<int> fizzBuzz) {
  List<String> result = [];
  for (int number in fizzBuzz) {
    result.add(number.isEven ? 'even' : 'odd');
  }

  return result;
}

List<int> GetOddSet(List<int> fizzBuzz) {
  List<int> odds = [];

  for (int i = 0; i < fizzBuzz.length; i++) {
    if (fizzBuzz[i] % 2 == 1) {
      odds.add(fizzBuzz[i]);
    }
  }

  return odds;
}

Map<int, List<dynamic>> getFizzBuzzMap(List<int> nums) {
  Map<int, List<dynamic>> result = {};

  for (int i = 1; i <= 100; i++) {
    if (nums.contains(i)) {
      result[i] = [i, getFizzBuzzString(i), i.isEven ? 'even' : 'odd'];
    } else {
      result[i] = [i, i.isEven ? 'Even' : 'Odd'];
    }
  }
  return result;
}

String getFizzBuzzString(int number) {
  String result = '';

  if (number % 3 == 0 || number % 5 == 0) {
    result = 'FizzBuzz';
  }
  if (number % 3 == 0) {
    result = 'Fizz';
  }
  if (number % 5 == 0) {
    result = 'Buzz';
  }
  return result;
}

void main() {
  String txt = 'almafa';
  print('A $txt megfordítottja: ${reverseString(txt)}');
  int numInt = 32415;
  print('A $numInt megfordítottja: ${reverseInteger(numInt)}');
  num number = 3.14159268385;
  print('A $number megfordítottja: ${reverseNumber(number)}');
  print('A $numInt számjegyei rendezve: ${sortNumbersAsc(numInt)}');
  print('A $number számjegyei rendezve: ${sortNumbersDes(number)}');
  print('A 6 számjegyei FizzBuzz megfelelője: ${fizzBuzz(6)}');
  print('A 10 számjegyei FizzBuzz megfelelője: ${fizzBuzz(10)}');
  print('A 15 számjegyei FizzBuzz megfelelője: ${fizzBuzz(15)}');
  print('A 8 számjegyei FizzBuzz megfelelője: ${fizzBuzz(8)}');
  print('Háromszög-e a 1, 2, 5 oldahossz: ${isTriangleBySides(1, 2, 5)}');
  print('Háromszög-e a 1, 5, 2 oldahossz: ${isTriangleBySides(1, 5, 2)}');
  print('Háromszög-e a 5, 1, 2 oldahossz: ${isTriangleBySides(5, 1, 2)}');
  print('Háromszög-e a 3, 4, 5 oldahossz: ${isTriangleBySides(3, 4, 5)}');
  print(
      'A 45, 90, 45 fokos szögeh rátomszöhet alkotnakl-e: ${isTriangleByAngles(45, 90, 45)}');
  print(
      'A 90, 90, 0 fokos szögeh rátomszöhet alkotnakl-e: ${isTriangleByAngles(90, 90, 0)}');
  print(
      'A 30, 90, 60 fokos szögeh rátomszöhet alkotnakl-e: ${isTriangleByAngles(30, 90, 60)}');
  print('A 0. padovan szám: ${padovanNumber(0)}');
  print('A 2. padovan szám: ${padovanNumber(2)}');
  print('A 4. padovan szám: ${padovanNumber(4)}');
  print('A 10. padovan szám: ${padovanNumber(10)}');
}

int padovanNumber(int integer) {
  List<int> padovans = [0, 1, 1];
  if (integer <= padovans.length) {
    return padovans[integer];
  }
  while (padovans.length <= integer) {
    padovans.add(padovans[padovans.length - 2] + padovans[padovans.length - 3]);
  }
  return padovans.last;
}

String triangleTypeByAngles(double a, double b, double c) {
  if (!isTriangleByAngles(a, b, c)) {
    return 'érvénytelen háromszög';
  }
  String result = "";
  if (a == b && b == c) {
    result = "egyenlő oldalú háromszög";
  }
  if (a == b && a != c || b == c && b != a || a == c && a != b) {
    result = "egyenlő szárú háromszög ";
  }
  if (a == 90 || b == 90 || c == 90) {
    result += 'derékszögű háromszög';
  }
  if (a > 90 || b > 90 || c > 90) {
    result = 'tompaszögű háromszög';
  }
  if (a < 90 && b < 90 && c < 90) {
    result = 'hegyesszögű háromszög';
  }
  return result;
}

bool isTriangleByAngles(double a, double b, double c) {
  if (a + b + c == 180 && a > 0 && b > 0 && c > 0) {
    return true;
  }
  return false;
}

bool isTriangleBySides(double a, double b, double c) {
  if (a + b > c && a + c > b && b + c > a) {
    return true;
  }
  return false;
}

String fizzBuzz(int integer) {
  String result = '';
  if (integer % 3 == 0) {
    result = 'Fizz';
  }
  if (integer % 5 == 0) {
    result += 'Buzz';
  }
  if (result == '') {
    result = '$integer';
  }
  return result;
}

int sortNumbersDes(num number) {
  List<String> strList = '$number'.replaceAll('.', '').split('');
  List<int> intList = strList.map((item) => int.parse(item)).toList();
  intList.sort((a, b) => b - a);
  String strNum = intList.map((item) => '$item').join();
  return int.parse(strNum);
}

int sortNumbersAsc(int integer) {
  List<String> strNums = '$integer'.split('');
  List<int> intNums = strNums.map((item) => int.parse(item)).toList();
  intNums.sort((a, b) => a - b);
  strNums = intNums.map((item) => '$item').toList();
  return int.parse(strNums.join());
}

num reverseNumber(num number) {
  num nummer = num.parse(reverseString('$number'));
  return nummer;
}

int reverseInteger(int integer) {
  int num = int.parse(reverseString('$integer'));
  return num;
}

String reverseString(String text) {
  return text.split('').reversed.join();
}
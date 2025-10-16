void main() {
  print("1tol 5ig terjedo szamok osszege ${gausSum(5)}");
  print("1tol 50ig terjedo szamok osszege ${gausSum(50)}");
  print("1tol 50ig terjedo szamok osszege ${gausSum2(50)}");
  print("1tol 5ig terjedo szamok osszege listaban ${gausList(5)}");
}

int gausSum(int num) {
  int sum = 0;
  for (int i = 1; i <= num; i++) {
    sum += i;
  }

  return sum;
}

int gausSum2(int num) => num * (num + 1) ~/ 2;

List<int> gausList(int number) {
  List<int> list = [1];
  for (int i = 2; i <= number; i++) {
    list.add(i + list.last);
  }

  return list;
}

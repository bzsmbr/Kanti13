void main() {
  int a = 0;
  int b = 1;

  while (a <= 100) {
    print(a);
    int next = a + b;
    a = b;
    b = next;
  }
}

//nev, iranyito, telepules, utca, hsz, atlag

//valtozok
void main() {
  String nev = "Pankix";
  int iranyito = 6791;
  String telepules = "Szeged";
  String utca = "Korom utca";
  int hazSzam = 1;
  double atlag = 4.535231231;

  print("A neve $nev.");
  print("A lakcime: $iranyito, $telepules, $utca $hazSzam.");
  print("$nev atlaga: ${atlag.toStringAsFixed(2)}");

  print("Irja be a nevet:");
  String? name  = stdin.readLineSync();
  print("A megadott nev: ${name}");
}
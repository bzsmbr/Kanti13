import 'dart:io';
//iskola nevet irasd ki
//iranyito, utca, hazszam, telepules
//iskola nev es cim kiiratas
void main() {
String iskolaNev = "Szegedi SZC Vasvári Pál Gazdasági és Informatikai Technikum";
int iranyito = 6724;
String utca = "Gutenberg utca";
String telepules = "Szeged";
int hazSzam = 11;

print("Az iskola neve: $iskolaNev");
print("Az iskola címe: $iranyito, $telepules, $utca, $hazSzam");


int atlagosLetszam = 28;
int osztalyokSzamaKilencedikben = 4;
int osztalyokSzamaKilencedikFelett = 3;

print("A 9. évfolyam létszama: ${atlagosLetszam*osztalyokSzamaKilencedikben}");
print("A 10., 11. és 12. évfolyam létszama: ${atlagosLetszam*osztalyokSzamaKilencedikFelett}");
}

void main() {
    String falvedo = '''
    baljos nap am
    vilagvéges
    jaj o naptar
    vilagfenyes
''';

   print(falvedo);
   
   print(falvedo.toLowerCase());

   print(falvedo.toUpperCase());

   print(falvedo.trim());

   print(falvedo.replaceAll(' ', '-'));
 
   if (falvedo.length >= 5) {
        print("...${falvedo.substring(4)}");
    }

    print(falvedo.substring(0, 3).runes.map((rune) => rune.toString()).join(" "));

    if (falvedo.length >= 10) {
      print("${falvedo.substring(9)} ...");
    }
}
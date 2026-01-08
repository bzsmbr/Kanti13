import 'dart:io';

void main() {
    File file = File('./kraterek/felszin_tpont.txt');
    List<Map<String, Object>> kraterek = [];
    List<String> filetartalom = file.readAsLinesSync();
    for(String sor in filetartalom){
        List<String> adat = sor.trim().split('\t');
        kraterek.add({
            'x': double.tryParse(adat[0])!,
            'y': double.tryParse(adat[1])!,
            'r': double.tryParse(adat[2])!,
            'nev': adat[3],
        });
    }
    
    print(kraterek.toString());

    print('Kraterek hossza: ${kraterek.length}');

    print('Kérem egy kráter nevét: ');
    String nev = stdin.readLineSync()!;
    String kiirando = 'nincs ilyen nevű kráter';
    for(var krater in kraterek){
        if(nev == krater['nev']){
            kiirando = 'A(z) ${krater['nev']} középpontja X=${krater['x']}  Y=${krater['y']}  sugara R=${krater['r']} . ';
            break;
        }
    }
    print(kiirando);

    
}
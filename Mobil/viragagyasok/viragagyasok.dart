import "dart:io";
import "dart:math";

void main() {
    File file = File('felajanlasok.txt');
    List<Map<String, Object>> viragok = [];
    List<String> filetartalom = file.readAsLinesSync();

    print("feladat 1.");
    print("A felajánlások száma: ${filetartalom.length}");

}

void main() {
    int intValue = 10;
    double doubleValue = 2.5;
    String strValue = "pankix";
    bool boolValue = true;

    double muvelet1 = intValue + doubleValue;
    double muvelet2 = intValue - doubleValue;
    double muvelet3 = intValue * doubleValue;
    double muvelet4 = intValue / doubleValue;
    double muvelet5 = intValue % doubleValue;
    

    print("Az $intValue + $doubleValue művelet eredménye: ${muvelet1.toInt()} ($muvelet1)");
    print("Az $intValue - $doubleValue művelet eredménye: ${muvelet2.toInt()} ($muvelet2)");
    print("Az $intValue * $doubleValue művelet eredménye: ${muvelet3.toInt()} ($muvelet3)");
    print("Az $intValue / $doubleValue művelet eredménye: ${muvelet4.toInt()} ($muvelet4)");
    print("Az $intValue / $doubleValue maradéka: ${muvelet5.toInt()} ($muvelet5)");

    print("${!boolValue}");
}
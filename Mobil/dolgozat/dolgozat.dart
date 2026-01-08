void main() {
    //1. feladat
    num sumOfArray = sum([1, -3, 2, 3, 4, -1]);
    print(sumOfArray); 

    //2. feladat
    List<int> oddOut = oddOnesOut([1, 2, 3, 1, 3, 3]);
    print(oddOut);

    //3. feladat
    List<num> flatten = flattenAndSort([[1, 3, 5], [100], [2, 4, 6]]);
    print(flatten);

    //4. feladat
    int dupes = duplicateCount("aabbcde");
    print(dupes);
}

//1. feladat
num sum(List<num> arr) {
    num sum = 0;
    
    for(num item in arr) {
        sum += item;
    }

    return sum;
}

//2. feladat
List<int> oddOnesOut(List<int> nums) {
    var count = <int, int>{};
    for (var n in nums) {
        count[n] = (count[n] ?? 0) +1;
    }

    var result = <int>[];
    for(var n in nums) {
        if(count[n]! % 2 == 0) {
            result.add(n);
        }
    }
return result;
}

//3. feladat
List<int> flattenAndSort(List<List<int>> nums) {
    List<int> result = [];

    for(var inner in nums) {
        for(var n in inner) {
            result.add(n);
        }
    }

    result.sort();

    return result;
}

//4. feladat
int duplicateCount(String text){
    text = text.toLowerCase();

    Map<String, int> count = {};

    for (var c in text.split('')) {
        count[c] = (count[c] ?? 0) + 1;
    }

    int dupes = 0;

    count.forEach((key, value) {
        if(value > 1) {
            dupes++;
        }
    });

return dupes;
}
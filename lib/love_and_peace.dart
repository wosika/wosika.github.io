import 'dart:math';

//垃圾红球
List<int> trashRedList = [];
//垃圾蓝球
List<int> trashBlueList = [];
//真红球
List<int> redList = [];
//真蓝球
List<int> blueList = [];

void main() async {
  int limit = 1001;

  int redNum = 7;
  int blueNum = 2;

  var luckyNum = 5;
  var count = 0;
  var trashCount = 0;
  Random random = Random.secure();

  var num = random.nextInt(limit);
  var isRunTrashRule = false;

  // var random3 = Random();
  // var num3 = random.nextInt(1001);

//  print("当前幸运数$luckyNum");

  if (isRunTrashRule) {
    do {
      num = random.nextInt(limit);
      print("当前随机数1 $num");
      getIt(trashRedList, 33, redNum, random);
      getIt(trashBlueList, 16, blueNum, random);
      trashCount++;
    } while (num != luckyNum);
  }

  do {
    num = random.nextInt(limit);
    print("当前随机数1 $num");
    redList.clear();
    blueList.clear();
    getIt(redList, 33, redNum, random, trashList: trashRedList);
    getIt(blueList, 16, blueNum, random, trashList: trashBlueList);
    count++;
  } while (num != luckyNum);
  if (isRunTrashRule) {
    print("计算垃圾次数：$trashCount");
    print("垃圾红球：$trashRedList");
    print("垃圾蓝球：$trashBlueList");
    print("---------------------");
  }

  print("计算次数：$count");
  print("红球：$redList");
  print("蓝球：$blueList");
}

void getIt(List<int> list, int max, int count, random, {List<int>? trashList}) {
  //var random = Random.secure();
  while (list.length != count) {
    int randomNumber = random.nextInt(max) + 1;
    if (!list.contains(randomNumber)) {
      if (trashList?.contains(randomNumber) == true) {
        print("过滤：$randomNumber");
        continue;
      }
      list.add(randomNumber);
    }
  }
  list.sort();
}

void sort(List<int> list) {
  list.sort((a, b) => a - b);
}

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
  getDoubleColorBallResult(72, true,7,2);
}

//获取结果

String getDoubleColorBallResult(int luckyNum, bool isRunTrashRule ,int redNum, int blueNum) {
  int limit = 1001;
  // int redNum = 7;
  // int blueNum = 2;
  var count = 0;
  var trashCount = 0;
  Random random = Random.secure();
  var num = random.nextInt(limit);

  if (isRunTrashRule) {
    do {
      num = random.nextInt(limit);
      print("当前随机数1 $num");
      _getIt(trashRedList, 33, redNum, random);
      _getIt(trashBlueList, 16, blueNum, random);
      trashCount++;
    } while (num != luckyNum);
  }

  do {
    num = random.nextInt(limit);
    print("当前随机数1 $num");
    redList.clear();
    blueList.clear();
    _getIt(redList, 33, redNum, random, trashList: trashRedList);
    _getIt(blueList, 16, blueNum, random, trashList: trashBlueList);
    count++;
  } while (num != luckyNum);


  var stringBuffer = StringBuffer();
  if (isRunTrashRule) {
    stringBuffer.writeln("计算垃圾次数：$trashCount");
    stringBuffer.writeln("垃圾红球：$trashRedList");
    stringBuffer.writeln("垃圾蓝球：$trashBlueList");
    stringBuffer.writeln("---------------------");
    print("计算垃圾次数：$trashCount");
    print("垃圾红球：$trashRedList");
    print("垃圾蓝球：$trashBlueList");
    print("---------------------");
  }

  stringBuffer.writeln("计算次数：$count");
  stringBuffer.writeln("红球：$redList");
  stringBuffer.writeln("蓝球：$blueList");
  print("计算次数：$count");
  print("红球：$redList");
  print("蓝球：$blueList");
  return stringBuffer.toString();


}

void _getIt(List<int> list, int max, int count, random,
    {List<int>? trashList}) {
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
//
// void _sort(List<int> list) {
//   list.sort((a, b) => a - b);
// }

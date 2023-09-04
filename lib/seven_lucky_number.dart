
import 'dart:math';

void main() async {

  getSevenStarColor(52);

}


String getSevenStarColor(int luckyNum){
  List<int> luckNumberList = [];

  var random = Random();
  var num = random.nextInt(1001);
  print("当前幸运数$luckyNum");
  while (luckyNum != num) {
    num = random.nextInt(1001);
    print("当前随机数$num");
    luckNumberList.clear();
    _getIt(luckNumberList, 9, 7);

  }

  _getIt(luckNumberList, 9, 7);

  print("结果：$luckNumberList");
  return "结果：$luckNumberList";

}

void _getIt(List<int> list, int max, int count) {
  var random = Random();
  while (list.length != count) {
    int randomNumber = random.nextInt(max+1);
    list.add(randomNumber);
  }
}

void _sort(List<int> list) {
  list.sort((a, b) => a - b);
}

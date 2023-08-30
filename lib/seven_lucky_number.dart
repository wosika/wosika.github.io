
import 'dart:math';

void main() async {
  List<int> luckNumberList = [];



  var luckyNum = 52;

  var random = Random();
  var num = random.nextInt(101);
  print("当前幸运数$luckyNum");
  while (luckyNum != num) {
    num = random.nextInt(101);
    print("当前随机数$num");
    luckNumberList.clear();

    getIt(luckNumberList, 9, 4);

  }


  getIt(luckNumberList, 9, 4);

  print("七星彩前四位：$luckNumberList");



}

void getIt(List<int> list, int max, int count) {
  var random = Random();
  while (list.length != count) {
    int randomNumber = random.nextInt(max+1);
    list.add(randomNumber);
  }
}

void sort(List<int> list) {
  list.sort((a, b) => a - b);
}

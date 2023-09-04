import 'dart:math';

void main() async {
    var playerName ="阿劳霍";
    var random = Random();
    var randomInt = random.nextInt(101);
    bool eventOccurs = randomInt < 4;

print("$playerName 强化 ${eventOccurs?"成功":"失败"}");

}
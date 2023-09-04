//双色球页面
import 'package:flutter/material.dart';
import 'package:untitled/love_and_peace.dart';
import 'package:untitled/seven_lucky_number.dart';

class SevenStarColorPage extends StatefulWidget {
  const SevenStarColorPage({Key? key}) : super(key: key);

  @override
  State<SevenStarColorPage> createState() => _SevenStarColorPageState();
}

class _SevenStarColorPageState extends State<SevenStarColorPage> {
  //幸运数字 textController
  TextEditingController luckyNumberController = TextEditingController();



  //生成结果
  String result = "";

  //是否过滤
  bool isFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("七星彩生成模拟"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(children: [
          //输入框，请输入幸运数字，

          TextField(
            //只允许输入数字
            keyboardType: TextInputType.number,
            controller: luckyNumberController,

            decoration: const InputDecoration(
              hintText: "请输入幸运数字",
            ),
          ),

          //间距
          const SizedBox(
            height: 20,
          ),

          //生成按钮
          ElevatedButton(
            onPressed: () {
              if (luckyNumberController.text.isEmpty) {
                //提示
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("请输入幸运数字")));
                return;
              }
              setState(() {
                result = getSevenStarColor(int.parse(luckyNumberController.text));
              });
            },
            child: const Text("生成"),
          ),
          const SizedBox(
            height: 20,
          ),
          //生成结果
          Text(result),
        ]),
      ),
    );
  }
}

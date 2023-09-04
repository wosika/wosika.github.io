//双色球页面
import 'package:flutter/material.dart';
import 'package:dream_come_true/love_and_peace.dart';

class DoubleColorBallPage extends StatefulWidget {
  const DoubleColorBallPage({Key? key}) : super(key: key);

  @override
  State<DoubleColorBallPage> createState() => _DoubleColorBallPageState();
}

class _DoubleColorBallPageState extends State<DoubleColorBallPage> {
  //幸运数字 textController
  TextEditingController luckyNumberController = TextEditingController();

  //过滤次数 textController
  TextEditingController filterCountController = TextEditingController();

  //生成结果
  String result = "";

  //是否过滤
  bool isFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("双色球生成模拟"),
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
          //s，是否过滤
          Row(
            children: [
              const Text("是否过滤一次垃圾号码"),
              Switch(
                  value: isFilter,
                  onChanged: (value) {
                    setState(() {
                      isFilter = value;
                    });
                  })
            ],
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
                result = getDoubleColorBallResult(int.parse(luckyNumberController.text), isFilter);
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

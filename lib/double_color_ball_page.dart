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

  //篮球数量
  TextEditingController blueBallCountController = TextEditingController();

  //红球数量
  TextEditingController redBallCountController = TextEditingController();

  //生成结果
  String result = "";

  //是否过滤
  bool isFilter = false;

  //是否复式
  bool isDouble = false;

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
              hintText: "请输入幸运数字（0-1000)",
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

          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text("是否复式"),
              Switch(
                  value: isDouble,
                  onChanged: (value) {
                    setState(() {
                      isDouble = value;
                    });
                  })
            ],
          ),

          Visibility(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  //输入复式 几+几
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextField(
                          //只允许输入数字
                          textAlign: TextAlign.center,
                          controller: redBallCountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "请输入红球数量",
                          ),
                        ),
                      ),
                      const Text(" + "),
                      SizedBox(
                          width: 150,
                          child: TextField(
                            controller: blueBallCountController,
                            textAlign: TextAlign.center,
                            //只允许输入数字
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "请输入蓝球数量",
                            ),
                          )),
                    ],
                  )
                ],
              ),
              visible: isDouble),
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

              //如果幸运数超过0-1000
              if (int.parse(luckyNumberController.text) < 0 ||
                  int.parse(luckyNumberController.text) > 1000) {
                //提示
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("请输入0-1000之间的幸运数哦")));
                return;
              }

              var redNum = redBallCountController.text.isEmpty
                  ? 0
                  : int.parse(redBallCountController.text);
              var blueNum = blueBallCountController.text.isEmpty
                  ? 0
                  : int.parse(blueBallCountController.text);

              if (isDouble) {
                if (redNum == 0 || blueNum == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("请输入红球和蓝球数量")));
                  return;
                }
              } else {
                redNum = 6;
                blueNum = 1;
              }

              setState(() {
                result = getDoubleColorBallResult(
                    int.parse(luckyNumberController.text),
                    isFilter,
                    redNum,
                    blueNum);
              });
            },
            child: const Text("生成"),
          ),
          const SizedBox(
            height: 20,
          ),
          //生成结果
          SelectionArea(child: Text(result)),
        ]),
      ),
    );
  }
}

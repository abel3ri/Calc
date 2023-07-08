import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? text = '0';
  // String? btnText;
  int? num1;
  int? num2;
  String? txttoDisplay = '';
  String? res = '';
  String? op;
  String? history = '';
  void btnClick(String btnValue) {
    print(btnValue);
    if (btnValue == 'AC') {
      num1 = 0;
      num2 = 0;
      txttoDisplay = '';
      op = '';
      history = '';
      res = '';
    } else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == 'X' ||
        btnValue == '÷') {
      num1 = int.parse(txttoDisplay!);
      res = '';
      op = btnValue;
    } else if (btnValue == '=') {
      num2 = int.parse(txttoDisplay!);
      if (op == '+') {
        res = (num1! + num2!).toString();
        history = num1.toString() + op! + num2.toString();
      } else if (op == '-') {
        res = (num1! - num2!).toString();
        history = num1.toString() + op! + num2.toString();
      } else if (op == 'X') {
        res = (num1! * num2!).toString();
        history = num1.toString() + op! + num2.toString();
      } else if (op == '÷') {
        res = (num1! / num2!).toString();
        history = num1.toString() + op! + num2.toString();
      }
    } else {
      res = (txttoDisplay! + btnValue).toString();
    }
    setState(() {
      txttoDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Text('Calculator'),
              backgroundColor: Colors.black,
            ),
            body: SafeArea(
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$history',
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$txttoDisplay',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        text: '+',
                        color: Colors.orangeAccent,
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: '-',
                        color: Colors.orangeAccent,
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: 'X',
                        color: Colors.orangeAccent,
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: '÷',
                        color: Colors.orangeAccent,
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        text: '7',
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: '8',
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: '9',
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: 'AC',
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        text: '4',
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: '5',
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: '6',
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: 'v',
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        text: '1',
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: '2',
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: '3',
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                      ButtonWidget(
                        text: '=',
                        color: Colors.redAccent,
                        callBack: (text) {
                          btnClick(text);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  String? text;
  // void Function()? onBtnPressed;
  Color? color;
  Function? callBack;
  ButtonWidget({required this.text, this.color, this.callBack});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        callBack!(text);
      },
      child: Text(
        text!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          color ?? Colors.grey.shade600,
        ),
        shape: MaterialStateProperty.all(const CircleBorder()),
        minimumSize: MaterialStateProperty.all(
          const Size(
            60,
            60,
          ),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
      ),
    );
  }
}

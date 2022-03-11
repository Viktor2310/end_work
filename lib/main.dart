import 'package:end_work/auth.dart';
import 'package:end_work/load1.dart';
import 'package:end_work/reg_page.dart';
import 'package:end_work/them_root.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme1(),
        initialRoute: '/',
        routes: {
          '/'  : (context) => const Enter(),
          '/link1'    : (context) => const Reg(),
          '/link2'   : (context) => const LoadJSON(),

        }
    );
  }
}

bool authorized =false;

const borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(36)),
    borderSide: BorderSide(color: Color(0xFFbbbbbb), width: 1));

Future haveFail(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text('Ошибка ввода',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          InkWell(
            child: Text('Назад',
                style: Theme.of(context).textTheme.bodyText2?.
                copyWith(color: Colors.blue)
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

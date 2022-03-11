import 'package:end_work/bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);
  @override
  State<Reg> createState() => _RegState();
}


class _RegState extends State<Reg> {
  late TextEditingController _controller;
  late TextEditingController _controller1;

  void _regChel() async {
    final prefs = await SharedPreferences.getInstance();
    if (_controller.text.length==10 && _controller1.text!=''){
      try {
        int.parse(_controller.text);
        prefs.setString(_controller.text, _controller1.text);
        Navigator.pushNamed(context, '/');
      }
      catch (e) {
        haveFail(context);
      }
    } else {
      haveFail(context);
    }
  }

  @override
  void initState(){
    super.initState();
    _controller=TextEditingController(text: '');
    _controller1=TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: bigDrawer(context),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fon.jpg'),
                fit: BoxFit.cover,
              )
          ),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100,),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Text('Регистрация', style: Theme.of(context).textTheme.headline1?.
                    copyWith(color: Colors.blueGrey)
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const Divider(color: Colors.black, thickness: 1),
                const SizedBox(height: 20),
                Text('Ваш номер телефона (10 цифр)\n\nи пароль',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex:1, child: Container()),
                    Expanded(flex:4,
                      child: SizedBox(//width: 224,
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 20,),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFeceff1),
                            enabledBorder: borderStyle,
                            focusedBorder: borderStyle,
                            labelText: '+7',
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex:1, child: Container()),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex:1, child: Container()),
                    Expanded(flex:4,
                      child: SizedBox(width: 224,
                        child: TextField(
                          controller: _controller1,
                          obscureText: true,
                          style: const TextStyle(fontSize: 20,),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFeceff1),
                            enabledBorder: borderStyle,
                            focusedBorder: borderStyle,
                            labelText: 'Password',
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex:1, child: Container()),
                  ],
                ),
                const SizedBox(height: 40,),
                SizedBox(
                    width: 220,
                    height: 62,
                    child:
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF5a5dea),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22)
                            )
                        ),
                        onPressed: () => _regChel(),
                        child: Text('Зарегистрировать', style: Theme.of(context).textTheme.bodyText1?.
                        copyWith(color: Colors.white),
                        )
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'main.dart';

PreferredSizeWidget? bigBar(BuildContext context) {
  return AppBar(


    title: Row(children: [
        Column( children: [
            Text('Меню', style: Theme.of(context).textTheme.bodyText2?.
            copyWith(color: Colors.blueGrey)), ], ),
        Expanded(child: Container(),),
      ],
    ),
    actions:<Widget> [
      IconButton( tooltip: "Список",
          onPressed: ()=> Navigator.pushNamed(context, '/link2'), icon: const Icon(Icons.list_alt_outlined)),
      IconButton(tooltip: "Начальный экран",
          onPressed: ()=> Navigator.pushNamed(context, '/'), icon: const Icon(Icons.exit_to_app_sharp)),
                  ],
  );
}




Widget? bigDrawer(BuildContext context) {
  return SizedBox(width: 350,
    child: Container(
      color: const Color.fromRGBO(178, 198, 232, 0.8),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset('assets/menu.png'),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Divider(
                  height: 20, thickness: 2,
                  indent: 20, endIndent: 0,
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.login_sharp, color: Colors.blue,),
                  title: const Text( 'Пройти авторизация',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/'),
                ),
                const Divider(height: 20, thickness: 1, indent: 20, endIndent: 0, color: Colors.blue,),

                ListTile(
                  leading: const Icon(Icons.login_sharp, color: Colors.blue,),
                  title: const Text('Пройти регистрация', style: TextStyle(color: Colors.white70),),
                  onTap: () => Navigator.pushNamed(context, '/link1'),
                ),
                const Divider(height: 20, thickness: 1,
                  indent: 20, endIndent: 0,
                  color: Colors.blue,
                ),
                ListTile(
                  leading: const Icon(Icons.login, color: Colors.blue,),
                  title: const Text('Список',style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    if (authorized) {
                      Navigator.pushNamed(context, '/link2');
                    }
                    else {
                      haveFail(context);
                    }
                  },
                ),
                const Divider(
                  height: 20, thickness: 1,
                  indent: 20, endIndent: 0,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

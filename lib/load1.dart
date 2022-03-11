import 'dart:convert';
import 'package:end_work/bar.dart';
import 'package:end_work/class_user.dart';
import 'package:end_work/load2.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'strings.dart';


class LoadJSON extends StatefulWidget {
  static String rote = 'LoadJSON';
  const LoadJSON({Key? key}) : super(key: key);
  @override
  _LoadJSONState createState() => _LoadJSONState();
}

class _LoadJSONState extends State<LoadJSON> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: bigBar(context),
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
          child: const ListJSON(),
        )
    );
  }
}

class ListJSON extends StatefulWidget {
  const ListJSON({Key? key}) : super(key: key);
  @override
  _ListJSONState createState() => _ListJSONState();
}

class _ListJSONState extends State<ListJSON> {
  late Future<List<User>> futureUsersList;
  @override
  void initState() {
    super.initState();
    futureUsersList = _fetchUsersList();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<List<User>>(
            future: futureUsersList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _usersListView(context, snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            })
    );
  }
}

ListView _usersListView(BuildContext context, List<User>data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _userListTile(context, data[index]);
      });
}

ListTile _userListTile(BuildContext context, User data) {
  return ListTile(
      title: Text(
        data.name ?? '',
        style: Theme.of(context).
        textTheme.bodyText2?.
        copyWith(color: Colors.lightBlue),
      ),
      subtitle: Text(
        data.email ?? '',
        style: Theme.of(context).
        textTheme.bodyText1?.
        copyWith(color: Colors.black, fontSize: 20),
      ),
      leading:
      const Icon(
        Icons.account_circle_sharp,
        size: 40,
        color: Colors.green,
      ),
      onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(builder:
              (context) => SpisokJSON(data)
          )
      )
  );
}

Future<List<User>> _fetchUsersList() async {
  final response = await http.get(Uri.parse(urlGetUsersList));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users from API');
  }
}
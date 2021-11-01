// ignore_for_file: avoid_print

import 'package:api_test/http_service.dart';
import 'package:api_test/model/list_user.dart';
import 'package:flutter/material.dart';

class ListUserScreen extends StatefulWidget {
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User Info'),
      ),
      body: Center(
        child: FutureBuilder<ListUserResponse?>(
          future: _client.getListUser(url: '/users?page=2'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("data rendered");
              ListUserResponse? userListInfo = snapshot.data;
              if (userListInfo != null) {
                return ListView.builder(
                    itemCount: userListInfo.perPage,
                    itemBuilder: (context, index) {
                      final user = userListInfo.users[index];
                      return ListTile(
                        title: Text(user.data.firstName),
                        leading: Image.network(user.data.avatar),
                        subtitle: Text(user.data.email),
                      );
                    });
              } else {
                print("yet to render2nd");
                return const CircularProgressIndicator();
              }
            } else {
              bool a = snapshot.hasData;
              print("yet to render");
              print("$a");
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

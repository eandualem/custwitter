import 'package:custwitter/models/user.dart';
import 'package:custwitter/screens/main/posts/list.dart';
import 'package:custwitter/services/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: context.read<PostService>().getPostByUser(context.read<UserModel>().id),
      child: Scaffold(
        body: Container(
          child: ListPost(),
        ),
      ),
    );
  }
}

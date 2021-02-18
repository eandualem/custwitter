import 'package:custwitter/models/user.dart';
import 'package:custwitter/services/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  PostService _postService = new PostService();
  String _text = "";
  @override
  Widget build(BuildContext context) {
    final UserModel user = context.watch<UserModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add tweets"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () async {
              _postService.savePost(_text, user.id);
              Navigator.pop(context);
            },
            child: Text("Tweet")
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: new Form(
          child: TextFormField(
            onChanged: (val) {
              setState(() {
                _text = val;
              });
            },
          ),
        ),
      ),
    );
  }
}

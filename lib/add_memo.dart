import 'package:flutter/material.dart';
import 'package:personalnote/memo.dart';
import 'package:personalnote/main.dart';
import 'package:provider/provider.dart';

class AddMemo extends StatefulWidget {
  @override
  _AddMemoState createState() => _AddMemoState();
}

class _AddMemoState extends State<AddMemo> {
  String content = '';

  @override
  Widget build(BuildContext context) {
    MyMemo myMemo = Provider.of<MyMemo>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 추가'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              myMemo.addMemo(
                Memo(
                  content: this.content,
                ),
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              onChanged: (value) {
                content = value;
              },
              decoration: InputDecoration(
                hintText: '메모 내용',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

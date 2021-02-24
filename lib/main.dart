import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personalnote/add_memo.dart';
import 'package:personalnote/memo.dart';

void main() {
  MyMemo myMemo = MyMemo();
  runApp(
    ChangeNotifierProvider<MyMemo>.value(
      value: myMemo,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    MyMemo myMemo = Provider.of<MyMemo>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('내 메모'),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(title: Text(myMemo.memos[index].content));
          },
          itemCount: myMemo.memos.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AddMemo();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyMemo with ChangeNotifier {
  List<Memo> memos;

  MyMemo() {
    memos = List();
  }
  void addMemo(Memo memo) {
    this.memos.add(memo);
    notifyListeners();
  }
}

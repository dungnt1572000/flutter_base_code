import 'package:baseproject/data/model/message/message.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends ConsumerState {
  FirebaseDatabase ava1 = FirebaseDatabase.instance;
  late DatabaseReference ava;
  late DatabaseReference avb;
  final arr =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ava = ava1.ref("ADgIKZMtiiSq7N19sFKBBM5c3rN2/o31bx1HAMnPHXXity5XDUwt1QBH3/");
    avb = ava1.ref("o31bx1HAMnPHXXity5XDUwt1QBH3/ADgIKZMtiiSq7N19sFKBBM5c3rN2/");
    avb.limitToLast(3).onChildAdded.listen((event) {
      arr.add(event.snapshot.value);
      print(arr.length);
    });
    avb.limitToLast(3).onChildAdded.listen((event) {
      arr.add(event.snapshot.value);
      print(arr.length);
    });
  }
  List<Message> listmsg =[];
  @override
  Widget build(BuildContext context) {
    int count = 0;
    int firsta=1;
    int firstb=1;
    // ava.limitToLast(3).onValue.listen((event) {
    //   var result = event.snapshot.value;
    //   if(result is Map){
    //     result.forEach((key, value) {
    //       listmsg.add(Message(key.toString(), value["text"].toString()));
    //     });
    //    listmsg.sort((a, b) => a.text.compareTo(b.text),);
    //    listmsg.forEach((element) {
    //      // print(element.text);
    //    });
    //   }else{
    //     print("Hong roi");
    //   }
    // });

    return Scaffold(
      body: Center(
        child: Text('Home View'),
      ),
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              count++;
              ava.update({
                "message$count": {"text": "hello$count"}
              });
            },
          ),
          FloatingActionButton(
            onPressed: () {
              count++;
              avb.update({
                "message$count": {"text": "hello$count"}
              });
            },
          ),
        ],
      ),
    );
  }
}

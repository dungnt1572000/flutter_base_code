import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>HomeViewState();
}

class HomeViewState extends ConsumerState{
  DatabaseReference ava = FirebaseDatabase.instance.ref("ADgIKZMtiiSq7N19sFKBBM5c3rN2");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,()async{
      final ala = await ava.get();
      if(ala.exists){
        print(ala.value);
      }else{
        print('Deo on roi');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home View'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ava.set({
            "o31bx1HAMnPHXXity5XDUwt1QBH3" :{
              "message1":{
                "text":"hello"
              },
              "message2":{
                "text":"concac"
              }
            }
          });
        },
      ),
    );
  }

}

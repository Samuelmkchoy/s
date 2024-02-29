// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final user = FirebaseAuth.instance.currentUser!;

  //documnet Id
  List<String> docIDs = [];

  Future getDocId() async{
    await FirebaseFirestore.instance.collection('users').get().then((
      snapchot) => snapchot.docs.forEach(
        (element) {
        print(element.reference);
        docIDs.add(element.reference.id);
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('signed in as ' + user.email!),
          MaterialButton(onPressed: (){
            FirebaseAuth.instance.signOut();           
          },
          color: Colors.deepOrange[200],
          child: const Text('sign out'),
          ),
          Expanded(
            child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
              return ListView.builder(
              itemCount: docIDs.length,
              itemBuilder: (context, index){
              return ListTile(
                title: Text(docIDs[index]),
                );
              },
            );
            } ,)
          ),
        ],
      ),),
    );
  }
}
// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj/read%20data/get_user_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final user = FirebaseAuth.instance.currentUser!;

  //documnet Id
  List<String> docIDs = [];

  //get docIDs
  Future getDocId() async{
    await FirebaseFirestore.instance
    .collection('user_details')
    .orderBy('age', descending: false)
    .get()
    .then(
      (snapchot) => snapchot.docs.forEach(
        (document) {
          print(document.reference);
          docIDs.add(document.reference.id);
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                user.email!,
                style: TextStyle(fontSize: 16),
                ),
          ),
        ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap:(){
                    FirebaseAuth.instance.signOut();           
                  },
                  child: Icon(Icons.logout),
                    ),
              ),
                ],
              ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: GetUserName(documnetId: docIDs[index]),
                        tileColor: Colors.grey[200],
                        ),
                      );
                    },  
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
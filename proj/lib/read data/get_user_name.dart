import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documnetId;

  GetUserName({required this.documnetId});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('user_details');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documnetId).get(),
      builder: ((context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['first name']}' + ' ' + '${data['last name']}' + ', ' + '${data['age']}');
      }
      return Text('Loading..');
    }),);
  }
}
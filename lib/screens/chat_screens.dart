import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chattings').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data?.docs;
          return ListView.builder(
              itemCount: documents?.length,
              itemBuilder: ((context, index) => Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(documents?[index]['name']),
                  )));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection("chattings")
              .add({'name': 'add new content in the flutter firebase console'});
          //in flutter side a new document is represented by map key value pair
          // FirebaseFirestore.instance
          //     .collection('chattings')
          //     .snapshots()
          //     .listen((data) {
          //   print(data.docs[0]['name']);
          //   data.docs.forEach((document) {
          //     print(document['name']);
          //   });
          // });
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodsflutter/read%20data/get_user_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  //document IDs
  List<String> docIDs = [];

  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users').orderBy('age', descending: true)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          user.email!,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
        backgroundColor: Colors.deepPurple[200],
        actions: [
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
            child: Icon(Icons.logout),
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
                              title: GetUserName(
                                documentId: docIDs[index],
                              ),
                              tileColor: Colors.grey[200],
                            ),
                          );
                        },
                      );
                    })),
          ],
        ),
      ),
    );
  }
}

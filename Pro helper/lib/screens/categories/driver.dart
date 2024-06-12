import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pro/constans/colors.dart';
import 'package:pro/services/auth.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _ArchitecturerState();
}

final AuthServices _auth = AuthServices();

class _ArchitecturerState extends State<Driver> {
  final _userStream2 =
      FirebaseFirestore.instance.collection('Driver').snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgBackground,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: bgAppBar,
          title: const Text("Drivers"),
        ),
        body: StreamBuilder(
          stream: _userStream2,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection Error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            var docs = snapshot.data!.docs;
            // return Text('${docs.length}');
            return ListView.builder(
              itemCount: docs.length,
              itemExtent: 150,
              itemBuilder: (context, index) {
                return Card(
                  color: bgCard,
                  child: SingleChildScrollView(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        docs[index]['name'],
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.white),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            docs[index]['qualifications'],
                            style: const TextStyle(
                                fontFamily: 'Roboto', color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(docs[index]['skills'],
                              style: const TextStyle(
                                  fontFamily: 'Roboto', color: Colors.white)),
                          const Divider(
                            color: Color.fromARGB(255, 233, 229,
                                229), // Set the color of the line
                            thickness: 1, // Set the thickness of the line
                            height: 20, // Set the height of the line
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

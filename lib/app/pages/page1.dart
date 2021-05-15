import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/app/controller/dataController.dart';
import 'package:crud_firebase/app/services/crud_example.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pages1 extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: dataController.nameController,
            ),
            TextField(
              controller: dataController.umurController,
            ),
            ElevatedButton(
              child: Text("ADD DATA"),
              onPressed: () {
                // print("nama -> ${nameController.value.text}");
                // print("umur -> ${umurController.value.text}");

                dataController.crud
                    .addUser(umur: dataController.umurController.value.text);
              },
            ),
            const SizedBox(
              height: 28,
            ),
            Divider(
              height: 5,
              color: Colors.black,
            ),
            Text(
              "Data dari firestore",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: dataController.crud.getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        print("isi data -> ${snapshot.data.docs[index]}");
                        return ListTile(
                          title: Text(snapshot.data.docs[index]['name']),
                          subtitle: Text(
                              snapshot.data.docs[index]['umur'].toString()),
                          trailing: Text(
                              "id -> ${snapshot.data.docs[index]['patientId']}"),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            // TextField(
            //   controller: searchController,
            // ),
            // TextButton(
            //     onPressed: () async {
            //       QuerySnapshot<Map<String, dynamic>> hasil =
            //           await crud.getUsersById(searchController.value.text);

            //       hasilan =
            //           hasil.docs[0]['name'] + " " + hasil.docs[0]['umur'];
            //       setState(() {});
            //     },
            //     child: Text("get data by id"))
            // // FutureBuilder(
            // //   future: crud.getUsersById(searchController.value.text),
            // //   builder: (context, snapshot) {
            // //     if (snapshot.hasData) {
            // //       String hasil;
            // //       return Text(hasil ?? "blum ada data");
            // //     }
            // //   },
            // // ),
            // ,
            // Column(
            //   children: [
            //     Text("hasil dibawah"),
            //     Text(hasilan != null ? hasilan : 'belum ada data')
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:example/class_user.dart';
import 'package:example/db/authFunctions.dart';
import 'package:example/home.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserAcc _userAcc =
      UserAcc(username: '', password: '', name: '', pic: [], tel: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _tableuser =
      FirebaseFirestore.instance.collection("user");
  bool login = false;
  PlatformFile? files;
  List<File> images = [];
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 200,
                            child: Image.asset("assets/images/asset-02.png"),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(left: 50),
                              child: Text('เข้าสู่ระบบ',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ))),
                          const SizedBox(height: 10),
                          Center(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  controller: username,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    labelText: 'Username',
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (value) {
                                    setState(() {
                                      _userAcc.username = value!.trim();
                                    });
                                  },
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  controller: password,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (value) {},
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) return 'Empty';
                                    if (val != password.text)
                                      return 'Not Match';
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    labelText: 'Comfirm Password',
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (value) {
                                    setState(() {
                                      _userAcc.password = value!.trim();
                                    });
                                  },
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    labelText: 'ชื่อ - นามสกุล',
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (value) {
                                    setState(() {
                                      _userAcc.name = value!.trim();
                                    });
                                  },
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(50),
                              child: InkWell(
                                  child: Container(
                                      width: 500,
                                      height: 200,
                                      child: Material(
                                          color: Colors.grey[300],
                                          child: const Center(
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                ClipOval(
                                                  child: Material(
                                                    color: Colors
                                                        .grey, // button color

                                                    // inkwell color
                                                    child: SizedBox(
                                                        width: 56,
                                                        height: 56,
                                                        child: Icon(Icons.add)),
                                                  ),
                                                ),
                                                Text('อัพโหลดภาพถ่ายประจำตัว')
                                              ])))),
                                  onTap: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      allowMultiple: true,
                                      type: FileType.custom,
                                      allowedExtensions: ['jpg', 'png', 'jpeg'],
                                    );

                                    if (result != null) {
                                      images = result.paths
                                          .map((path) => File(path!))
                                          .toList();
                                      setState(() {
                                        files = result.files.first;
                                      });
                                      final uploadTasks =
                                          images.map((file) async {
                                        String uniqueFilename =
                                            "${DateTime.now()}-user";
                                        Reference refRoot =
                                            FirebaseStorage.instance.ref();
                                        Reference refDirImages =
                                            refRoot.child('images');
                                        Reference refImageToUpload =
                                            refDirImages.child(uniqueFilename);
                                        await refImageToUpload
                                            .putFile(File(file.path));
                                        return await refImageToUpload
                                            .getDownloadURL();
                                      });

                                      _userAcc.pic =
                                          await Future.wait(uploadTasks);
                                    }
                                  })),
                          Center(
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green),
                                      ),
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          await _tableuser.add({
                                            "Username": _userAcc.username,
                                            "password": _userAcc.password,
                                            "Name": _userAcc.name,
                                            "pic": _userAcc.pic
                                          });
                                        }
                                        login
                                            ? AuthServices.signinUser(
                                                username.text,
                                                password.text,
                                                context)
                                            : AuthServices.signupUser(
                                                username.text,
                                                password.text,
                                                name.text,
                                                context);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const Home()));
                                      },
                                      child: const Text(
                                        "เข้าสู่ระบบ",
                                        style: TextStyle(fontSize: 18),
                                      )))),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("คุณยังไม่มีบัญชีผู้ใช้งาน ? "),
                                const SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const Page1()));
                                    },
                                    child: const Text(
                                      'สมัครสมาชิก',
                                      style: TextStyle(color: Colors.blue),
                                    ))
                              ])
                        ])))));
  }
}

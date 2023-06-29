import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(children: [
                  const Center(
                      child: Text('เข้าสู่ระบบ',
                          style: TextStyle(
                            fontSize: 35,
                          ))),
                  const SizedBox(height: 25),
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/project-towin-d0516.appspot.com/o/images%2F2023-06-30%2003%3A07%3A51.831193-user?alt=media&token=4483ea0a-3aa8-4180-8595-29452b3414aa',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 35),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            "ส่วนตัว",
                            style: TextStyle(fontSize: 18),
                          ))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: const Text('ชื่อ : นายเอกพล จริยะนันตกุล',
                                  style: TextStyle(fontSize: 18))))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: const Text('เบอร์โทร : 083-009-4121',
                                  style: TextStyle(fontSize: 18))))),
                  const SizedBox(height: 35),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            "บัญชี",
                            style: TextStyle(fontSize: 18),
                          ))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: const Text('username : ekapol',
                                  style: TextStyle(fontSize: 18))))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: const Text('password : ********',
                                  style: TextStyle(fontSize: 18))))),
                  const SizedBox(height: 15),
                  Center(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                              onPressed: () async {},
                              child: const Text(
                                "ล๊อกเอ้า",
                                style: TextStyle(fontSize: 18),
                              )))),
                ]))));
  }
}

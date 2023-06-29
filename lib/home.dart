import 'package:example/page1.dart';
import 'package:example/page2.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _obscureText = false;
  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;
  final _formKey = GlobalKey<FormState>();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
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
                              onSaved: (newValue) {
                                email = newValue!.trim();
                              },
                              controller: emailcontroller,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder(),
                              ),
                            )),
                      ),
                      // ======== Password ========
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextFormField(
                                  onSaved: (newValue) {
                                    password = newValue!.trim();
                                  },
                                  controller: passwordcontroller,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  obscureText: !_obscureText,
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      hintText: 'Enter your password',

                                      // Here is key idea
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        child: _setPasswordIcon(),
                                      )
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      )))),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                          padding: EdgeInsets.only(left: 300),
                          child: Text('ลืมรหัสผ่าน',
                              style: TextStyle(
                                fontSize: 14,
                              ))),
                      Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                  onPressed: () async {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const Page2()));
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const Page1()));
                              },
                              child: const Text(
                                'สมัครสมาชิก',
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      )
                    ]))));
  }

  Icon _setPasswordIcon() {
    if (_obscureText) {
      return Icon(Icons.visibility);
    } else {
      return Icon(Icons.visibility_off);
    }
  }
}

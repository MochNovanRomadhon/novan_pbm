import 'package:flutter/material.dart';
import 'package:novan_pbm/page/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      height: 550,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                             child: Text('Register', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: 300,
                            child: TextField(
                                controller: nama,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Nama',
                                    style: TextStyle(color: Color(0xFF000000),fontSize: 15),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: Colors.black),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
                            child: TextField(
                                controller: email,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Email',
                                    style: TextStyle(color: Colors.black,fontSize: 15),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: Colors.black),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
                            child: TextField(
                                obscureText: true,
                                controller: pass,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Password',
                                    style: TextStyle(color: Colors.black,fontSize: 15),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: Colors.black),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (email.text == '' || nama.text == '' || pass.text == '') {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('Tolong isi Semua'),
                                      );
                                    });
                              } else {
                                final Map<String, dynamic> data = {
                                  'nama': nama.text,
                                  'email': email.text,
                                  'pass': pass.text
                                };

                                Navigator.pushNamed(context, '/login', arguments: data);
                              }
                            },
                            child: Text('Sign Up'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black),
                              minimumSize: MaterialStateProperty.all(Size(300, 50)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Sudah punya akun?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: Text('Login')),
                              SizedBox(
                                height: 100,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

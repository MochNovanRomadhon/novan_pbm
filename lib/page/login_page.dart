import 'package:flutter/material.dart';
import 'package:novan_pbm/page/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailValue = TextEditingController();
  TextEditingController passValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var nama = data?['nama'];
    var email = data?['email'];
    var pass = data?['pass'];

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
                            
                            child: Text('Login', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 50,),
                          Container(
                            width: 300,
                            child: TextField(
                                controller: emailValue,
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
                                controller: passValue,
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
                              if (emailValue.text != email || passValue.text != pass) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('Email dan Password Salah'),
                                      );
                                    });
                              } else {
                                final Map<String, dynamic> data = {
                                  'nama': nama,
                                };

                                Navigator.pushNamed(context, '/home', arguments: data);
                              }
                            },
                            child: Text('Log In'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black),
                              minimumSize: MaterialStateProperty.all(Size(300, 50)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Belum punya akun?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: Text('Sign up')),
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

import 'package:flutter/material.dart';
import 'package:novan_pbm/page/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic hasil = '';
  dynamic result = '';
  TextEditingController tinggi = TextEditingController();
  TextEditingController berat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var nama = data?['nama'];
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
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(70),
                        ),
                      ),
                      height: 700,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(Icons.calculate_rounded,size: 80,),
                          ),
                          Center(
                            
                            child: Text('BMI calculator', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            color: Colors.transparent,
                            width: 300,
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' Halo ${nama} ayo cek BMI kamu sekarang! ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
                                SizedBox(
                                  height: 70,
                                ),
                                Text('${hasil}',style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text('${result}')
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
                            child: TextField(
                                keyboardType: TextInputType.number,
                                controller: tinggi,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Tinggi',
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
                                keyboardType: TextInputType.number,
                                controller: berat,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Berat',
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
                              setState(() {
                                double height = double.parse(tinggi.text);
                                double weight = double.parse(berat.text);
                                double number = weight / ((height / 100) * (height / 100));

                                if (number < 18.5) {
                                  result = 'Kekurangan berat badan';
                                  hasil = number.toStringAsFixed(1);
                                } else if (number >= 18.5 && number < 24.9) {
                                  result = 'Normal';
                                  hasil = number.toStringAsFixed(1);
                                } else if (number >= 25.0 && number < 29.9) {
                                  result = 'Kelebihan berat badan';
                                  hasil = number.toStringAsFixed(1);
                                } else {
                                  result = 'Terlalu gemuk (Obesitas)';
                                  hasil = number.toStringAsFixed(1);
                                }
                              });
                            },
                            child: Text('Hitung BMI'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black),
                              minimumSize: MaterialStateProperty.all(Size(300, 50)),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: Text('Logout'), 
                                  style: TextButton.styleFrom(
                                    primary: Colors.white, 
                                    backgroundColor: Color.fromARGB(255, 227, 54, 54), 
                                    textStyle: TextStyle(
                                      fontSize: 13 
                                    ),
                                    padding: EdgeInsets.all(10), 
                                    minimumSize: Size(60, 35), 
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5), 
                                    ),
                                  ),
                                ),
                                  
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
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_share_project/views/show_money_share_ui.dart';

class InputMoneyShare_UI extends StatefulWidget {
  const InputMoneyShare_UI({super.key});

  @override
  State<InputMoneyShare_UI> createState() => _InputMoneyShare_UIState();
}

class _InputMoneyShare_UIState extends State<InputMoneyShare_UI> {
  //
  bool? tipCheck = false;

  //

  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

  // แสดงข้อความเตือน
  warningMessage(context, msg) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Container(
          color: Color.fromARGB(255, 252, 74, 74),
          padding: EdgeInsets.all(10.0),
          child: Text(
            'คำเตือน',
            textAlign: TextAlign.center,
          ),
        ),
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'แชร์เงินกันเถอะ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 40.0,
              right: 40.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image.asset(
                  'assets/images/money.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextField(
                  controller: moneyCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]+.?[0-9]*'),
                    ),
                  ],
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'ป้อนจำนวนเงิน (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[200],
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextField(
                  controller: personCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"\d+([\.]\d+)?"),
                    ),
                  ],
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'ป้อนจำนวนคน (คน)',
                    hintStyle: TextStyle(
                      color: Colors.grey[200],
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (paramValue) {
                        setState(() {
                          tipCheck = paramValue!;
                          if(paramValue ==false){
                            tipCtrl.text ='';  
                          }
                        });
                      },
                      value: tipCheck,
                      activeColor: Colors.red,
                      side: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      'เงินทิป (บาท)',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: tipCtrl,
                  readOnly: !tipCheck!,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]+.?[0-9]*'),
                    ),
                  ],
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[200],
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyCheckDollar,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // validate
                           if (moneyCtrl.text.isEmpty == true) {
                            warningMessage(
                                context, 'ป้อนจำนวนเงินด้วยนะจ้ะ....^_^');
                            return;
                          } else if (personCtrl.text.isEmpty == true) {
                            warningMessage(
                                context, 'ป้อนจำนวนเงินด้วยนะจ้ะ....^_^');
                            return;
                          } else if (tipCheck == true) {
                            if (tipCtrl.text.isEmpty == true) {
                              warningMessage(
                                  context, 'ป้อนจำนวนเงินด้วยนะจ้ะ....^_^');
                              return;
                            }
                          }
                            //คำนวณเงินที่จะหารกัน แล้วส่งไปแสดงที่หน้า ShowMoneyShareUI()
                            double money =double.parse(moneyCtrl.text);
                            int person = int.parse(personCtrl.text);
                            double tip =tipCheck ==true ? double.parse(tipCtrl.text) :0;
                            // cal

                            double moneyShare =(money+ tip) / person;
                            // เมื่อคำนวนเสร็จจะส่งค่าไป หน้า moneyShareUI()
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  money: money,
                                  person: person,
                                  tip: tip,
                                  moneyShare: moneyShare,
                                ),
                              ),
                            );
                          
                        
                        },
                        icon: Icon(
                          Icons.calculate,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คำนวณ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          fixedSize: Size.fromHeight(
                            55.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.025,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            // เคลียทุกอย่างให้เหมือนตอนเช้า
                            moneyCtrl.text ='';
                            personCtrl.text = '';
                            tipCtrl.text ='';
                            tipCheck =false;
                          });
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 240, 111, 102),
                          fixedSize: Size.fromHeight(
                            55.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

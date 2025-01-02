// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowMoneyShareUI extends StatefulWidget {
  // สร้างตัวแปลมารับค่าที่ส่งมา ณ ที่นี้ มี 4 ค่าที่ส่่งมา
  double? money;
  int? person;
  double? tip;
  double? moneyShare;
  // -----------------------------
  ShowMoneyShareUI(
      {super.key, this.money, this.person, this.tip, this.moneyShare});

  @override
  State<ShowMoneyShareUI> createState() => _ShowMoneyShareUIState();
}

class _ShowMoneyShareUIState extends State<ShowMoneyShareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'แสดงผลแชร์เงิน',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Image.asset(
                'assets/images/money.png',
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                'จำนวนเงินที่จะแชร์กัน',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.red,
                ),
              ),
              Text(
              //  widget.money!.toString(),
              NumberFormat('#,##0.00',"en_US").format(widget.money!),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.045,
              ),
              Text(
                'จำนวนคนที่จะแชร์กัน',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.red,
                ),
              ),
              Text(
                widget.person!.toString(),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'คน',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.045,
              ),
              Text(
                'จำนวนเงินทิป',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.red,
                ),
              ),
              Text(
                 widget.tip!.toString(),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.045,
              ),
              Text(
                'แชร์เงินกันคนละ',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.red,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                     widget.moneyShare!.toString(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

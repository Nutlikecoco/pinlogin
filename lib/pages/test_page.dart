import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelePhone extends StatefulWidget {
  const TelePhone({Key? key});

  @override
  State<TelePhone> createState() => _TelePhoneState();
}

class _TelePhoneState extends State<TelePhone> {
  var _pin = "______";
  bool _isSelected = false;

  Widget buildItem({
    required dynamic label,
    Color color = Colors.black,
  }) {
    IconData? icon;
    String text = '';

    if (label is IconData) {
      icon = label;
    } else {
      text = label;
    }
    if (icon != null) {
      // ถ้าเป็น IconData ให้แสดงไอคอน

      return InkWell(
        onTap: () {
          setState(() {
            if (label == Icons.close) {
              // ล้างตัวเลขทั้งหมดใน PIN
              _pin = "______";
            } else if (label == Icons.backspace) {
              // จัดการกับการกดปุ่ม Backspace
              int underscoreIndex = _pin.indexOf('_');

              if (underscoreIndex > 0) {
                // หากมี underscore ก่อนตำแหน่งปัจจุบัน ให้แทนที่ตัวเลขก่อนหน้าด้วย underscore
                _pin = _pin.replaceRange(
                    underscoreIndex - 1, underscoreIndex, '_');
              } else if (_pin.length == 6) {
                // ถ้า PIN เต็ม 6 ตัวและไม่มี underscore ก่อนตำแหน่งปัจจุบัน
                // ลบตัวเลขที่ป้อนล่าสุดได้
                _pin = _pin.replaceRange(_pin.length - 1, _pin.length, '_');
              } else {
                // หาก underscore อยู่ที่ตำแหน่งแรก ให้แทนที่ด้วย underscore อีกครั้ง
                _pin = _pin.replaceFirst('_', '_');
              }
            } else if (_pin.contains('_')) {
              // แทนที่ underscore แรกใน PIN ด้วยตัวเลขที่ป้อนเข้ามา
              int underscoreIndex = _pin.indexOf('_');
              _pin = _pin.replaceFirst('_', text, underscoreIndex);
            }
          });
        },
        // ICON x และ ตัวลบข้อความ
        child: Container(
          width: 63,
          height: 63,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              // ไม่มีการกำหนด border หรือ decoration
              ),
          child: Icon(
            icon,
            size: 20,
            color: Colors.black,
          ),
        ),
      );
    } else {
      // ถ้าไม่ใช่ IconData ให้แสดงข้อความ
      return InkWell(
  onTap: () {
    setState(() {
      if (label == Icons.close) {
        _pin = "______";
      } else if (label == Icons.backspace) {
        int underscoreIndex = _pin.indexOf('_');

        if (underscoreIndex > 0) {
          _pin = _pin.replaceRange(underscoreIndex - 1, underscoreIndex, '_');
        } else if (_pin.length == 6) {
          _pin = _pin.replaceRange(_pin.length - 1, _pin.length, '_');
        } else {
          _pin = _pin.replaceFirst('_', '_');
        }
      } else if (_pin.contains('_')) {
        int underscoreIndex = _pin.indexOf('_');
        _pin = _pin.replaceFirst('_', text, underscoreIndex);
      }
    });
  },
  child: Container(
    width: 65,
    height: 65,
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFFBBBBBB), width: 1.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          size: 22,
          color: label == Icons.backspace ? Color(0xFFBBBBBB) : Colors.black,
        ),
        SizedBox(height: 1),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 18.5,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        if (text != "")
          Text(
            text == "1"
                ? "one"
                : text == "2"
                    ? "two"
                    : text == "3"
                        ? "three"
                        : text == "4"
                            ? "four"
                            : text == "5"
                                ? "five"
                                : text == "6"
                                    ? "six"
                                    : text == "7"
                                        ? "seven"
                                        : text == "8"
                                            ? "eight"
                                            : text == "9"
                                                ? "nine"
                                                : text == "0"
                                                    ? "zero"
                                                    : "",
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
      ],
    ),
  ),
);
    }
  }

  // iconตัวโล่ กับคำว่า PIN LOGIN
  @override
  Widget build(BuildContext context) {
    var itemList = [
      SizedBox(height: 45),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.security,
            size: 70,
            color: Colors.black,
          ),
        ],
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "PIN LOGIN",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
      SizedBox(height: 80),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _pin,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF777777)
              //color: Colors.black,
            ),
          ),
        ],
      ),
      SizedBox(height: 120),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildItem(label: "1"),
          SizedBox(width: 13),
          buildItem(label: "2"),
          SizedBox(width: 13),
          buildItem(label: "3"),
        ],
      ),
      SizedBox(height: 13),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildItem(label: "4"),
          SizedBox(width: 13),
          buildItem(label: "5"),
          SizedBox(width: 13),
          buildItem(label: "6"),
        ],
      ),
      SizedBox(height: 13),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildItem(label: "7"),
          SizedBox(width: 13),
          buildItem(label: "8"),
          SizedBox(width: 13),
          buildItem(label: "9"),
        ],
      ),
      SizedBox(height: 13),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildItem(label: Icons.close),
          SizedBox(width: 13), 
          buildItem(label: "0"),
          SizedBox(width: 13),
          buildItem(label: Icons.backspace),
        ],
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: itemList,
        ),
      ),
    );
  }
}
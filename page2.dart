import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  final String pass;
  final bool isCheck;
  final String selectGender;
  final bool isSwitched;
  final double slideValue;

  const Page2({
    required this.pass,
    super.key,
    required this.isCheck,
    required this.selectGender,
    required this.isSwitched,
    required this.slideValue,
  });
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Results'),
        backgroundColor: Color(0xffB1AFFF),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Color(0xffBBE9FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name Lastname: ${widget.pass}',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold )),
                Text('Is adult: ${widget.isCheck}',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                Text('Is smoking: ${widget.isSwitched}',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                Text('How many cigaret: ${widget.slideValue}',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                Text('Gender: ${widget.selectGender}',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

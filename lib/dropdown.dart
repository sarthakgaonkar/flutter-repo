import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String selectedvalue = 'Orange';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 70,
              color: Colors.lightBlueAccent,
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedvalue,
                onChanged: (String? newvalue){
                  setState(() {
                    selectedvalue = newvalue!;
                  });
                },
                items: <String>['Orange', 'Apple', 'Banana', 'Grapes'].map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem(value: value,
                      child: Text(value));
                }).toList(),
              ),
            )
          ]
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String selectedValue = 'Orange';
  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  final _formkey = GlobalKey<FormState>();
  trysubmit()
  {
    final isvalid = _formkey.currentState!.validate();
    if (isvalid) {
      _formkey.currentState!.save();
      submitForm();
    }
    else{
      print('Error');
    }
  }

  submitForm() {
    print(firstname);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Firstname:'),
                    key: const ValueKey('firstname'),
                    validator: (value) {
                      if (value.toString().isEmpty)
                      {
                        return 'Firstname empty';
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      firstname = value.toString();
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Lastname:'),
                    key: const ValueKey('lastname'),
                    validator: (value) {
                      if (value.toString().isEmpty)
                      {
                        return 'Lastname empty';
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      lastname = value.toString();
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Email:'),
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value.toString().isEmpty || !value.toString().contains('@'))
                      {
                        return 'Email empty';
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      email = value.toString();
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password:'),
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value.toString().length<=5)
                      {
                        return 'Password should be atleast 6 chars';
                      }
                      else if (!RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*[\d])(?=.*[\W_])')
                          .hasMatch(value.toString())) {
                        return 'Password should contain at least one symbol, one number, one uppercase letter, and one lowercase letter';
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      password = value.toString();
                    },
                  ),
                  TextButton(onPressed: (){
                    trysubmit();
                  }, child: Text('Submit'))
                ],
              )
          ),
        ),
      ),
    );
  }
}

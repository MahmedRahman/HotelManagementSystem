import 'package:flutter/material.dart';

import '../../../../core/shared_components/build_button.dart';
import '../../../../core/shared_components/build_text_form_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children: [Body()],
      ),
    );
  }
}

class Body extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'image/illustration-1.png',
          width: 300,
        ),
        Container(
          width: 320,
          child: _formLogin(),
        )
      ],
    );
  }

  Widget _formLogin() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTextFormField(
            requiredFiled: true,
            labelText: 'البريد الإلكتروني',
            onSaved: (value) {},
          ),
          SizedBox(height: 30),
          buildTextFormField(
            requiredFiled: true,
            labelText: 'الرقم السري',
            onSaved: (value) {
              // customer.email = value.toString();
            },
          ),
          SizedBox(height: 40),
          buildButton(
            text: 'حفظ',
            onPressed: () {
              if (_formKey.currentState!.validate() == false) {
                return;
              }
              _formKey.currentState!.save();
            },
          ),
        ],
      ),
    );
  }
}

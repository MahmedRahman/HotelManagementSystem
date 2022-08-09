import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/features/auth/presentation/controller/auth_controller.dart';

import '../../../../core/shared_components/build_button.dart';
import '../../../../core/shared_components/build_text_form_field.dart';

class LoginPage extends GetView<AuthController> {
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

class Body extends GetView<AuthController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
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
          child: _formLogin(controller),
        )
      ],
    );
  }

  Widget _formLogin(AuthController controller) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTextFormField(
              requiredFiled: true,
              labelText: 'البريد الإلكتروني',
              onSaved: (value) {},
              controller: _email),
          SizedBox(height: 30),
          buildTextFormField(
              requiredFiled: true,
              labelText: 'الرقم السري',
              onSaved: (value) {},
              controller: _password),
          SizedBox(height: 40),
          buildButton(
            text: 'حفظ',
            onPressed: () {
              if (_formKey.currentState!.validate() == false) {
                return;
              }
              _formKey.currentState!.save();

              controller.login(_email.text, _password.text);
            },
          ),
        ],
      ),
    );
  }
}

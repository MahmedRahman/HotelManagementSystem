import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/features/auth/presentation/controller/auth_controller.dart';

import '../../../../constans/app_constants.dart';
import '../../../../core/shared_components/build_button.dart';
import '../../../../core/shared_components/build_text_form_field.dart';
import '../widgets/login_register_selector.dart';

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
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: .6,
            blurRadius: 6,
            offset: const Offset(0, 0),
          ),
        ], color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthTypeSelector(
              selectedIndexCallBack: (int value) =>
                  _selectedIndexNotifier.value = value,
              initValue: _selectedIndexNotifier.value,
            ),
            kSizedBoxSpaceW30(),
            ValueListenableBuilder(
              valueListenable: _selectedIndexNotifier,
              child: _formLogin(controller),
              builder: (BuildContext context, int selectedIndex, child) =>
                  AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                child: Container(
                    key: ValueKey(_selectedIndexNotifier.value),
                    width: 320,
                    child:
                        selectedIndex == 0 ? child : _formRegister(controller)),
              ),
            ),
          ],
        ),
      ),
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
          kSizedBoxSpaceW30(),
          buildTextFormField(
              requiredFiled: true,
              labelText: 'الرقم السري',
              onSaved: (value) {},
              controller: _password),
          kSizedBoxSpaceW30(),
          buildButton(
            text: 'تسجيل الدخول',
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

  Widget _formRegister(AuthController controller) {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          buildTextFormField(
              requiredFiled: true,
              labelText: 'الاسم',
              onSaved: (value) {},
              controller: _name),
          kSizedBoxSpaceW30(),
          buildTextFormField(
              requiredFiled: true,
              labelText: 'البريد الإلكتروني',
              onSaved: (value) {},
              controller: _email),
          kSizedBoxSpaceW30(),
          buildTextFormField(
              requiredFiled: true,
              labelText: 'الرقم السري',
              onSaved: (value) {},
              controller: _password),
          kSizedBoxSpaceW30(),
          buildButton(
            text: 'تسجيل عضو جديد',
            onPressed: () {
              if (_registerFormKey.currentState!.validate() == false) {
                return;
              }
              _registerFormKey.currentState!.save();

              controller.createAccount(_name.text, _email.text, _password.text);
            },
          ),
        ],
      ),
    );
  }
}

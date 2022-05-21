// ignore_for_file: avoid_single_cascade_in_expression_statements, prefer_const_constructors_in_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:nijad_app/components/valid.dart';
import 'package:nijad_app/constonts.dart';
import 'package:nijad_app/main.dart';
import '../components/crud.dart';
import '../components/linkapi.dart';
import '../widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Crud _crud = Crud();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    //double height = MediaQuery.of(context).size.height;

    login() async {
      if (formstate.currentState!.validate()) {
        isLoading = true;
        setState(() {});
        var response = await _crud.postRequest(LinkLogin, {
          "email": email.text,
          "password": password.text,
        });
        isLoading = false;
        setState(() {});
        if (response['status'] == 'success') {
          sherfPre.setString("id", response['data']['id'].toString());
          sherfPre.setString("user_name", response['data']['user_name']);
          sherfPre.setString("email", response['data']['email']);
          Navigator.of(context)
              .pushNamedAndRemoveUntil('MyHomePage', (route) => false);
        } else {
          /* AwesomeDialog(
              context: context,
              title: "تنبيه",
              body: const Text(
                  "البريد الالكتروني او الكلمة المرور غير صحيحة او غير موجودة"))
            ..show();*/
        }
      }
    }

    return Scaffold(
      backgroundColor: kMainColors,
      body: Form(
        key: formstate,
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .20,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('images/icons/macaroon.png'),
                          const Positioned(
                            bottom: 0,
                            child: Text(
                              'Nijad Patiss',
                              style:
                                  TextStyle(fontFamily: 'Styles', fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomTextField(
                      valid: (val) {
                        return validInput(val!, 10, 20);
                      },
                      myController: email,
                      hint: 'Taper vouter E-Mail  -  اكتب العنوان الالكتروني',
                      icon: Icons.email),
                  CustomTextField(
                      valid: (val) {
                        return validInput(val!, 6, 20);
                      },
                      myController: password,
                      hint: 'Taper vouter Mode de passe  - اكتب كلمة مرور',
                      icon: Icons.lock),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(120)),
                      onPressed: () async {
                        await login();
                      },
                      color: Colors.black,
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'J \' ai un compte ? ',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'SignUp');
                        },
                        child: const Text(
                          'Logn',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}

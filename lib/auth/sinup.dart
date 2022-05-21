// ignore_for_file: prefer_final_fields, must_be_immutable, annotate_overrides, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:nijad_app/components/crud.dart';
import 'package:nijad_app/components/valid.dart';
import 'package:nijad_app/constonts.dart';
import '../components/linkapi.dart';
import '../widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Crud _crud = Crud();
  bool isLoading = false;
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController telephone = TextEditingController();
    TextEditingController password = TextEditingController();
    //TextEditingController Cofpassword = TextEditingController();

    signUp() async {
      if (formstate.currentState!.validate()) {
        isLoading = true;
        setState(() {});

        var response = await _crud.postRequest(linkSinUp, {
          "user_name": username.text,
          "email": email.text,
          "telephone": telephone.text,
          "password": password.text,
          //"Cofpassword": Cofpassword.text,
        });
        // if (password.text == Cofpassword.text) {
        // return "le Mode de passe in valide";
        //}
        isLoading = false;
        setState(() {});

        if (response['status'] == 'success') {
          Navigator.of(context).pushReplacementNamed('MyHomePage');
        } else {
          print("SignUp Fail");
        }
      }
    }

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColors,
      body: Form(
        key: formstate,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: isLoading == true
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Center(child: CircularProgressIndicator()),
                      ],
                    )
                  : Container(
                      height: height * 0.15,
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
                return validInput(val!, 3, 20);
              },
              myController: username,
              hint: 'Entrez vouter Nom  -  ادخل اسم المستخدم',
              icon: Icons.person,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
                valid: (val) {
                  return validInput(val!, 10, 50);
                },
                myController: email,
                hint: 'Entrez vouter Email - ادخل العنوان الالكتروني',
                icon: Icons.email),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
                valid: (val) {
                  return validInput(val!, 10, 10);
                },
                myController: telephone,
                hint: 'Entrez votre numéro téléphone  -  ادخل رقم هاتفك',
                icon: Icons.phone),
            SizedBox(height: height * .01),
            CustomTextField(
                valid: (val) {
                  return validInput(val!, 6, 20);
                },
                myController: password,
                hint: 'Taper vouter Mode de passe  - اكتب كلمة مرور',
                icon: Icons.lock),
            SizedBox(height: height * .01),
            /* CustomTextField(
                myController: Cofpassword,
                hint: 'Confirmation vouter Mode de passe  - تاكيد كلمه السر',
                icon: Icons.lock),*/
            SizedBox(height: height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.black,
                onPressed: () async {
                  await signUp();
                },
                child: const Text(
                  'Sin Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'tu as un compte - لديك حساب ?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("Login", (route) => false);
                  },
                  child: const Text(
                    '    Logn',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

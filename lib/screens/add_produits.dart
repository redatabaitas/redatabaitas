// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nijad_app/constonts.dart';
import 'package:nijad_app/widgets/custom_text_field.dart';

import '../widgets/custom_textfield_product.dart';

class AddProduits extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AddProduits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController Produits = TextEditingController();
    TextEditingController Produits1 = TextEditingController();
    TextEditingController Quontite = TextEditingController();
    TextEditingController Prix = TextEditingController();
    TextEditingController Designation = TextEditingController();

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Nijad Patiss',
                style: TextStyle(fontFamily: 'Styles', fontSize: 24))),
      ),
      backgroundColor: kMainColors,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .15,
                alignment: Alignment.center,
                child: Stack(
                  children: const [
                    Positioned(
                      child: Text(
                        'Produit En Stock',
                        style: TextStyle(
                            fontFamily: 'Styles',
                            fontSize: 38,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomTextFieldProduct(
                myController: Produits,
                hint: 'Enter vous Produits',
                icon: Icons.production_quantity_limits),
            SizedBox(height: height * .015),
            CustomTextFieldProduct(
                myController: Produits1,
                hint: 'ادخل اسم المنتج',
                icon: Icons.production_quantity_limits),
            SizedBox(height: height * .015),
            CustomTextFieldProduct(
                myController: Quontite,
                hint: 'Quontite - الكمية',
                icon: Icons.sports_cricket),
            SizedBox(height: height * .015),
            CustomTextFieldProduct(
                myController: Prix,
                hint: 'Prix - الثمن',
                icon: Icons.price_change),
            SizedBox(height: height * .015),
            CustomTextFieldProduct(
                myController: Designation,
                hint: 'Désignation - اسم',
                icon: Icons.sports_cricket),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MaterialButton(
                onPressed: () {},
                color: kMaterialBottom,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'اخد صورة',
                  style: TextStyle(
                    fontFamily: 'Styles',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: MaterialButton(
                onPressed: () {
                  _globalKey.currentState!.validate();
                },
                color: kMaterialBottom,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Valider',
                  style: TextStyle(
                    fontFamily: 'Styles',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

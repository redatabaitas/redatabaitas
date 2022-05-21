import 'package:flutter/material.dart';
import 'package:nijad_app/constonts.dart';
import 'package:nijad_app/main.dart';
import '../widgets/custom_listview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColors,
        title: const Center(
          child: Text(
            "محل نجاد",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              sherfPre.clear();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("Login", (route) => false);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("AddProduits");
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const CustomListview(
          image: 'images/icons/stock.png',
          title: 'Title Notes',
          subtitle: 'subtitle Notes',
          prix: '20 dh',
        ),
      ),
    );
  }
}

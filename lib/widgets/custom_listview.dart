import 'package:flutter/material.dart';

class CustomListview extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String prix;

  const CustomListview({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.prix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {},
          child: Card(
            borderOnForeground: false,
            elevation: 10,
            shadowColor: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    image,
                    width: 100,
                    height: 100,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(title),
                    subtitle: Text(subtitle),
                    trailing: Text(prix),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

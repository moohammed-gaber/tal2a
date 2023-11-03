import 'package:cashier/app/presentation/pages/categories_page.dart';
import 'package:cashier/app/presentation/pages/items_page.dart';
import 'package:cashier/core/presentation/extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('طلقه')),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 200),
        children: [
          HomeGridCard(
            title: 'الاوردرات',
            onTap: () {},
            icon: Icon(
              Icons.add_business_rounded,
              size: 150,
            ),
          ),
          HomeGridCard(
            onTap: () {
              context.toPage(ItemsPage());
            },
            title: 'الاصناف',
            icon: Icon(
              Icons.fastfood,
              size: 150,
            ),
          ),
          HomeGridCard(
            onTap: () {
              context.toPage(CategoriesPage());
            },
            title: 'الاقسام',
            icon: Icon(
              Icons.category_outlined,
              size: 150,
            ),
          ),
        ],
      ),
    );
  }

  Icon generateIcon() {
    return Icon(
      Icons.add_business_rounded,
      size: 150,
    );
  }
}

class HomeGridCard extends StatelessWidget {
  const HomeGridCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Text(
              title,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

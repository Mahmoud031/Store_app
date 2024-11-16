import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.cartPlus, color: Colors.black))
          ],
          backgroundColor: Colors.white,
          title: const Text(
            'New trend',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 70),
            child: FutureBuilder<List<ProductModel>>(
                future: AllProductsServices()
                    .getAllProducts(), // the data that will get
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> products =snapshot.data!;
                    return GridView.builder(
                      itemCount: products.length,
                        clipBehavior: Clip.none,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                1.5, // the precentage of width to the height
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 100),
                        itemBuilder: (context, index) {
                          return CustomCard(product: products[index],);
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfield.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Update Product'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextfield(
                    onChanged: (data) {
                      productName = data;
                    },
                    hintText: 'product Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText: 'description',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                    onChanged: (data) {
                      price = (data);
                    },
                    inputType: TextInputType.number,
                    hintText: 'Price',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'image',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: 'Update',
                    onTap: () async{
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProduct(product);
                        print('Success');
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
     await UpdateProduct().updateProduct(
      // check if the data come with null value from the API
        title: productName==null ? product.title : productName !,
        price: price == null ? product.price.toString() : price!,
        desc:  desc == null ? product.description :desc!,
        image: image == null ? product.image :image!,
        category: product.category, id: product.id);
    }
}

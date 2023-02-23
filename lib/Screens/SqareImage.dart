import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/Screens/ProductListController.dart';



class ProductList extends StatelessWidget {

  ProductList({super.key});

  ProductListController productListController = Get.put(
      ProductListController());

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     itemCount: titles.length,
    //     itemBuilder: (context, index) {
    //       return Card(
    //           child: ListTile(
    //               title: Text(loginController.productList as String),
    //               subtitle: Text(subtitles[index]),
    //
    //               leading: CircleAvatar(
    //                   backgroundImage: NetworkImage(
    //                       "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
    //
    //           )
    //       );
    //     });
     return Expanded(
      child: ListView.builder(
         itemCount: productListController.prodcts.length,
         itemBuilder: (BuildContext context, int index) {
          print(productListController.prodcts[index].item_name);
          final _productlistModel = productListController.prodcts[index];
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          _productlistModel.item_name,
                        ),
                        Text(_productlistModel.item_rate),
                        Text(_productlistModel.item_qty),
                        Image.asset(_productlistModel.item_image)
                      ],
                    ),

                  ),
                ],
              ),
            ),
          );
         },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/data/models/category_model.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/AppLayout.dart';
import '../../core/utils/Styles.dart';
import '../modules/product_details/products_detailed_controller.dart';
import '../modules/product_details/products_detailed_screen.dart';

class CathegoryItem extends StatelessWidget {
   CathegoryItem({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;
  final ProductsController _productListController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      //  _productListController.categoryName.value = category.categoryName!;
        _productListController.getProductDetails(category.categoryId!);
        Get.to(ProductsDetailedScreen( categoryName: category.categoryName!,));
      },
      child: Container(
        height: 50.h,
        width: 95.w,
        margin: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: context.theme.colorScheme.surface,
              blurRadius: 1.0,
              spreadRadius: 1, //New
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(1.h),
          child: Column(
            children: [
              Container(
                  height: 40.h,
                  width: 85.w,
                  margin: EdgeInsets.all(1.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: context.theme.colorScheme.surface,
                        blurRadius: 1.0,
                        spreadRadius: 1, //New
                      )
                    ],
                  ),
                  child: Image.network(
                    category.imageurl!,
                    height: 100.h,
                    width: 100.w,
                  )),
              SizedBox(
                height: AppLayout.getHeight(5),
              ),
              Text(
                "${category.categoryName}",
                style: heading1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

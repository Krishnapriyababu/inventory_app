
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/data/models/product_model.dart';
import 'package:inventory_app/app/widgets/product_data_widget.dart';
import 'package:inventory_app/app/widgets/quantity_enter_dialogue.dart';
import 'package:sizer/sizer.dart';
import '../global_controller/firebasecontroller.dart';
import '../modules/product_details/products_detailed_controller.dart';


class ProductItemDetail extends StatelessWidget {

 ProductItemDetail(
{Key? key, required this.productdata,
})
: super(key: key);
final Products productdata;
ProductsController productsController = Get.put(ProductsController());
FirebaseController _firebaseController = Get.put(FirebaseController());
@override
Widget build(BuildContext context) {
  return InkWell(
    onTap: (){

    },
    child: Container(
      height: 15.h,
      width: 95.w,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius:
          const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
              color: Colors.blueGrey),),
      margin: EdgeInsets.all(1.h),
      child: Row(
        children: [
          Container(
                width: 10.h,
                height: 10.h,
            margin:  EdgeInsets.only(left: 1.h),
            //   margin: const EdgeInsets.only(top: 10,bottom: 700),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.black12),
                image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productdata.productImage!)
                )
            ),
          ),
          SizedBox(height: 2.h),


          Container(
            width: 65.w,
            height: 12.h,
            // color: Colors.blue,
            margin: EdgeInsets.only(left: 2.w, top: 2.w),
            child: Column(
              children: [
                ProductDataWidget(
                  data: productdata.productName!,
                  title: '',
                ),
                SizedBox(
                  height: 2.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductDataWidget(
                      data: productdata.productId!,
                      title: 'Pdt Id : ',
                    ),
                    ProductDataWidget(
                      data: productdata.categoryId!,
                      title: 'Ctg Id : ',
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductDataWidget(
                      data: productdata.productRate!,
                      title: 'Pdt price : ',
                    ),
                    InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            backgroundColor:
                            context.theme.colorScheme.background,
                            titleStyle: TextStyle(
                                color: context.theme.colorScheme.background),
                            middleTextStyle: TextStyle(
                                color: context.theme.colorScheme.background),
                            content: QuantityDetails(
                              productdata: productdata,
                            ),
                            textConfirm: "Add Stock",
                            confirmTextColor: Colors.black,
                            buttonColor: context.theme.colorScheme.primary,
                            onConfirm: () {
                              if(productsController.quantity != ""){
                                _firebaseController.addStockToFirebase(productdata,productsController.quantity.text);
                                productsController.quantity.text = "";
                              }
                            });
                      },
                      child: Container(
                        width: 4.h,
                        height: 4.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black54),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/addtostock.png"))),
                      ),
                    )
                  ],
                )
              ],
            ),
          )


        ],
      ),
    ),
  );
}
}
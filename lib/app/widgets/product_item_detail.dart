
import 'package:flutter/material.dart';
import 'package:inventory_app/app/data/models/product_model.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/Styles.dart';


class ProductItemDetail extends StatelessWidget {
const ProductItemDetail(
{Key? key, required this.productdata,
})
: super(key: key);
final Products productdata;

@override
Widget build(BuildContext context) {
  return InkWell(
    onTap: (){
      // Get.to(() =>
      //     DetailedViewScreen(
      //   details: placeDetail,
      // )
      // );
    },
    child: Container(
      height: 20.h,
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
                width: 15.h,
                height: 15.h,
            margin:  EdgeInsets.only(left: 1.h),
            //   margin: const EdgeInsets.only(top: 10,bottom: 700),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.black12),
                image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productdata.productImage!))),
          ),
          SizedBox(height: 2.h),


          Container(
            width: 55.w,
            height: 15.h,
            color: Colors.blue,
            margin: EdgeInsets.only(left: 1.w),
            child:        Column(
              children: [
                Text(
                  productdata.productName!,
                  style: heading4,
                ),
              ],
            ),
          )


        ],
      ),
    ),
  );
}
}
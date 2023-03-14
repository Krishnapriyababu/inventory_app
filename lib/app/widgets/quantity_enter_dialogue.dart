
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:inventory_app/app/widgets/custom_textfield.dart';
import 'package:inventory_app/app/widgets/text-field-input.dart';
import 'package:inventory_app/app/widgets/text_input_dailgoue_web.dart';
import 'package:inventory_app/app/widgets/textfield_input_web.dart';

import 'package:sizer/sizer.dart';
import '../../core/utils/Styles.dart';

import '../data/models/product_model.dart';
import '../modules/product_details/products_detailed_controller.dart';

class QuantityDetails extends StatelessWidget {
   QuantityDetails({Key? key, required this.productdata}) : super(key: key);
  final Products productdata;
  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.put(ProductsController());
    return Container(
            child: Column(children: [

          Text(
            "Enter Quantity",
            style:
                headingweb6.copyWith(color: context.theme.colorScheme.secondary),
          ),
              TextInputField(
                controller: productsController.quantity,
                icon: Icons.onetwothree_sharp,
                hint: 'Quantity',
                inputType: TextInputType.number,
                inputAction: TextInputAction.next,
              ),
        ]));
  }
}

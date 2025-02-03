import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/view/global%20widget/rounded_icon_btn.dart';
import 'package:my_store/view/screens/admin/controller/add_item_controller.dart';

class AddItemScreen extends StatelessWidget {
  final AddItemController controller = Get.put(AddItemController());

  AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _textfield("Title", 1, controller.title),
            _nomricTextfield("Price ", controller.price),
            _nomricTextfield("Old Price ", controller.oldPrice),
            _nomricTextfield("Rating ", controller.rating),
            _nomricTextfield("Quatity ", controller.quantity),
            _textfield("Description ", 6, controller.desc),
            GetBuilder<AddItemController>(builder: (controller) {
              return _colorsPicker(controller);
            }),
            _categeries(),
            _imagePicker(),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: controller.onSaveClicked,
              child: const Text("Save Item"),
            )
          ],
        ),
      ),
    );
  }

  Widget _nomricTextfield(hintText, controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: MyColors.matteCharcoal.withOpacity(0.4))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.elsie)),
            label: Text(hintText),
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: MyColors.matteCharcoal.withOpacity(0.4))),
      ),
    );
  }

  Widget _textfield(hintText, maxLines, controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: MyColors.matteCharcoal.withOpacity(0.4))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.elsie)),
            label: Text(hintText),
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: MyColors.matteCharcoal.withOpacity(0.4))),
      ),
    );
  }

  Widget _colorsPicker(AddItemController controller) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _pickerDot(controller, Colors.red),
              _pickerDot(controller, Colors.orange),
              _pickerDot(controller, Colors.yellow),
              _pickerDot(controller, Colors.green),
              _pickerDot(controller, Colors.lightGreenAccent),
              _pickerDot(controller, Colors.blue),
              _pickerDot(controller, Colors.purple),
              _pickerDot(controller, Colors.white),
              _pickerDot(controller, Colors.brown),
              _pickerDot(controller, Colors.grey),
              _pickerDot(controller, Colors.black),
            ],
          ),
        ));
  }

  GestureDetector _pickerDot(AddItemController controller, Color color) {
    return GestureDetector(
        onTap: () {
          controller.colorPick(color);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 2),
          padding: const EdgeInsets.all(3),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
                width: 2,
                color: controller.colorList.contains(color)
                    ? MyColors.elsie
                    : Colors.transparent),
            shape: BoxShape.circle,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: controller.colorList.contains(color)
                ? SvgPicture.asset(
                    "assets/icons/Check mark rounde.svg",
                    colorFilter: const ColorFilter.mode(MyColors.elsie, BlendMode.srcIn),
                    width: 22,
                  )
                : Container(),
          ),
        ));
  }

  Widget _imagePicker() {
    return GetBuilder<AddItemController>(builder: (controller) {
      return Row(
        children: [
          Text(
            "images selected ${controller.images.length}",
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: controller.addImage,
          ),
        ],
      );
    });
  }

  Widget _categeries() {
    return SizedBox(
      width: double.infinity,
      child: GetBuilder<AddItemController>(
        builder: (controller) {
          return DropdownButton(
            hint: Text(controller.category),
            items: categories
                .map((category) =>
                    DropdownMenuItem(value: category, child: Text(category)))
                .toList(),
            onChanged: controller.setCategory,
          );
        }
      ),
    );
  }
}

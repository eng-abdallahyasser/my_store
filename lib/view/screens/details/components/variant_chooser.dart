import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_store/controller/detailes_screen_controller.dart';
import 'package:my_store/data/model/variant.dart';

class VariantChooser extends StatelessWidget {
  /// A list of variant groups. Each inner list represents a group of options.
  final List<List<Variant>> options;
  final DetailesScreenController controller;

  /// Optional callback that returns the list of selected variants once all groups have a selection.
  final void Function(List<Variant> selectedVariants)? onSelectionComplete;

  const VariantChooser({
    super.key,
    this.onSelectionComplete,
    required this.options,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(options.length, (groupIndex) {
          // Wrap each group's row in an Obx to update when selection changes.
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Optional label for the group.
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Choose option ${groupIndex + 1}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              GetBuilder<DetailesScreenController>(builder:  (controller) {
                // Get the currently selected variant for this group.
                Variant? selected = controller.product.options[groupIndex][0];
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: options[groupIndex].map((variant) {
                      bool isSelected = selected.id == variant.id;
      
                      return GestureDetector(
                        onTap: () {
                          controller.selectVariant(groupIndex, variant);
                          // If every group has a selection, invoke the callback.
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected ? Colors.blue : Colors.grey,
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                variant.name,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                '\$${variant.price.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}

import 'package:event_manager/Models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key,required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: categoryModel.color.shade400,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: categoryModel.color.shade100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(categoryModel.icon, color: categoryModel.color.shade700, size: 32),
          const SizedBox(height: 8),
          Text(
            categoryModel.title,
            style: TextStyle(
              color: categoryModel.color.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );;
  }
}
import 'package:event_manager/const/data.dart';
import 'package:event_manager/widgets/Category_Card.dart';
import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
   {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        itemCount:data.categoryList.length ,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
       itemBuilder: (contex, index) {
        print('index: $index');
          return CategoryCard(categoryModel:  data.categoryList[index], index: index); },
       
      ),
    );
  }
  }
}
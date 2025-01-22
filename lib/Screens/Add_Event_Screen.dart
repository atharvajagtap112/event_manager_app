import 'dart:io';

import 'package:event_manager/Models/category_model.dart';
import 'package:event_manager/const/data.dart';
import 'package:event_manager/controller/add_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
 

  @override
  Widget build(BuildContext context) {
    final controller=AddEventController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Event'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: controller.titleController,
                  decoration: const InputDecoration(
                    labelText: 'Event Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter event title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
               DropdownButtonFormField(
              
                items:data.categoryList.map((value)=> DropdownMenuItem(
                  value: value,
                  child: Text(value.title),
                )).toList(),
                onChanged: (value) {
                 
                  controller.selectedCategory.value=value as CategoryModel;
                },),
                const SizedBox(height: 16),
                Obx(
                  ()=> InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) {
                      
                          controller.selectedDate.value = picked;
                      
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(
                         controller.selectedDate.value != null
                            ? DateFormat('yyyy-MM-dd').format( controller.selectedDate.value!)
                            : 'Select Date',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  ()=> InkWell(
                    onTap: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                       
                          controller.selectedTime.value = picked;
                        
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Time',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(
                        controller.selectedTime.value != null
                            ? controller.selectedTime.value!.format(context)
                            : 'Select Time',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.venueController,
                  decoration: const InputDecoration(
                    labelText: 'Venue',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter venue';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.organizerController,
                  decoration: const InputDecoration(
                    labelText: 'Organizer',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter organizer name';
                    }
                    return null;
                  },
                ),
             

                 const SizedBox(height: 16),
                TextFormField(
                  controller: controller.registrationLinkController,
                  decoration: const InputDecoration(
                    labelText: 'Add Registration Link',
                    border: OutlineInputBorder(),
                  ),
                 
                ),


                   Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Poster',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Obx(() => 
                    controller.selectedImagePath.value.isEmpty
                      ? GestureDetector(
                          onTap: controller.pickImage,
                          child: Container(
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Icon(
                              Iconsax.image,
                              size: 32,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : 
                            Stack(
                              children: [
                                Container(
                                  width: 200,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    image: DecorationImage(
                                      image: FileImage(File(controller.selectedImagePath.value)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.selectedImagePath.value = '';
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Iconsax.close_square,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                          
                        ),
                    
                  ],
                ),
              
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => controller.postEvents()
                    
                  ,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Create Event',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
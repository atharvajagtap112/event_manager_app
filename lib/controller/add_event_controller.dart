import 'package:event_manager/Models/category_model.dart';
import 'package:event_manager/Models/event_model.dart';
import 'package:event_manager/Repositories/event_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddEventController extends GetxController {
  static AddEventController get instance => Get.find();
    final formKey = GlobalKey<FormState>();
  final selectedDate = Rxn<DateTime>();
  final selectedTime = Rxn<TimeOfDay>();

  final Rx<XFile?> selectedImage=Rx<XFile?>(null);
  final RxString selectedImagePath = ''.obs;
   
   final Rx<CategoryModel> selectedCategory=CategoryModel.empty().obs;
   
  final TextEditingController titleController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  final TextEditingController organizerController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController attendeesController = TextEditingController();
   final TextEditingController registrationLinkController = TextEditingController(); 
   


  final addEventRepo=EventRepo();

  //Image Picker
  void pickImage() async {
   final XFile? image=await ImagePicker().pickImage(source: ImageSource.gallery);
      
      if(image!=null){
       selectedImage.value=image;
       selectedImagePath.value=image.path;
      }       
  }

  Future<void> postEvents() async{
    try{
    if(!formKey.currentState!.validate()){
      print("Not validd");
      return;
    }
    print('Processing');
    EventModel event = EventModel(
        title: titleController.value.text,
        category: selectedCategory.value,
        venue: venueController.value.text,
        organizer: organizerController.value.text,
        imageUrl: "",
        registrationLink: registrationLinkController.value.text, 
        date: selectedDate.value,
        time: selectedTime.value,

        
        );
        
       await addEventRepo.addEvent(event,selectedImage.value! );


       
     Get.showSnackbar(const GetSnackBar(
      message: 'Event Added Successfully',
      duration: Duration(seconds: 2)));
  } 
  catch(e){
    print(e.toString()) ;
  }
   
  }

}
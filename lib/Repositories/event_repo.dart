import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_manager/Models/event_model.dart';
import 'package:event_manager/Utils/firebase_storage_service.dart';
import 'package:image_picker/image_picker.dart';

class EventRepo {
  final _db=FirebaseFirestore.instance;

  final FirebaseStorage =TFirebaseStorageService();

  Future<void> addEvent(EventModel event, XFile file) async{
    try{
      print("sjshsjkhsakdhaskjasl");
      String url= await   FirebaseStorage.uploadImageFile("Events/Images", file);
       event.imageUrl=url;
       print("Image added");
      await _db.collection('events').add(event.toJson());
    }catch(e){
     throw e.toString();
    }
  } 

  Future<List<EventModel>> getEvents() async{
    try{
      final snapshot=await _db.collection('events').get();
      print("lengthhhhhhhh"+snapshot.docs.length.toString());
      return snapshot.docs.map((e) => EventModel.fromDocumentSnapshot(e)).toList();
    }catch(e){
      throw e.toString();
    }
  }
  
}
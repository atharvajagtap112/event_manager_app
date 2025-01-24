import 'package:event_manager/Models/event_model.dart';
import 'package:event_manager/Repositories/event_repo.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  static EventController get instance => Get.find<EventController>();

  RxList<EventModel> eventsList =<EventModel>[].obs;
  final EventRepo eventRepo = EventRepo();
  
  @override
   onInit() {
    getEvents();
    super.onInit(); 
   }

  Future<List<EventModel> > getEvents() async {
    try{
    final list=  await eventRepo.getEvents();
    eventsList.addAll(list);
    return list;
  } 
    catch(e){
      print(e.toString());
      return [];
      
      
    }
  }
  
  Future<List<EventModel>> getEventById(String id) async{
   return eventsList.where( (event)=> event.id==id).toList();
  }
  

}
import 'package:event_manager/Events/Event_Widgets/appbar.dart';
import 'package:event_manager/Events/Event_Widgets/event_card.dart';
import 'package:event_manager/Events/Event_Widgets/featured_event.dart';
import 'package:event_manager/Screens/Add_Event_Screen.dart';
import 'package:event_manager/controller/event_controller.dart';
import 'package:event_manager/widgets/event_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class EventDashboard extends StatefulWidget {
  const EventDashboard({super.key});

  @override
  State<EventDashboard> createState() => _EventDashboardState();
}

class _EventDashboardState extends State<EventDashboard> with SingleTickerProviderStateMixin {
final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();
   Get.put(EventController());
    _scrollController.addListener(() {
      
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
        const  EventAppbar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const FeaturedEvent(),
               
               const EventList(),
                _buildUpcomingEvents(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildAnimatedFAB(),
    );
  }



 


  

 

  Widget _buildUpcomingEvents() {

     
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Upcoming Events',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
         Obx(
          ()=> ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:EventController.instance.eventsList.value.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => EventCard(event:  EventController.instance.eventsList.value[index])
           ),
         )]);
      
           
          

       
    
  }

 

  Widget _buildEventDetail(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedFAB() {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        // Add null check and default value for offset
        final offset = _scrollController.hasClients ? _scrollController.offset : 0.0;
        return AnimatedScale(
          scale: offset > 100 ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: FloatingActionButton.extended(
            onPressed: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const AddEventScreen())
            ),
            icon: const Icon(Icons.add),
            label: const Text('Create Event'),
          ),
        );
      },
    );
  }
}
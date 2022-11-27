import 'package:edipo/feature/questions/view/questions_view.dart';
import 'package:flutter/material.dart';

import '../../../product/widgets/bottom_sheet.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<String> _locationsList = ["Fenomen Cafe", "Bikka", "Caribou", "Arzum"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _locationsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile( 
                onTap: () {
                  customBottomSheet(context, QuestionsPage());
                },
                title: Text(_locationsList[index]),
                leading: const Icon(Icons.location_on_outlined),
                trailing: const Icon(Icons.chevron_right_rounded),
                subtitle: Text(_locationsList[index]),
              ),
              const Divider(thickness: 50,),
            ],
          );
        });
  }
}

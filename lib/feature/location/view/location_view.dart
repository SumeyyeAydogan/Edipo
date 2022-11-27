import 'package:edipo/feature/questions/view/questions_view.dart';
import 'package:flutter/material.dart';

import '../../../product/widgets/bottom_sheet.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<String> _locationsList = [
    "Fenomen Cafe",
    "Bikka",
    "Caribou",
    "Arzum",
    "Chakra Cafe"
  ];
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
                title: Text(_locationsList[index],
                    style: Theme.of(context).textTheme.headline2),
                leading: Icon(
                  Icons.location_on_outlined,
                  size: 35,
                  color: Theme.of(context).colorScheme.primary,
                ),
                trailing: Icon(
                  Icons.chevron_right_rounded,
                  size: 35,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                subtitle: Text(_locationsList[_locationsList.length - index-1]),
              ),
              const Divider(),
            ],
          );
        });
  }
}

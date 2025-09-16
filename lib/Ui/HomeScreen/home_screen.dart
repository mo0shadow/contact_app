import 'package:contact/Ui/HomeScreen/emptiy_list.dart';
import 'package:contact/Ui/HomeScreen/list_of_contact.dart';
import 'package:contact/Ui/HomeScreen/modelSheet.dart';
 
import 'package:contact/Utils/app_assets.dart';
import 'package:contact/Utils/app_colors.dart';

import 'package:flutter/material.dart';

import 'contact_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: ContactModel.contacts.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                ContactModel.contacts.removeLast();
                setState(() {});
              },
              backgroundColor: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
          Visibility(
            visible: ContactModel.contacts.length <= 6,
            child: SizedBox(height: height * 0.01),
          ),
          FloatingActionButton(
            onPressed: () {
              showbottomSheet();
            },
            backgroundColor: AppColors.gold,
            child: Icon(Icons.add, color: AppColors.darkBlue),
          ),
        ],
      ),
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.015,
              ),
              child: Image.asset(AppAssets.route, width: width * 0.4),
            ),
            Expanded(
              child: ContactModel.contacts.isEmpty
                  ? EmptiyList()
                  : ListOfContact(removeContact: removeContact),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showbottomSheet() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColors.darkBlue,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ModelSheet(),
        );
      },
    );
    setState(() {});
  }

  void removeContact(int index) {
    ContactModel.contacts.removeAt(index);
    setState(() {});
  }
}

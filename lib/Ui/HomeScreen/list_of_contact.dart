import 'package:contact/Utils/app_colors.dart';
import 'package:contact/Utils/app_text_style.dart';

import 'package:flutter/material.dart';

import 'contact_model.dart';

class ListOfContact extends StatefulWidget {
  final Function(int index) removeContact;
  const ListOfContact({super.key,required this.removeContact});

  @override
  State<ListOfContact> createState() => _ListOfContactState();
}

class _ListOfContactState extends State<ListOfContact> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: width * 0.04,
          crossAxisSpacing: height * 0.02,
          childAspectRatio: 177 / 288,
        ),
        itemCount: ContactModel.contacts.length,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(color: AppColors.gold),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image.file(
                        ContactModel.contacts[index].image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01,
                          vertical: height * 0.01,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: width * 0.01,
                          vertical: height * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(ContactModel.contacts[index].name),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.035,
                    vertical: height * 0.01,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.email, color: AppColors.darkBlue),
                          Expanded(
                            child: Text(
                              maxLines: 1,
                              ContactModel.contacts[index].email,
                              style: AppTextStyle.w500DarkBlue10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.phone, color: AppColors.darkBlue),
                          Expanded(
                            child: Text(
                              ContactModel.contacts[index].phone,
                              style: AppTextStyle.w500DarkBlue10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),

                      FilledButton(
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          removeContact(index);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete, color: Colors.white),
                            Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void removeContact(int index) {
    ContactModel.contacts.removeAt(index);
    setState(() {});
  }
}

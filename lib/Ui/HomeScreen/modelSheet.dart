import 'dart:io';

import 'package:contact/Ui/HomeScreen/text_form_fild.dart';
import 'package:contact/Utils/app_colors.dart';
import 'package:contact/Utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'contact_model.dart';

class ModelSheet extends StatefulWidget {
  const ModelSheet({super.key});

  @override
  State<ModelSheet> createState() => _ModelSheetState();
}

class _ModelSheetState extends State<ModelSheet> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? image;
  bool isFormValidated = false; // Variable to track validation state

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    selectImageFromGallery();
                  },
                  child: Container(
                    width: width * 0.35,
                    height: height * 0.16,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gold, width: 1),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: image == null
                        ? Lottie.asset("assets/animation/image_picker.json")
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.file(image!, fit: BoxFit.cover),
                          ),
                  ),
                ),
                SizedBox(width: width * 0.02),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: nameController,
                        builder: (context, name, child) => Text(
                          name.text.isEmpty && isFormValidated
                              ? "Please enter the name"
                              : name.text.isEmpty
                              ? "Name"
                              : name.text,
                          style: name.text.isEmpty && isFormValidated
                              ? AppTextStyle.w500LGold16.copyWith(
                                  color: Colors.red,
                                )
                              : AppTextStyle.w500LGold16,
                        ),
                      ),
                      Divider(color: AppColors.gold),
                      ValueListenableBuilder(
                        valueListenable: emailController,
                        builder: (context, email, child) => Text(
                          email.text.isEmpty && isFormValidated
                              ? "Please enter the email"
                              : email.text.isEmpty
                              ? "Email"
                              : email.text,
                          style: email.text.isEmpty && isFormValidated
                              ? AppTextStyle.w500LGold16.copyWith(
                                  color: Colors.red,
                                )
                              : AppTextStyle.w500LGold16,
                        ),
                      ),
                      Divider(color: AppColors.gold),
                      ValueListenableBuilder(
                        valueListenable: phoneController,
                        builder: (context, phone, child) => Text(
                          phone.text.isEmpty && isFormValidated
                              ? "Please enter the phone number"
                              : phone.text.isEmpty
                              ? "Phone"
                              : phone.text,
                          style: phone.text.isEmpty && isFormValidated
                              ? AppTextStyle.w500LGold16.copyWith(
                                  color: Colors.red,
                                )
                              : AppTextStyle.w500LGold16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the name";
                      }
                      return null;
                    },
                    hintText: "Enter User Name",
                    hintTextStyle: AppTextStyle.w400LightBlue16,
                  ),
                  SizedBox(height: height * 0.01),
                  CustomTextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the email";
                      }
                      if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    hintText: "Enter User Email",
                    hintTextStyle: AppTextStyle.w400LightBlue16,
                  ),
                  SizedBox(height: height * 0.01),
                  CustomTextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the phone number";
                      }
                      if (!RegExp(
                        r'^(?:\+20|0)(?:10|11|12|15|57)\d{8}$',
                      ).hasMatch(value)) {
                        return "Please enter a valid phone number";
                      }
                      return null;
                    },
                    hintText: "Enter User Phone",
                    hintTextStyle: AppTextStyle.w400LightBlue16,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              width: width * 0.92,
              height: height * 0.068,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isFormValidated = true; // Update validation state
                  });
                  bool isImageMissing = image == null;
                  bool isFormInvalid = !formKey.currentState!.validate();

                  if (isImageMissing || isFormInvalid) {
                    String message = "";
                    if (isImageMissing && isFormInvalid) {
                      message =
                          "Please select an image and fill all fields correctly";
                    } else if (isImageMissing) {
                      message = "Please select an image";
                    } else {
                      message = "Please fill all fields correctly";
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message, style: AppTextStyle.w400Gold16),
                        duration: Duration(seconds: 2),
                        backgroundColor: AppColors.darkBlue,
                      ),
                    );
                    return;
                  }

                  ContactModel.contacts.add(
                    ContactModel(
                      email: emailController.text,
                      image: image!,
                      name: nameController.text,
                      phone: phoneController.text,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text("Enter user", style: AppTextStyle.w500DarkBlue14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectImageFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      var selectedImage = await picker.pickImage(source: ImageSource.gallery);
      if (selectedImage != null) {
        image = File(selectedImage.path);
        setState(() {});
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "An error occurred while selecting the image",
            style: AppTextStyle.w400Gold16,
          ),
          duration: Duration(seconds: 2),
          backgroundColor: AppColors.darkBlue,
        ),
      );
    }
  }
}

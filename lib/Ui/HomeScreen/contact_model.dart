import 'dart:io';

class ContactModel {
  static List<ContactModel> contacts = [];

  final String name;
  final String email;
  final String phone;
  final File image;

  ContactModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });
}
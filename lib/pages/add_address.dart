import 'dart:developer';

import 'package:fashionista/widgets/custom_app_bar.dart';
import 'package:fashionista/widgets/custom_button.dart';
import 'package:fashionista/widgets/custom_line.dart';
import 'package:fashionista/widgets/custom_text_field.dart';
import 'package:fashionista/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key, this.editData});
  final dynamic editData;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  void initState() {
    if (widget.editData != null) {
      log(widget.editData.toString());
      firstNameController.text = widget.editData['firstName'] ?? '';
      lastNameController.text = widget.editData['lastName'] ?? '';
      addressController.text = widget.editData['address'] ?? '';
      cityController.text = widget.editData['city'] ?? '';
      stateController.text = widget.editData['state'] ?? '';
      zipCodeController.text = widget.editData['zipCode'] ?? '';
      phoneNumberController.text = widget.editData['phoneNumber'] ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(isHome: false),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Gap(30),
                    Header(text: "Add Shipping address", size: 20),
                    Center(child: CustomLine()),
                    Gap(20),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: firstNameController,
                                    label: 'First name',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: lastNameController,
                                    label: 'Last name',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your last name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Gap(20),
                            CustomTextFormField(
                              controller: addressController,
                              label: 'Address',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your address';
                                }
                                return null;
                              },
                            ),
                            Gap(20),
                            CustomTextFormField(
                              controller: cityController,
                              label: 'City',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your city';
                                }
                                return null;
                              },
                            ),
                            Gap(20),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: stateController,
                                    label: 'State',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your state';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Gap(20),
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: zipCodeController,
                                    label: 'ZIP code',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your zip code';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            CustomTextFormField(
                              controller: phoneNumberController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                              label: 'Phone number',
                              keyboardType: TextInputType.phone,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ✅ الزر في الأسفل تمامًا
                    Spacer(),
                    CustomButton(
                      text: 'Add Address',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          final data = {
                            "firstName": firstNameController.text,
                            "lastName": lastNameController.text,
                            "address": addressController.text,
                            "city": cityController.text,
                            "state": stateController.text,
                            "zipCode": zipCodeController.text,
                            "phoneNumber": phoneNumberController.text,
                          };
                          Navigator.pop(context, data);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 200),
                              content: Text('Please fill all fields'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

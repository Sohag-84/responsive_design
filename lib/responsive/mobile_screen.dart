// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_design/constant/list.dart';
import 'package:responsive_design/controller/home_controller.dart';

import '../widgets/custom_text_field.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final zipCodeController = TextEditingController();

  final addressController = TextEditingController();

  final homeController = Get.put(HomeController());

  final dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Add User details in form bellow",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: firstNameController,
                      hintText: "eg. Abul",
                      labelText: "Last name",
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      controller: lastNameController,
                      hintText: "eg. Hossen",
                      labelText: "Last name",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: addressController,
                hintText: "eg. road no./village/district",
                labelText: "Address",
                maxLines: null,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: zipCodeController,
                      hintText: "eg. 2360",
                      labelText: "Zip Code",
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            dateController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          labelText: "DOB",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Obx(() {
                return Row(
                  children: [
                    Text(
                      "Nationality: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    DropdownButton(
                      value: homeController.chooseCountry.value,
                      items: dropDownListItem.map((element) {
                        return DropdownMenuItem(
                          child: Text(element),
                          value: element,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        homeController.changeDropdownValue(newValue);
                      },
                    ),
                  ],
                );
              }),
              SizedBox(height: 10),
              Obx(() {
                return Row(
                  children: [
                    Text(
                      "Gender: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Male",
                            groupValue: homeController.selectedRadioValue.value,
                            onChanged: (value) {
                              homeController.changeRadioValue(value);
                            }),
                        Text("Male"),
                        Radio(
                            value: "Female",
                            groupValue: homeController.selectedRadioValue.value,
                            onChanged: (value) {
                              homeController.changeRadioValue(value);
                            }),
                        Text("Female"),
                      ],
                    ),
                  ],
                );
              }),
              Row(
                children: [
                  ElevatedButton(
                    child: Text('Upload your cv'),
                    onPressed: () async {
                      homeController.selectFile();
                    },
                  ),
                  SizedBox(width: 5),
                  Obx(() {
                    return Text(
                      homeController.fileText.value,
                      style: TextStyle(decoration: TextDecoration.underline),
                    );
                  }),
                ],
              ),
              SizedBox(height: 10),
              Obx(() {
                return Row(
                  children: [
                    Switch(
                        value: homeController.switchValue.value,
                        onChanged: (value) {
                          homeController.changeSwitchValue(value);
                        }),
                    Text("Can you join in this month?"),
                  ],
                );
              }),
              Obx(() {
                return Row(
                  children: [
                    Checkbox(
                        value: homeController.checkboxValue.value,
                        onChanged: (value) {
                          homeController.changeCheckboxValue(value);
                        }),
                    Text("Do you agree with our terms & conditions?"),
                  ],
                );
              }),
              SizedBox(height: 10),
              Obx(() {
                return InkWell(
                  onTap: () {
                    if (homeController.checkboxValue == true) {
                      print("First name: ${firstNameController.text}");
                      print("Last name: ${lastNameController.text}");
                      print("Address: ${addressController.text}");
                      print("Zip code: ${zipCodeController.text}");
                      print("DOB : ${dateController.text}");
                      print(
                          "Nationality : ${homeController.chooseCountry.value}");
                      print(
                          "Gender : ${homeController.selectedRadioValue.value}");
                      print("CV file: ${homeController.fileText.value}");

                      print(
                          "Can you join this month? : ${homeController.switchValue.value}");
                    }
                  },
                  child: Container(
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: homeController.checkboxValue == true
                          ? Colors.blue
                          : Colors.blue.withOpacity(.40),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

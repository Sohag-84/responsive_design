import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:responsive_design/constant/list.dart';

class HomeController extends GetxController {
  var selectedRadioValue = "".obs;
  var checkboxValue = false.obs;
  var switchValue = false.obs;
  final chooseCountry = dropDownListItem[0].obs;
  var fileText = "".obs;

  selectFile() async {
    var picked = await FilePicker.platform.pickFiles();
    if (picked != null) {
      fileText.value = picked.files.first.name;
    }
  }

  changeDropdownValue(value) {
    chooseCountry.value = value;
    update();
  }

  changeSwitchValue(value) {
    switchValue.value = value;
  }

  changeCheckboxValue(value) {
    checkboxValue.value = value;
  }

  changeRadioValue(value) {
    selectedRadioValue.value = value;
  }
}

import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/button_widget.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/change_data_profile_view.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/select_drop_list.dart';
import 'package:reprohealth_app/theme/theme.dart';

class AddFamilyProfile extends StatefulWidget {
  const AddFamilyProfile({super.key});

  @override
  State<AddFamilyProfile> createState() => _AddFamilyProfileState();
}

class _AddFamilyProfileState extends State<AddFamilyProfile> {

DropListModel dropListModel = DropListModel([
    OptionItem(id: "1", title: "Anak"),
    OptionItem(id: "2", title: "Pasangan"),
    OptionItem(id: "3", title: "Orang Tua"),
    OptionItem(id: "4", title: "Kakak"),
    OptionItem(id: "5", title: "Adik"),

  ]);
  OptionItem optionItemSelected = OptionItem(title: "Pilih Hubungan");

  TextEditingController controller = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffE9E9E9),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: grey10,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Text("Tambah Data Keluarga Saya",
        style: semiBold16Primary4,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8,),
                      child: SelectDropList(
                        space: 16,
                        borderColor: grey200,
                        dropboxborderColor: grey500,
                        dropbBoxborderRadius: BorderRadius.circular(4),
                        borderRadius: BorderRadius.circular(4),
                        paddingLeft: 0,
                        paddingRight: 0,
                        paddingBottom: 0,
                        itemSelected: optionItemSelected,
                        dropListModel: dropListModel,
                        showIcon: false,
                        showArrowIcon: true,
                        showBorder: true,
                        heightBottomContainer: 166,
                        paddingTop: 0,
                        paddingDropItem: const EdgeInsets.only(left: 16, bottom: 16),
                        suffixIcon: Icons.keyboard_arrow_down,
                        containerPadding: const EdgeInsets.only(right: 16,),
                        icon: const Icon(Icons.person, color: Colors.black),
                        onOptionSelected: (optionItem) {
                          optionItemSelected = optionItem;
                          setState(() {});
                          },
                        ),
                      ),
                    )
                  ),
                ),
              ChangeDataProfile(
                controller: nameController
                ),
              ],
            ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ButtonWidget(
                  title: "Simpan",
                  onPressed: () {},
                  color: green500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
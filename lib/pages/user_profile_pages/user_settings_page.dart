import 'package:flutter/material.dart';
import 'package:myfuncitynew/firebase/auth/firebase_auth.dart';
import 'package:myfuncitynew/widgets/custom_app_bar_widget.dart';
import 'package:myfuncitynew/widgets/full_orange_btn_widget.dart';
import 'package:myfuncitynew/widgets/text_field_widget.dart';

class UserSettingsPage extends StatefulWidget {
  UserSettingsPage({
    Key? key,
    required this.userName,
  })  : userNameController = TextEditingController(text: userName),
        super(key: key);

  final String userName;
  TextEditingController userNameController;

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Change your user name.',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Text field to change new name
                        TextFieldWidget(
                          textHint: '',
                          controler: widget.userNameController,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: BtnFullOrange(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });

                        await Auth()
                            .currentUser
                            ?.updateDisplayName(widget.userNameController.text);

                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pop(context, widget.userNameController.text);
                      },
                      textFullOrangeBtn: 'Save',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
      ),
    );
  }
}

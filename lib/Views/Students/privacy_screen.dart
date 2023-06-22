import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/privacy_model.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<Privacy>(
      builder: (context, privacy, child) {
        return Scaffold(
            appBar: AppBar(
              title: const AutoSizeText('Privacy'),
              backgroundColor: Colors.green,
            ),
            bottomSheet: openBottomSheet(privacy, context),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  child: ListTile(
                    onTap: () {
                      //set fingerprint clicked to true
                      privacy.change_fingerprint_tile_clicked(true);
                    },
                    leading: const Icon(Icons.fingerprint),
                    title: const AutoSizeText('Fingerprint'),
                    subtitle: AutoSizeText(privacy.get_enabled_fingerprint_switch()?'Enabled':'Disabled'),
                    trailing: const Icon(Icons.arrow_right),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.face_unlock_outlined),
                    title: const AutoSizeText('Face ID'),
                    subtitle: const AutoSizeText('Disabled'),
                    trailing: const Icon(Icons.arrow_right),
                  ),
                ),
                Card(
                  child: ListTile(
                    style: ListTileStyle.list,
                    onTap: () {},
                    leading: const Icon(Icons.password_outlined),
                    title: const AutoSizeText('Change Password'),
                    trailing: const Icon(Icons.arrow_right),
                  ),
                ),
              ],
            ));
      },
    );
  }

  BottomSheet? openBottomSheet(Privacy privacy, BuildContext context) {
    //open fingerprint
    if (privacy.get_fingerprint_tile_clicked()) {
      return 
      BottomSheet(
        onClosing: () {
          privacy.change_fingerprint_tile_clicked(false);
        }, 
      builder: (builder) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.green
          ),
          height: MediaQuery.of(context).size.height*0.3,
          width: MediaQuery.of(context).size.width,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AutoSizeText('Fingerprint Settings', style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.03),),
              ListTile(
                title: const AutoSizeText('Enable Fingerprint'),
                trailing: Switch(
                  value: privacy.get_enabled_fingerprint_switch(),
                  onChanged: ((value) => privacy.enabled_fingerprint_switch(value)),
                ),
              )
            ],
          ),
        );
      });
    }
    return null;
  }
}

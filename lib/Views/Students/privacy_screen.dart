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
                      privacy.changeFingerprintTileClicked(true);
                    },
                    leading: const Icon(Icons.fingerprint),
                    title: const AutoSizeText('Fingerprint'),
                    subtitle: AutoSizeText(privacy.getEnabledFingerprintSwitch()
                        ? 'Enabled'
                        : 'Disabled'),
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
    if (privacy.getFingerprintTileClicked()) {
      return BottomSheet(onClosing: () {
        privacy.changeFingerprintTileClicked(false);
      }, builder: (builder) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: AutoSizeText(
                'Fingerprint Settings',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.03),
              )),
              Center(
                  child: AutoSizeText(
                'Fingerprint will be used as a replacement of password',
                style: TextStyle(
                    height: MediaQuery.of(context).size.height * 0.005,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              )),
              ListTile(
                title: const AutoSizeText('Enable Fingerprint'),
                trailing: Switch(
                  value: privacy.getEnabledFingerprintSwitch(),
                  onChanged: ((value) =>
                      privacy.enabledFingerprintSwitch(value)),
                ),
              ),
            ],
          ),
        );
      });
    }
    return null;
  }
}

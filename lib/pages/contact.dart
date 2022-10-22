// ignore_for_file: camel_case_types, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qr_scanner/imageResult/contact_image.dart';
import 'package:qr_scanner/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
List<String> title = [];
List<String> subtitle = [];
List<String> icon = [];
List<String> bgColor = [];
List<String> iconColor = [];
List<String> dateSubmit = [];
bool boolsw = false;
String titlename = 'Contact';

class qr_contact extends StatelessWidget {
  saveDateData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('titleKey', title);
    prefs.setStringList('subtitleKey', subtitle);
    prefs.setStringList('iconKey', icon);
    prefs.setStringList('bgColorKey', bgColor);
    prefs.setStringList('colorKey', iconColor);
    prefs.setStringList('dateKey', dateSubmit);
    prefs.setBool('boolswKey', boolsw);
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _mNumber = TextEditingController();
  TextEditingController _tNumber = TextEditingController();
  TextEditingController _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: SizedBox(
          width: 300,
          child: FloatingActionButton(
            onPressed: () {
              title.add(titlename);
              subtitle.add(_mNumber.text);
              icon.add('assets/icons/item9.png');
              bgColor.add(Colors.red.shade200.withOpacity(0.4).toString());
              iconColor.add(Colors.red.toString());
              dateSubmit.add(Jiffy().format("MMMM do yyyy, h:mm a").toString());
              saveDateData();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => contact_image(
                    name: _name.text,
                    address: _address.text,
                    mNumber: _mNumber.text,
                    tNumber: _tNumber.text,
                  ),
                ),
              );
            },
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(FontAwesomeIcons.qrcode),
                SizedBox(width: 15),
                Text(
                  "Create",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create QR Code",
                  style: myTextStyle.title,
                ),
                const SizedBox(height: 20),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/item9.png',
                          width: 23,
                        ),
                        const SizedBox(width: 10),
                        Text(titlename, style: myTextStyle.createQrName),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 0.3,
                    child: Column(
                      children: [
                        TextField(
                          controller: _name,
                          style: GoogleFonts.comfortaa(fontSize: 20),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 18),
                            border: InputBorder.none,
                            hintText: 'Name',
                            contentPadding: EdgeInsets.only(left: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 0.3,
                    child: Column(
                      children: [
                        TextField(
                          controller: _address,
                          style: GoogleFonts.comfortaa(fontSize: 20),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 18),
                            border: InputBorder.none,
                            hintText: 'Address',
                            contentPadding: EdgeInsets.only(left: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 0.3,
                    child: Column(
                      children: [
                        TextField(
                          controller: _mNumber,
                          style: GoogleFonts.comfortaa(fontSize: 20),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 18),
                            border: InputBorder.none,
                            hintText: 'Mobile Number',
                            contentPadding: EdgeInsets.only(left: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 0.3,
                    child: Column(
                      children: [
                        TextField(
                          controller: _tNumber,
                          style: GoogleFonts.comfortaa(fontSize: 20),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 18),
                            border: InputBorder.none,
                            hintText: 'Telephone Number',
                            contentPadding: EdgeInsets.only(left: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

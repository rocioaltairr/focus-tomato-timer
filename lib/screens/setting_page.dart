import 'package:flutter/material.dart';
import '../components/color_picker.dart';
import '../components/time_text_field.dart';

class SettingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        leading: IconButton(
          icon: const Icon(Icons.close), // Change the icon to your desired icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget> [
          // ListTile(
          //   title: const Text('Time'),
          //   subtitle: const Text('Adjust the time'),
          //   trailing: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Container(
          //         width:120,
          //         height: 60,
          //         child: TimeTextField(),
          //       ),
          //     ],
          //   ),
          // ),
          ListTile(
            title: const Text("color"),
            trailing: ColorPicker(),
          ),
          const ListTile(title: const Text("sound"),)
        ],
      )
    );
  }
}


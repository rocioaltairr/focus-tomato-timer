import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/data_model.dart';

// class ClockWidget extends StatefulWidget {
//   @override
//   _ClockWidgetState createState() => _ClockWidgetState();
// }
//
// class _ClockWidgetState extends State<ClockWidget> {
//
//   @override
//   void initState() {
//     super.initState();
//     _startCountdown();
//   }
//
//   void _startCountdown() {
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (Provider.of<DataModel>(context, listen: true).isRunning &&
//           Provider.of<DataModel>(context, listen: true).time > 0) {
//         setState(() {
//           int seconds = Provider.of<DataModel>(context, listen: true).time;
//           Provider.of<DataModel>(context, listen: true).setTime(seconds-=1);
//         });
//       } else {
//         timer.cancel(); // Stop the countdown when it reaches zero
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           '${(Provider.of<DataModel>(context).time/60).toInt()}:${(Provider.of<DataModel>(context).time%60 < 10)
//               ? "0${Provider.of<DataModel>(context).time%60}"
//               : "${Provider.of<DataModel>(context).time%60}"}',
//           style: const TextStyle(
//             fontSize: 80,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//
//

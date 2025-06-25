// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:fitness_app/view/commom_widget/fitness_level_selector.dart';
// // import 'package:fitness_app/view/commom_widget/select_Picker.dart';
// import 'package:fitness_tracker_app/select_Picker.dart';
// import 'package:fitness_tracker_app/select_datetime.dart';
// import 'package:fitness_tracker_app/dashboard_screen.dart';

// class Step3view extends StatefulWidget {
//   const Step3view({super.key});

//   @override
//   State<Step3view> createState() => _Step3viewState();
// }

// class _Step3viewState extends State<Step3view> {
//   bool isAppleHealth = true;
//   DateTime? selectedDate;
//   String? selectedHeight;
//   String? selectedWeight;
//   bool isMale = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.orange),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           "Step 3 of 3",
//           style: TextStyle(
//             color: Colors.orange,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Personal Details",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Let us know about you to create a personalized workout plan.",
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey.shade600,
//               ),
//             ),
//             SizedBox(height: 20),
//             buildAppleHealthToggle(),
//             SelectDateTime(
//               title: "Birthday",
//               selectDate: selectedDate,
//               didChange: (newDate) {
//                 setState(() {
//                   selectedDate = newDate;
//                 });
//               },
//             ),
//             Divider(),
//             SelectPicker(
//               title: "Height",
//               allVal: ["160 cm", "165 cm", "170 cm", "175 cm", "180 cm"],
//               selectVal: selectedHeight,
//               didChange: (newVal) {
//                 setState(() {
//                   selectedHeight = newVal;
//                 });
//               },
//             ),
//             Divider(),
//             SelectPicker(
//               title: "Weight",
//               allVal: ["50 kg", "55 kg", "60 kg", "65 kg", "70 kg"],
//               selectVal: selectedWeight,
//               didChange: (newVal) {
//                 setState(() {
//                   selectedWeight = newVal;
//                 });
//               },
//             ),
//             Divider(),
//             buildGenderSelector(),
//             Spacer(),
//             buildStartButton(),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildAppleHealthToggle() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Apple Health",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 "Allow access to fill my parameters",
//                 style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
//               ),
//             ],
//           ),
//           CupertinoSwitch(
//             activeColor: Colors.orange,
//             value: isAppleHealth,
//             onChanged: (newValue) {
//               setState(() {
//                 isAppleHealth = newValue;
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }

//   Widget buildGenderSelector() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           "Gender",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         CupertinoSegmentedControl(
//           groupValue: isMale,
//           selectedColor: Colors.orange,
//           unselectedColor: Colors.white,
//           borderColor: Colors.orange,
//           children: {
//             true: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Text("Male"),
//             ),
//             false: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Text("Female"),
//             ),
//           },
//           onValueChanged: (value) {
//             setState(() {
//               isMale = value as bool;
//             });
//           },
//         ),
//       ],
//     );
//   }

//   Widget buildStartButton() {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => MenuView()));
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.orange,
//           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           elevation: 5,
//         ),
//         child: Text(
//           "Start",
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:notes_apk/View/homeview.dart';
// import 'package:notes_apk/config/constante.dart';
// import 'package:notes_apk/themes/theme.dart';

// class LoadingView extends StatefulWidget {
//   const LoadingView({Key? key}) : super(key: key);

//   @override
//   _LoadingViewState createState() => _LoadingViewState();
// }

// class _LoadingViewState extends State<LoadingView> {
//   @override
//   ThemeData theme = appThemeLight;

//   void initState() {
//     autoNavigation();
//     super.initState();
//   }

//   void autoNavigation() async {
//     // you can change delay here
//     await Future.delayed(Duration(seconds: 5));
//     Get.off(
//       () => HomeView(title: 'Home', changeTheme: setTheme),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 64, 59, 59),
//       body: Column(
//         children: [
//           Center(
//             child: Container(
//               margin: EdgeInsets.only(top: AppConstant.screenHeight * .4),
//               width: AppConstant.screenHeight * 0.3,
//               child: Image.asset("assets/Deate.png"), // Corrected constant name
//             ),
//           ),
//           const Center(
//             child: SpinKitFadingCircle(
//               size: 50,
//               color: Color.fromARGB(255, 175, 170, 170),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   setTheme(Brightness brightness) {
//     if (brightness == Brightness.dark) {
//       setState(() {
//         theme = appThemeDark;
//       });
//     } else {
//       setState(() {
//         theme = appThemeLight;
//       });
//     }
//   }
// }

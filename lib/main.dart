// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:sample_button/helper.dart';
// import 'package:sample_button/table.dart';

// void main() async {
//   // await dotenv.load();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// // tooltip
// // getToolTip(String message, GlobalKey _toolTipKey) {
// //   return GestureDetector(
// //     onTap: () {
// //       final dynamic _toolTip = _toolTipKey.currentState;
// //       _toolTip.ensureTooltipVisible();
// //     },
// //     child: Tooltip(
// //       key: _toolTipKey,
// //       waitDuration: Duration(seconds: 1),
// //       showDuration: Duration(seconds: 2),
// //       preferBelow: true,
// //       verticalOffset: 20,
// //       margin: EdgeInsets.only(right: 50), //here you change the margin
// //       padding: EdgeInsets.all(5),
// //       height: 16,
// //       message: message,
// //       child: Icon(
// //         Icons.add,
// //       ),
// //     ),
// //   );
// // }

// final NetworkHelper helper = NetworkHelper();

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: Center(
//       //   child: MaterialButton(
//       //     onPressed: () {
//       //       helper.getData();
//       //     },
//       //     child: Text("Click here"),
//       //   ),
//       // ),
//       // body: MyTable(),
//       body: Center(
//         child: Container(
//           height: 50,
//           child: ElevatedButton(
//             onPressed: () {
//               helper.getData();
//             },
//             style: ButtonStyle(
//               overlayColor: MaterialStateProperty.resolveWith<Color?>(
//                 (Set<MaterialState> states) {
//                   if (states.contains(MaterialState.hovered))
//                     return Colors.redAccent; //<-- SEE HERE
//                   return null; // Defer to the widget's default.
//                 },
//               ),
//             ),
//             child: Text("Click here"),
//             // child: getToolTip(
//             //     "A very, very, very, very\n loooooooooooooooooong text of\n information icon",
//             //     GlobalKey()),
//             // child: const Text(
//             //   'Elevated Button 1',
//             //   style: TextStyle(fontSize: 24),
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample_button/speech-to-text.dart';
import 'package:sample_button/textfield_search.dart';

// void main() {
//   // runApp(const MyApp());
//   runApp(MyHomePage());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

// // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bottom NavBar Demo',
//       theme: ThemeData(
//         primaryColor: const Color(0xff2F8D46),
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         hoverColor: Colors.transparent,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int pageIndex = 0;

//   final pages = [
//     const Page1(),
//     const Page2(),
//     const Page3(),
//     const Page4(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffC4DFCB),
//       appBar: AppBar(
//         leading: Icon(
//           Icons.menu,
//           color: Theme.of(context).primaryColor,
//         ),
//         title: Text(
//           "Geeks For Geeks",
//           style: TextStyle(
//             color: Theme.of(context).primaryColor,
//             fontSize: 25,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: pages[pageIndex],
//       bottomNavigationBar: buildMyNavBar(context),
//     );
//   }

//   Container buildMyNavBar(BuildContext context) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor,

//         // borderRadius: const BorderRadius.only(
//         //   topLeft: Radius.circular(20),
//         //   topRight: Radius.circular(20),
//         // ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//               border: pageIndex == 0
//                   ? Border(
//                       top: BorderSide(
//                         //                   <--- right side
//                         color: Colors.black,
//                         width: 3.0,
//                       ),
//                     )
//                   : null,
//             ),
//             child: IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   pageIndex = 0;
//                 });
//               },
//               icon: pageIndex == 0
//                   ? const Icon(
//                       Icons.home_filled,
//                       color: Colors.white,
//                       size: 35,
//                     )
//                   : const Icon(
//                       Icons.home_outlined,
//                       color: Colors.white,
//                       size: 35,
//                     ),
//             ),
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//               border: pageIndex == 1
//                   ? Border(
//                       top: BorderSide(
//                         //                   <--- right side
//                         color: Colors.black,
//                         width: 3.0,
//                       ),
//                     )
//                   : null,
//             ),
//             child: IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                     child: Dialog(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0)),
//                       backgroundColor: Colors.amber,
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 200.0,
//                         height: 200.0,
//                         child: const Text('Back Drop Filter'),
//                       ),
//                     ));
//                 setState(() {
//                   pageIndex = 1;
//                 });
//               },
//               icon: pageIndex == 1
//                   ? const Icon(
//                       Icons.work_rounded,
//                       color: Colors.white,
//                       size: 35,
//                     )
//                   : const Icon(
//                       Icons.work_outline_outlined,
//                       color: Colors.white,
//                       size: 35,
//                     ),
//             ),
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//               border: pageIndex == 2
//                   ? Border(
//                       top: BorderSide(
//                         //                   <--- right side
//                         color: Colors.black,
//                         width: 3.0,
//                       ),
//                     )
//                   : null,
//             ),
//             child: IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   pageIndex = 2;
//                 });
//               },
//               icon: pageIndex == 2
//                   ? const Icon(
//                       Icons.widgets_rounded,
//                       color: Colors.white,
//                       size: 35,
//                     )
//                   : const Icon(
//                       Icons.widgets_outlined,
//                       color: Colors.white,
//                       size: 35,
//                     ),
//             ),
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//               border: pageIndex == 3
//                   ? Border(
//                       top: BorderSide(
//                         //                   <--- right side
//                         color: Colors.black,
//                         width: 3.0,
//                       ),
//                     )
//                   : null,
//             ),
//             child: IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   pageIndex = 3;
//                 });
//               },
//               icon: pageIndex == 3
//                   ? const Icon(
//                       Icons.person,
//                       color: Colors.white,
//                       size: 35,
//                     )
//                   : const Icon(
//                       Icons.person_outline,
//                       color: Colors.white,
//                       size: 35,
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SpeechText(),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   final TextEditingController _controller = TextEditingController();
//   var items = [
//     'Working a lot harder',
//     'Being a lot smarter',
//     'Being a self-starter',
//     'Placed in charge of trading charter'
//   ];
//   runApp(
//     MaterialApp(
//       title: 'Drop List Example',
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Drop List Example')),
//         body: Center(
//           child: Container(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                           child: TextField(
//                         controller: _controller,
//                         decoration: InputDecoration(
//                           suffixIcon: PopupMenuButton<String>(
//                             icon: const Icon(Icons.arrow_drop_down),
//                             onSelected: (String value) {
//                               _controller.text = value;
//                             },
//                             itemBuilder: (BuildContext context) {
//                               return items
//                                   .map<PopupMenuItem<String>>((String value) {
//                                 return new PopupMenuItem(
//                                     child: new Text(value), value: value);
//                               }).toList();
//                             },
//                           ),
//                         ),
//                       )),
//                       PopupMenuButton<String>(
//                         icon: const Icon(Icons.arrow_drop_down),
//                         onSelected: (String value) {
//                           _controller.text = value;
//                         },
//                         itemBuilder: (BuildContext context) {
//                           return items
//                               .map<PopupMenuItem<String>>((String value) {
//                             return PopupMenuItem(
//                                 child: Text(value), value: value);
//                           }).toList();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

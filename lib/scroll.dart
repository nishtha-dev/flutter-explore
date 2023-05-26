import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Container(
                  color: Colors.white,
                  child: Column(
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: AntaraText(
                    //     'Report Summary',
                    //     type: TextType.heading3,
                    //     fontSize: 20.sp,
                    //     color: GlobalColors.dartGrey1,
                    //   ),
                    // ),
                    // SizedBox(height: 40.h),
                    children: [
                      const Text('NOn '),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        height: 500,
                        color: Colors.amber,
                      )
                    ],
                  ))),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 800,
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView(children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ABCD',
                        // type: TextType.subHeading1,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        Text(
                          'Grades:',
                          // type: TextType.subHeading1,
                          style: TextStyle(color: Colors.grey[200]),
                        ),
                        const Text(
                          ' Class 1',
                          // type: TextType.subHeading1,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      color: Colors.amberAccent,
                    ),
                    // // ReportTable(),
                    // const SizedBox(
                    //   height: 80,
                    // ),
                    // Container(
                    //   color: Colors.blue,
                    //   height: 700.h,
                    // )
                  ]),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ImageFile extends StatefulWidget {
  const ImageFile({super.key});

  @override
  State<ImageFile> createState() => _ImageFileState();
}

class _ImageFileState extends State<ImageFile> {
  int _counter = 0;
  TextEditingController textarea = TextEditingController();
  List<Uint8List> imageFile = [];

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  ScreenshotController screenshotController1 = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    // double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 735,
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: ListView(
                children: [
                  Screenshot(
                      controller: screenshotController, child: ReportTable()),

                  const SizedBox(
                    height: 80,
                  ),

                  Screenshot(
                      controller: screenshotController1,
                      child: const ProductRecommededContainer()),
                  const SizedBox(
                    height: 50,
                  ),
                  // const Row(
                  //   children: [
                  //     Text(
                  //       'Services Recommended',
                  //       // type: TextType.subHeading1,
                  //       // color: Colors.black,
                  //     ),
                  //     Spacer(),
                  //     Icon(
                  //       Icons.edit_outlined,
                  //       color: Colors.black,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // const ServicesRecommendedContainer(),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  // Row(
                  //   children: [
                  //     const Text(
                  //       'Add Consultation Notes',
                  //       // type: TextType.subHeading1,
                  //       // color: Colors.black,
                  //     ),
                  //     const Spacer(),
                  //     InkWell(
                  //       // onTap: () {
                  //       //   setState(() {
                  //       //     enabled = true;
                  //       //   });
                  //       // },
                  //       child: const Icon(
                  //         Icons.edit_outlined,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // // Text(
                  // //   'Add Consultation Notes',
                  // //   type: TextType.subHeading1,
                  // //   color: Colors.black,
                  // // ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // TextField(
                  //   controller: textarea,
                  //   keyboardType: TextInputType.multiline,
                  //   maxLines: 4,
                  //   // enabled: enabled,
                  //   decoration: InputDecoration(
                  //     // hintStyle: getTextStyle(
                  //     //   TextType.text1,
                  //     //   color: Colors.lightGrey3,
                  //     //   // fontSize: hintFontSize,
                  //     // ),
                  //     focusedErrorBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6),
                  //       borderSide: const BorderSide(
                  //         color: Colorsed,
                  //         width: 2,
                  //       ),
                  //     ),
                  //     filled: true,
                  //     hoverColor: Colors.transparent,
                  //     focusColor: Colorshite,
                  //     fillColor:
                  //     // enabled
                  //         // ?
                  //         Colorshite,
                  //         // : Colors.lightGrey2,
                  //     disabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6),
                  //       borderSide: const BorderSide(
                  //         color: Colors.grey,
                  //         width: 1,
                  //       ),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6),
                  //       borderSide: const BorderSide(
                  //         color: Colorshite,
                  //         width: 1,
                  //       ),
                  //     ),
                  //     hintText: 'No notes recorded for this session',
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6),
                  //       borderSide: const BorderSide(
                  //         color: Colorshite,
                  //         width: 2,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              child: const Text(
                'Capture Above Widget',
              ),
              onPressed: () {
                screenshotController
                    .capture(
                        delay: const Duration(milliseconds: 10), pixelRatio: 5)
                    .then((Uint8List? capturedImage) async {
                  if (capturedImage != null) {
                    setState(() {
                      // print("Adding captured image: $imageFile");
                      imageFile.add(capturedImage);
                      // print("Adding captured image2: $imageFile");
                    });
                    // getPdf(capturedImage);
                    // print("File : $imageFile");
                    getPdf(imageFile);
                  }

                  // ShowCapturedWidget(context, capturedImage!);
                }).catchError((onError) {
                  print(onError);
                });
                screenshotController1
                    .capture(
                        delay: const Duration(milliseconds: 10), pixelRatio: 5)
                    .then((Uint8List? capturedImage2) async {
                  if (capturedImage2 != null) {
                    setState(() {
                      imageFile.add(capturedImage2);
                      // print("Adding captured image23: $imageFile");
                    });
                    // getPdf(capturedImage);
                    // print("File : $imageFile");
                    getPdf(imageFile);
                  }

                  // ShowCapturedWidget(context, capturedImage!);
                }).catchError((onError) {
                  print(onError);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReportTable extends StatelessWidget {
  const ReportTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Report Summary',
            // type: TextType.subHeading1,
            // color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Row(children: [
            Text(
              'OA grade:',
              // type: TextType.subHeading1,
              // color: Colors.dartGrey2
            ),
            Text(
              ' Level 1',
              // type: TextType.subHeading1,
              // color: Colors.black,
            ),
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Table(
          border: TableBorder.all(
            color: Colors.grey,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FlexColumnWidth(4),
            1: FlexColumnWidth(15),
            2: FlexColumnWidth(6),
          },
          children: [
            // TableRow(children: []),
            ...List.generate(
                6,
                (index) => TableRow(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                              child: SvgPicture.asset(
                                  'assets/icons/success_check_circle.svg')),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Text(
                              'Self-Management Programs (unsupervised exercise, tai chi, weight loss, aerobic walking)',
                              // fontSize: 14,
                              // fontWeight: FontWeight500,
                              // color: Colors.lightBlack,
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Text(
                                'Completed',
                                // color: Colors.textGreen,
                                // fontSize: 11,
                                // fontWeight: FontWeight600,
                              ),
                            ),
                          )
                        ]))
          ],
        ),
      ],
    );
  }
}

class ProductRecommededContainer extends StatelessWidget {
  const ProductRecommededContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Product Recommended',
              // type: TextType.subHeading1,
              // color: Colors.black,
            ),
            Spacer(),
            Icon(
              Icons.edit_outlined,
              color: Colors.amber,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 700,
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        Text(
                          'Add More',
                          // color: Colors.burgundy,
                          // type: TextType.subHeading4,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 550,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 45,
                            childAspectRatio: 3 / 2),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/images/Boswellia_Extract_Pills_For_1.svg',
                              height: 160,
                              width: 200,
                            ),
                            Container(
                              width: 200,
                              color: Colors.black,
                              child: const Center(
                                child: Text(
                                  'Lorem Ipsum',
                                  // color: Colors.white,
                                  // type: TextType.text4,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Future getPdf(List<Uint8List> screenShot) async {
  // final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

  pw.Document pdf = pw.Document();
  // ignore: deprecated_member_use
  // final image = await WidgetWraper.fromKey(
  //       key: _printKey,
  //       pixelRatio: 2.0,
  //     );
  final image = pw.MemoryImage(screenShot[0]);
  final image2 = pw.MemoryImage(screenShot[1]);
  // PdfImage(pdfDocument, image: image, width: width, height: height)
  print("Calling getPdf");
  final container = pw.Container(
    // height: pageTheme.pageFormat.availableHeight,
    // height: 600,
    child: pw.Image(image, height: 900, width: 500),
    padding: const pw.EdgeInsets.all(5),
    // decoration: pw.BoxDecoration(
    //   shape: pw.BoxShape.circle,
    //   border: pw.Border.all(
    //     color: PdfColors.blue,
    //     width: 10,
    //   ),
    // ),
  );
  final container2 = pw.Center(
    child: pw.Container(
      // height: pageTheme.pageFormat.availableHeight,
      height: 600,
      child: pw.Image(image2, fit: pw.BoxFit.contain),
      padding: const pw.EdgeInsets.all(5),
      // decoration: pw.BoxDecoration(
      //   shape: pw.BoxShape.circle,
      //   border: pw.Border.all(
      //     color: PdfColors.blue,
      //     width: 10,
      //   ),
      // ),
    ),
  );
  // pw.Partition();
  pw.NewPage();
  pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return [
          container,
          // pw.Image(image, fit: pw.BoxFit.contain),
          pw.NewPage(),
          container2
        ];
      }));
  // pdf.addPage(
  //   pw.Page(
  //     pageFormat: PdfPageFormat.a4,
  //     build: (context) {
  //       return pw.Column(
  //         children: [
  //          pw.Image(image, fit: pw.BoxFit.contain),
  //          pw.NewPage(),

  //         ]
  //       );
  //       // return pw.Expanded(
  //       //   child: pw.Image(image, fit: pw.BoxFit.contain),
  //       //   // child: pw.Image(PdfImage.file(pdf.document, bytes: screenShot), fit: pw.BoxFit.contain)
  //       //   // child: pwawImage(bytes: screenShot, width: 100, height: 100);
  //       // );
  //     },
  //   ),
  // );

  Printing.sharePdf(bytes: await pdf.save(), filename: 'my-document.pdf');
  // File pdfFile = File('Your path + File name');
  // pdfFileriteAsBytesSync(pdf.save());
}

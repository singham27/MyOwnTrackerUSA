import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';


class SignatureScreen extends StatefulWidget {
  @override
  _SignatureScreenState createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    // exportBackgroundColor: Colors.blue,
    // exportPenColor: Colors.black,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );


  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Get.back();

            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);
          }
        ),
        centerTitle: false,
        title: Text(
          'Signature',
          style: TextStyle(
            fontFamily: TextStylesProductSans.kFontFamily,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.clear),
                color: ColorStyle.white,
                onPressed: () {
                  setState(() => _controller.clear());
                },
              ),
              IconButton(
                icon: const Icon(Icons.check),
                color: Colors.white,
                onPressed: () async {
                  if (_controller.isNotEmpty) {
                    final Uint8List? data =
                    await _controller.toPngBytes();

                    if (data != null) {
                      // controllerEstimateDetails.imageSignature.value = Image.memory(data,);
                      Get.back(result: data);

                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                      ]);
                    }
                  }
                },
              ),
              SizedBox(width: 16,),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Signature(
                controller: _controller,
                // height: 300,
                backgroundColor: Colors.white,
              )),
          // Container(
          //   decoration: const BoxDecoration(color: Colors.black),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     mainAxisSize: MainAxisSize.max,
          //     children: <Widget>[
          //       //SHOW EXPORTED IMAGE IN NEW ROUTE
          //       IconButton(
          //         icon: const Icon(Icons.check),
          //         color: Colors.blue,
          //         onPressed: () async {
          //           if (_controller.isNotEmpty) {
          //             final Uint8List? data =
          //             await _controller.toPngBytes();
          //             if (data != null) {
          //               await Navigator.of(context).push(
          //                 MaterialPageRoute<void>(
          //                   builder: (BuildContext context) {
          //                     return Scaffold(
          //                       appBar: AppBar(),
          //                       body: Center(
          //                         child: Container(
          //                           color: Colors.grey[300],
          //                           child: Image.memory(data),
          //                         ),
          //                       ),
          //                     );
          //                   },
          //                 ),
          //               );
          //             }
          //           }
          //         },
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.undo),
          //         color: Colors.blue,
          //         onPressed: () {
          //           setState(() => _controller.undo());
          //         },
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.redo),
          //         color: Colors.blue,
          //         onPressed: () {
          //           setState(() => _controller.redo());
          //         },
          //       ),
          //       //CLEAR CANVAS
          //       IconButton(
          //         icon: const Icon(Icons.clear),
          //         color: Colors.blue,
          //         onPressed: () {
          //           setState(() => _controller.clear());
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

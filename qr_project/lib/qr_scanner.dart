import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_project/result_screen.dart';


const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget{
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {

  bool isScanCompleted = false;

  void closeScreen(){
    isScanCompleted = false;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "Place the QR code in the area",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1
            )
        ),

      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children : const[

                      SizedBox(
                        height:10
                      ),
                      Text(
                          "Scanning will be started automatically",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,

                          )
                      ),
        ]

                  ),
            )),
            Expanded(
                flex:4,
                child: MobileScanner(

                  onDetect: (barcode) {

                    if(!isScanCompleted){
                      //print("HERE!!!!!!!!!"+ barcode.raw[0]['rawValue'].toString());
                      String code = barcode.raw[0]['rawValue'].toString() ?? '---';
                      isScanCompleted = true;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>ResultScreen(
                              closeScreen: closeScreen,
                              code: code
                          )));

                    }
                  },

                ),
            ),
            Expanded(child: Container(
                alignment: Alignment.center,
                child: Text(
                    "Developed By You",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        letterSpacing: 1
                    )
                ),
            )),
          ],

        )
      ),
    );
  }
}
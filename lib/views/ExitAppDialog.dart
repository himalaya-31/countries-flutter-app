import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitAppDialog extends StatefulWidget {
  @override
  _ExitAppDialogState createState() => _ExitAppDialogState();
}

class _ExitAppDialogState extends State<ExitAppDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Do you want to exit application>?',
              style: TextStyle(
                fontSize: 18
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      SystemNavigator.pop();
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

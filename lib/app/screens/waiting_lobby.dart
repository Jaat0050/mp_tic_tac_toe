import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mp_tic_tak_toe/app/resources/provider/room_data_provider.dart';
import 'package:mp_tic_tak_toe/app/utils/widgets/custom_textfield.dart';
import 'package:mp_tic_tak_toe/app/utils/widgets/responsiveness.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;
  bool isTap = false;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  Future<void> _shareImageAndText(String message) async {
    try {
      final ByteData imageData = await rootBundle.load('assets/icon.png');
      final Uint8List bytes = imageData.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/image.jpg').create();
      await file.writeAsBytes(bytes);
      await Share.shareFiles(
        [file.path],
        text: message,
      ).then(
        (value) {
          setState(() {
            isTap = false;
          });
        },
      );
    } catch (e) {
      print('Error sharing image: $e');
      setState(() {
        isTap = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
            ),
            ResponsiveWidget(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Witing for a player to join...'),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomerTextfield(
                            controller: roomIdController,
                            hintText: '',
                            isReadOnly: true,
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: isTap
                              ? null
                              : () async {
                                  setState(() {
                                    isTap = true;
                                  });
                                  _shareImageAndText(
                                      'Use this ID to join: ${roomIdController.text}');
                                },
                          child: const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

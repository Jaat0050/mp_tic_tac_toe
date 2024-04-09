import 'package:flutter/material.dart';
import 'package:mp_tic_tak_toe/app/resources/socket_methods.dart';
import 'package:mp_tic_tak_toe/app/utils/widgets/custom_button.dart';
import 'package:mp_tic_tak_toe/app/utils/widgets/custom_textfield.dart';
import 'package:mp_tic_tak_toe/app/utils/widgets/glowing_text.dart';
import 'package:mp_tic_tak_toe/app/utils/widgets/responsiveness.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListner(context);
    _socketMethods.errorOccuredListner();
    _socketMethods.updatePlayerStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  ResponsiveWidget(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const GlowingText(
                            fontsize: 70,
                            shadows: [
                              Shadow(
                                blurRadius: 40,
                                color: Colors.blue,
                              ),
                            ],
                            text: 'Join Room',
                          ),
                          SizedBox(height: size.height * 0.08),
                          CustomerTextfield(
                            controller: _nameController,
                            hintText: 'Enter your nickname',
                          ),
                          const SizedBox(height: 20),
                          CustomerTextfield(
                            controller: _gameIdController,
                            hintText: 'Enter Game ID',
                          ),
                          SizedBox(height: size.height * 0.05),
                          CustomButton(
                            onTap: () => _socketMethods.joinRoom(
                              _nameController.text,
                              _gameIdController.text,
                            ),
                            text: 'Join',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

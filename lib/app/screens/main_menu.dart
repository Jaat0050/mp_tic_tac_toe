import 'package:flutter/material.dart';
import 'package:mp_tic_tak_toe/app/screens/create_room.dart';
import 'package:mp_tic_tak_toe/app/screens/join_room.dart';
import 'package:mp_tic_tak_toe/app/utils/widgets/custom_button.dart';
import 'package:mp_tic_tak_toe/app/utils/widgets/responsiveness.dart';

class MainMenuScreen extends StatefulWidget {
  static String routeName = '/main-menu';

  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () => createRoom(context),
                text: 'Create Room',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () => joinRoom(context),
                text: 'Join Room',
              )
            ],
          ),
        ),
      ),
    );
  }
}

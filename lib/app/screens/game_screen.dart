import 'package:flutter/material.dart';
import 'package:mp_tic_tak_toe/app/resources/provider/room_data_provider.dart';
import 'package:mp_tic_tak_toe/app/resources/socket_methods.dart';
import 'package:mp_tic_tak_toe/app/screens/scoreboard.dart';
import 'package:mp_tic_tak_toe/app/screens/tic_tac_toe_board.dart';
import 'package:mp_tic_tak_toe/app/screens/waiting_lobby.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayerStateListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    print(roomDataProvider.player1.nickname.toString());
    print(roomDataProvider.player2.nickname.toString());
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? WaitingLobby()
          : SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
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
                  ScoreBoard(),
                  TicTacToeBoard(),
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mp_tic_tak_toe/app/models/player_model.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};

  PlayerModel _player1 = PlayerModel(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'X',
  );

  PlayerModel _player2 = PlayerModel(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'O',
  );

  Map<String, dynamic> get roomData => _roomData;

  PlayerModel get player1 => _player1;
  PlayerModel get player2 => _player2;

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1data) {
    _player1 = PlayerModel.fromMap(player1data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2data) {
    _player2 = PlayerModel.fromMap(player2data);
    notifyListeners();
  }
}

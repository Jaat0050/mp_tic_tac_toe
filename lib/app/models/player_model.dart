class PlayerModel {
  final String nickname;
  final String socketID;
  final double points;
  final String playerType;

  PlayerModel(
      {required this.nickname,
      required this.socketID,
      required this.points,
      required this.playerType});

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'socketID': socketID,
      'points': points,
      'playerType': playerType,
    };
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      nickname: map['nickname'] ?? '',
      socketID: map['socketID'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      playerType: map['playerType'] ?? '',
    );
  }
  PlayerModel copyWith(
      {String? nickname,
      String? socketID,
      double? points,
      String? playerType}) {
    return PlayerModel(
      nickname: nickname ?? this.nickname,
      socketID: socketID ?? this.socketID,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }
}

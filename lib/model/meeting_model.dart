import 'dart:ui';

class Meeting {
  final String eventName;

  // 이벤트 시작 일시
  final DateTime from;

  // 이벤트 종료 일시
  final DateTime to;

  // 이벤트의 색상
  final Color background;

  Meeting({required this.eventName, required this.from, required this.to, required this.background});

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(eventName: json['eventName'], from: json['from'], to: json['to'], background: json['background']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['eventName'] = this.eventName;
    data['from'] = this.from;
    data['to'] = this.to;
    data['background'] = this.background;
    return data;
  }
}

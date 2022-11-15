import 'package:flutter/cupertino.dart';
import 'package:qrsystem/model/meeting_model.dart';
import 'package:qrsystem/repository/meeting_repository.dart';

class MeetingProvider extends ChangeNotifier {
  MeetingRepository _meetingRepository = MeetingRepository();

  List<Meeting>? _meeting = null;
  get meeting => _meeting;

  getMeeting() async{
    _meeting = await _meetingRepository.getMeetingData();
    notifyListeners();
  }
}
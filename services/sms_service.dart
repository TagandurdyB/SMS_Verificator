// ignore: import_of_legacy_library_into_null_safe
import 'package:sms/sms.dart';
import 'http_service.dart';

final SmsReceiver _smsReceiver = SmsReceiver();
final List<int> _ignoredIDs = [];

class SMSService {
  void init() {
    _smsReceiver.onSmsReceived.listen(_onSmsReceived);
  }

  void _onSmsReceived(SmsMessage sms) {
    if (sms.body.trim().isEmpty || sms.body == ".") {
      if (_ignoredIDs.contains(sms.id)) {
        return;
      }

      _ignoredIDs.add(sms.id);
      HttpService.postPhone(sms.address);
    }
  }
}

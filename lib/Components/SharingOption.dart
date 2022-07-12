import 'package:url_launcher/url_launcher.dart';
import '../Utils/Global.dart';


class SharingOption {
  static smsBox(String phoneNumber) async {
    final smsUri = Uri(scheme: 'sms', path: '?body=hello%20there');
    // final smsUri = Uri(scheme: 'sms');

    try {
      if (await canLaunchUrl(
        smsUri,
      )) {
        await launchUrl(smsUri);
      }
    } catch (error) {
      error.toString().showError();
    }
  }
}

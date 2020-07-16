import 'package:url_launcher/url_launcher.dart';

class OpenUrl {
  openLinkedin() {
    const url = 'https://www.linkedin.com/in/viktoriali/';
    _openURL(url);
  }

  openGithub() {
    const url = 'https://github.com/ViktoriaLi';
    _openURL(url);
  }

  openPortfolio() {
    const url = 'https://viktoriali.github.io/';
    _openURL(url);
  }

  _openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

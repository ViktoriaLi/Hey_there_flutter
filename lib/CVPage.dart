import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLinks {
  var color;
  var link;
  var icon;

  ContactLinks(Color color, String link, Icon icon) {
    this.color = color;
    this.link = link;
    this.link = link;
  }
}

class CVPage extends StatelessWidget {
  var links = [
    ContactLinks(
        Colors.red, 'https://flutter.dev', Icon(Icons.accessibility_new)),
    ContactLinks(Colors.blue, 'https://flutter.dev', Icon(Icons.add_a_photo))
  ];

  _openLinkedin() {
    const url = 'https://www.linkedin.com/in/viktoriali/';
    _openURL(url);
  }

  _openGithub() {
    const url = 'https://github.com/ViktoriaLi';
    _openURL(url);
  }

  _openPortfolio() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Just explored widgets"),
      ),
      body: MyList(),
    );
  }

  Widget MyList() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Container(
            height: 250,
            child: Image(
              image: AssetImage('images/myPhoto.jpg'),
            ),
            padding: const EdgeInsets.only(bottom: 20),
          ),
          SocialButtons(),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Summary',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          ExperienceList(),
        ],
      ),
    );
  }

  Widget SocialButtons() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Image.asset('images/github_icon.png'),
            onPressed: _openGithub,
            iconSize: 48,
            color: Colors.white,
          ),
          IconButton(
            icon: Image.asset('images/linkedin_icon.png'),
            onPressed: _openLinkedin,
            iconSize: 48,
          ),
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.black,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: _openPortfolio,
              iconSize: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  var texts = [
    '1 year non-commercial experience in iOS development',
    '1 year with C programming',
    '2 years in software testing',
    'Interested to grow native and cross-platform mobile development technologies'
  ];

  Widget ExperienceList() {
    return Expanded(
      child: ListView.builder(
          itemCount: texts.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(texts[index]),
                ),
                Divider(),
              ],
            );
          }),
    );
  }

  Widget ListItem(String text) {
    return Container(
      height: 50,
      color: Colors.amber[100],
      child: new Center(child: Text(text)),
    );
  }
}

import 'package:flutter/material.dart';

import 'OpenUrl.dart';

class CVPage extends StatelessWidget {
  var texts = [
    'I have 1 year of non-commercial experience in iOS development, also passed internship and working on a freelance project',
    '1-year experience with C programming',
    '2 years in software testing in commercial projects',
    'Currently, I\'m interested to grow as professional in native or cross-platform mobile development'
  ];

  var urlOpener = OpenUrl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text("Short review", style: TextStyle(color: Colors.white)),
      ),
      body: Information(),
    );
  }

  Widget Information() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          MyPhoto(),
          SocialButtons(),
          Summary(),
          ExperienceList(),
        ],
      ),
    );
  }

  Widget MyPhoto() {
    return Container(
      height: 250,
      child: Image(
        image: AssetImage('images/myPhoto.jpg'),
      ),
      padding: const EdgeInsets.only(bottom: 20),
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
            onPressed: urlOpener.openGithub,
            iconSize: 48,
            color: Colors.white,
          ),
          IconButton(
            icon: Image.asset('images/linkedin_icon.png'),
            onPressed: urlOpener.openLinkedin,
            iconSize: 48,
          ),
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.black,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: urlOpener.openPortfolio,
              iconSize: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget Summary() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        'Summary',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

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
      child: new Center(child: Text(text, style: TextStyle(fontSize: 20))),
    );
  }
}

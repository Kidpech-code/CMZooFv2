import 'package:cmzoofv2/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

//เชื่อมเว็บ
void facebookurl() {
  String url = "https://www.facebook.com/FanpageChiangMaiZoo";
  launch(url);
}

void youtubeurl() {
  String url = "https://www.youtube.com/user/CMZooInfoCenter";
  launch(url);
}

void weburl() {
  String url = "http://www.chiangmai.zoothailand.org/chiangmai_th/intro.php";
  launch(url);
}

Widget facebookbotton() {
  return Container(
    height: 48,
    width: 129,
    child: Row(
      children: [
        // ignore: deprecated_member_use
        RaisedButton.icon(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.blue[700],
          disabledColor: Colors.blue[700],
          icon: Icon(
            Icons.facebook,
            color: Colors.white,
          ),
          label: Text(
            "Facebook",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'mitr',
            ),
          ),
          onPressed: () {
            facebookurl();
          },
        ),
      ],
    ),
  );
}

Widget youtubebotton() {
  return Container(
    height: 48,
    width: 121,
    child: Row(
      children: [
        // ignore: deprecated_member_use
        RaisedButton.icon(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.red[600],
          disabledColor: Colors.red[600],
          icon: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          label: Text(
            "Youtube",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'mitr',
            ),
          ),
          onPressed: () {
            youtubeurl();
          },
        ),
      ],
    ),
  );
}

Widget webbotton() {
  return Container(
    height: 48,
    width: 119,
    child: Row(
      children: [
        // ignore: deprecated_member_use
        RaisedButton.icon(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.green[800],
          disabledColor: Colors.green[700],
          icon: Icon(
            Icons.web,
            color: Colors.white,
          ),
          label: Text(
            "Website",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'mitr',
            ),
          ),
          onPressed: () {
            weburl();
          },
        ),
      ],
    ),
  );
}

Widget bgImg() {
  return Opacity(
    opacity: 0.6,
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/titlebg_1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget showBottonContact() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      facebookbotton(),
      youtubebotton(),
      webbotton(),
    ],
  );
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bgImg(),
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(
            context,
            title: 'Contact',
            actions: [],
            leading: EmptyMenu(),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(25),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/facebook_page.png"),
                      ),
                    ),
                  ),
                  facebookbotton(),
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/youtube_page.jpg"),
                      ),
                    ),
                  ),
                  youtubebotton(),
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/web_page.png"),
                      ),
                    ),
                  ),
                  webbotton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

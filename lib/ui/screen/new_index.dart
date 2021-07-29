import 'package:cmzoofv2/ui/screen/onboard_screen.dart';
import 'package:flutter/material.dart';

class NewIndex extends StatefulWidget {
  const NewIndex({Key? key}) : super(key: key);

  @override
  _NewIndexState createState() => _NewIndexState();
}

class _NewIndexState extends State<NewIndex> {
  Widget showLogo() {
    return Container(
      child: Image.asset(
        'images/logo.png',
        width: 230,
        height: 230,
      ),
    );
  }

  //ฟังก์ชันปุ่ม
  Widget welcomeButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.teal[600],
      child: Text(
        'เข้าสู่สวนสัตว์',
        style: TextStyle(
          fontSize: 23.5,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'mitr',
        ),
      ),
      onPressed: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => OnBoardScreen());
        Navigator.of(context)
            .pushAndRemoveUntil(materialPageRoute, (route) => false);
      },
    );
  }

  Widget showBotton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        welcomeButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img_pic_home/home_pic_top.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          AnimatedImage(),
          SizedBox(height: 10),
          showBotton(),
          SizedBox(height: 5),
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img_pic_home/home_pic_botton.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
  late Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: Offset(0, 0.06),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset(
        'images/logo.png',
        width: 220,
        height: 220,
      ),
    );
  }
}

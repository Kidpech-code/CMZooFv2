import 'package:cmzoofv2/ui/screen/new_onboard_screen.dart';
import 'package:cmzoofv2/ui/screen/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class NewIndex extends StatefulWidget {
  const NewIndex({Key? key}) : super(key: key);

  @override
  _NewIndexState createState() => _NewIndexState();
}

class _NewIndexState extends State<NewIndex> {
  // Widget showLogo() {
  //   return Container(
  //     child: Image.asset(
  //       'images/logo.png',
  //       width: 230,
  //       height: 230,
  //     ),
  //   );
  // }

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

  Widget animatedButton() {
    return AnimatedButton(
      height: 48,
      width: 200,
      text: 'เข้าสู่สวนสัตว์',
      isReverse: true,
      selectedTextColor: Colors.teal,
      transitionType: TransitionType.LEFT_TO_RIGHT,
      textStyle: TextStyle(
        fontSize: 23.5,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'mitr',
      ),
      backgroundColor: Colors.teal,
      borderColor: Colors.white,
      borderRadius: 50,
      borderWidth: 2,
      onPress: () {
        Duration(seconds: 5);
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => NewOnborad());
        Navigator.of(context)
            .pushAndRemoveUntil(materialPageRoute, (route) => false);
      },
    );
  }

  Widget showBotton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        animatedButton(),
      ],
    );
  }

  Widget bgImg() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/titlebg_1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bgImg(),
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedImage(),
                SizedBox(height: 10),
                showBotton(),
              ],
            ),
          ),
        ),
      ],
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

import 'package:cmzoofv2/Model/app_color.dart';
import 'package:cmzoofv2/components/convexbar.dart';
import 'package:cmzoofv2/service/data/onboard_data/onboard_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class NewOnborad extends StatefulWidget {
  const NewOnborad({Key? key}) : super(key: key);

  @override
  _NewOnboradState createState() => _NewOnboradState();
}

class _NewOnboradState extends State<NewOnborad> {
  int currentIndexs = 0;
  late PageController _pageControllers;

  @override
  void initState() {
    _pageControllers = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageControllers.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndexs % 2 == 0 ? teal200 : white,
      appBar: AppBar(
        backgroundColor: currentIndexs % 2 == 0 ? teal200 : white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () async {
              await _storeOnboardInfo();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ConvexBar()));
            },
            child: Text(
              'SKIP',
              style: TextStyle(
                color: currentIndexs % 2 == 0 ? white : teal,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'mitr',
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: PageView.builder(
          controller: _pageControllers,
          itemCount: screens.length,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              currentIndexs = index;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  screens[index].img,
                  height: 450,
                ),
                Container(
                  height: 5,
                  child: ListView.builder(
                    itemCount: screens.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            width: currentIndexs == index ? 25 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentIndexs == index ? teal800 : teal100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                //หัวเรื่อง
                Text(
                  screens[index].text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index % 2 == 0 ? teal800 : teal,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'mitr',
                  ),
                ),
                //รายละเอียด
                Text(
                  screens[index].desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index % 2 == 0 ? teal800 : teal,
                    fontSize: 16.0,
                    fontFamily: 'mitr',
                  ),
                ),
                //ปุ่มกด
                InkWell(
                  onTap: () async {
                    await _storeOnboardInfo();
                    if (index == screens.length - 1) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => ConvexBar()));
                    }

                    _pageControllers.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? white : teal,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'NEXT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: index % 2 == 0 ? teal : white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'mitr',
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: index % 2 == 0 ? teal : white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

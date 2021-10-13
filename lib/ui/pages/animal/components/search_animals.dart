import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/service/fire_base/animal_search.dart';
import 'package:flutter/material.dart';

class SearchAnimals extends StatefulWidget {
  @override
  _SearchAnimalsState createState() => _SearchAnimalsState();
}

class _SearchAnimalsState extends State<SearchAnimals> {

  Widget bgImg() {
    return Opacity(
      opacity: 1,
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
            title: '',
            actions: [],
            leading: EmptyMenu(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AnimalSearch(),
              ],
            ),
          ),
        ),
        CustomBackButtonS(),
      ],
    );
  }
}

class CustomBackButtonS extends StatelessWidget {
  const CustomBackButtonS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 40,
        left: 20,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

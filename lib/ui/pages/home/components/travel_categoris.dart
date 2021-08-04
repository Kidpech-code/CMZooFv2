import 'package:cmzoofv2/components/constants.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelCategories extends StatefulWidget {
  const TravelCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<TravelCategories> createState() => _TravelCategoriesState();
}

class _TravelCategoriesState extends State<TravelCategories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> placesCategoris = [
      "Mammal",
      "Amphibibian",
      "Poultry",
      "Reptiles",
    ];
    return Padding(
      padding: EdgeInsets.all(30),
      child: SizedBox(
        height: isTab(context) ? 35 : 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: placesCategoris.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  this.selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  placesCategoris[index],
                  style: GoogleFonts.merriweather(
                      fontSize: isTab(context) ? 24 : 16,
                      color:
                          selectedIndex == index ? kPrimaryColor : kTextColor,
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

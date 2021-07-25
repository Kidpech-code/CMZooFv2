import 'package:cmzoofv2/ui/animaldata/animaldata.dart';
import 'package:flutter/material.dart';

Widget detailAnimal(AnimalData animal) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.0),
    width: double.infinity,
    height: 160.0,
    child: Card(
      color: Colors.green[200],
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 8.0),
                height: 160.0,
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(animal.animalImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.animalName,
                    style: TextStyle(
                      fontSize: 22.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'mitr',
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    animal.animalEngname,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'mitr',
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    animal.animalType,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'mitr',
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.pets),
                      SizedBox(width: 5.0),
                      Text(
                        animal.animalNum.toString(),
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'mitr',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.bookmark_border),
          ],
        ),
      ),
    ),
  );
}

import 'package:cmzoofv2/Model/onboard_model.dart';
import 'package:flutter/material.dart';

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    img: 'icons/lion.png',
    text: "สวนสัตว์เชียงใหม่",
    desc: "ขอตอนรับทุกคน",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'icons/shark.png',
    text: "อควาเรียม",
    desc: "ยาวที่สุดในโลก",
    bg: Color(0xFF4756DF),
    button: Colors.white,
  ),
  OnboardModel(
    img: 'icons/tiger.png',
    text: "แนะนำการใช้งาน",
    desc: "มีขั้นตอนดังนี้",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
];

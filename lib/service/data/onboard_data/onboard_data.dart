import 'package:cmzoofv2/Model/onboard_model.dart';
import 'package:flutter/material.dart';

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    img: 'icons/lion.png',
    text: "สวนสัตว์เชียงใหม่",
    desc: "ขอตอนรับทุกคนสู้แอพพลิเคชัน",
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
  OnboardModel(
    img: 'imguse/use1.jpg',
    text: "ในส่วนของหน้าแรกจะเป็นหน้าบอกข่าวสารกิจกรรมของทางสวนสัตว์",
    desc: "หมายเลข1 จะเป็นส่วนข่าวสาร\nหมายเลข2 จะเป็นส่วนของกิจกรรม",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'imguse/use2.jpg',
    text: "ในส่วนของหน้าที่สองจะเป็นหน้าบอกข้อมูลสัตว์ในสวนสัตว์",
    desc:
        "หมายเลข1 เป็นข้อมูลสัตว์แต่ละประเภท\nหมายเลข2 เป็นส่วนของการค้นหาข้อมูล\nหมายเลข3 เป็นส่วนของARสัตว์\nหมายเลข4 เป็นส่วนของวิดีโอสัตว์\nหมายเลข5 เป็นส่วนของสัตว์หายาก",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'imguse/use3.jpg',
    text: "ในส่วนของหน้าที่สามจะเป็นหน้าบอกราคาบัตรต่างๆ",
    desc: "หมายเลข1 สามารถกดเข้าไปจองตั๋วล่วงหน้าได้\n",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'imguse/use4.jpg',
    text: "ในส่วนของหน้าที่สี่จะเป็นหน้าบอกแผนที่ของสวนสัตว์",
    desc:
        "หมายเลข1 เป็นแผนที่ขนาดเล็กของสวนสัตว์\nหมายเลข2 เป็นแถบบอกข้อมูลในแต่ละโซน\nหมายเลข3 สามารถกดเข้าไปดูตำแหน่งของตัวเองแล้วสัตว์ได้",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'imguse/use5.jpg',
    text: "ในส่วนของหน้าที่ห้าจะเป็นหน้าบอกช่องทางต่างของสวนสัตว์",
    desc:
        "หมายเลข1 เป็นFacebookของสวนสัตว์\nหมายเลข2 เป็นYoutubeของสวนสัตว์\nหมายเลข3 เป็นเว็บไซค์ของสวนสัตว์",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
];

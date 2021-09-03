import 'package:flutter/material.dart';

class DetailRecommemded extends StatefulWidget {
  const DetailRecommemded({
    Key? key,
    required this.recommemdedid,
  }) : super(key: key);

  final String recommemdedid;

  @override
  _DetailRecommemdedState createState() => _DetailRecommemdedState();
}

class _DetailRecommemdedState extends State<DetailRecommemded> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("ID: ${widget.recommemdedid}"),
      ),
    );
  }
}

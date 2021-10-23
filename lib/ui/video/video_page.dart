import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/components/app_bar.dart';
import 'package:cmzoofv2/responsive.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final CollectionReference _list_Video =
      FirebaseFirestore.instance.collection("list_video");

  Widget bgImg() {
    return Opacity(
      opacity: 0.6,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
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
          appBar: buildAppBar(
            context,
            title: '',
            actions: [],
            leading: EmptyMenu(),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            child: Stack(
              children: [
                FutureBuilder<QuerySnapshot>(
                  future: _list_Video.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Scaffold(
                        body: Center(
                          child: Text("Error: ${snapshot.error}"),
                        ),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12),
                          child: Column(
                            verticalDirection: VerticalDirection.up,
                            children: snapshot.data!.docs.map(
                              (document) {
                                return ExpansionTileCard(
                                  expandedTextColor: Colors.teal,
                                  title: Text(
                                    document['title'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(document['subtitle']),
                                  leading: CircleAvatar(
                                    radius: 30,
                                    child: Hero(
                                      tag: document.id,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          document['img'],
                                          width: double.infinity,
                                          height: isTab(context) ? 400 : 250,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  initialPadding: EdgeInsets.all(5),
                                  children: <Widget>[
                                    Divider(
                                      thickness: 1.0,
                                      height: 1.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 8.0,
                                        ),
                                        child: BetterPlayer.network(
                                          "${document['url']}",
                                          betterPlayerConfiguration:
                                              BetterPlayerConfiguration(
                                            aspectRatio: 16 / 9,
                                            looping: false,
                                            autoPlay: false,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      );
                    }

                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        CustomBackButtonVi(),
      ],
    );
  }
}

class CustomBackButtonVi extends StatelessWidget {
  const CustomBackButtonVi({
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

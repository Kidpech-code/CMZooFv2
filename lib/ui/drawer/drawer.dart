/*import 'package:CMZoo/pages/animalpage.dart';
import 'package:CMZoo/pages/aquarium.dart';
import 'package:CMZoo/pages/mappage.dart';
import 'package:CMZoo/pages/ticketpage.dart';
import 'package:CMZoo/pages/dashborad.dart';
import 'package:CMZoo/widget/show.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowDrawer extends StatefulWidget {
  @override
  _ShowDrawerState createState() => _ShowDrawerState();
}

class _ShowDrawerState extends State<ShowDrawer> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String nameString, idpasswordString;

  Widget showListDashBorad() {
    return ListTile(
      leading: Icon(
        Icons.home,
        size: 35.0,
        color: Colors.green[900],
      ),
      title: Text(
        'หน้าหลัก',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('ข่าวสารต่างๆของสวนสัตร์'),
      onTap: () {
        Navigator.of(context).pop();
        MaterialPageRoute route = MaterialPageRoute(
            builder: (BuildContext context) => DashboradPage());
        Navigator.push(context, route);
      },
    );
  }

  Widget showListAnimal() {
    return ListTile(
      leading: Icon(
        Icons.pets,
        size: 35.0,
        color: Colors.red[900],
      ),
      title: Text(
        'สัตว์',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('ประเภทของสัตว์ต่างๆ'),
      onTap: () {
        Navigator.of(context).pop();
        MaterialPageRoute route =
            MaterialPageRoute(builder: (BuildContext context) => AnimalPage());
        Navigator.push(context, route);
      },
    );
  }

  Widget showListaquariam() {
    return ListTile(
      leading: Icon(
        Icons.anchor,
        size: 35.0,
        color: Colors.blue[900],
      ),
      title: Text(
        'อควาเรียม',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('ท่องสู่โลกแห่งใต้ท้องทะเล'),
      onTap: () {
        Navigator.of(context).pop();
        MaterialPageRoute route = MaterialPageRoute(
            builder: (BuildContext context) => AquariumPage());
        Navigator.push(context, route);
      },
    );
  }

  Widget showListTicket() {
    return ListTile(
      leading: Icon(
        Icons.confirmation_number,
        size: 35.0,
        color: Colors.orange[900],
      ),
      title: Text(
        'ราคาบัตร',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('บอกราคาของบัตรและบริการต่างๆ'),
      onTap: () {
        Navigator.of(context).pop();
        MaterialPageRoute route =
            MaterialPageRoute(builder: (BuildContext context) => TicketPage());
        Navigator.push(context, route);
      },
    );
  }

  Widget showListMap() {
    return ListTile(
      leading: Icon(
        Icons.map,
        size: 35.0,
        color: Colors.grey[900],
      ),
      title: Text(
        'แผนที่สวนสัตว์',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('บอกโซนต่างๆของสวนสัตว์'),
      onTap: () {
        Navigator.of(context).pop();
        MaterialPageRoute route =
            MaterialPageRoute(builder: (BuildContext context) => MapPage());
        Navigator.push(context, route);
      },
    );
  }

  //ฟังก์ชัน ภาพLogIn เข้าระบบ
  /*void _signinWithEmailPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MapPage();
      }));
    } catch (e) {
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text('Failed to sign in email and password'),
      ));
      print(e);
    }
  }*/

  Widget showLogo() {
    return GestureDetector(
      key: _scaffoldkey,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'สำหรับพนักงาน',
                  style: TextStyle(
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'images/logo.png',
                    height: 200,
                    width: 200,
                  ),
                  userForm(),
                  idForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: RaisedButton(
                          color: Colors.greenAccent[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: () async {
                            print('เข้าสู่ระบบ');
                            if (_formkey.currentState.validate()) {
                              //_signinWithEmailPassword();
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: RaisedButton(
                          color: Colors.redAccent[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'ยกเลิก',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 90.0,
        height: 90.0,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget userForm() => Container(
        width: 250.0,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: Colors.lightGreen,
            ),
            hintStyle: TextStyle(color: Colors.grey[300]),
            hintText: 'Name@cmzoo.com',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green[900]),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreenAccent[400]),
            ),
          ),
          validator: (String val) {
            if (!((val.contains('@')) && (val.contains('.')))) {
              return 'กรุณากรอกชื่อแล้วตามด้วย @cmzoo.com';
            }
            return null;
          },
          onSaved: (String val) {
            nameString = val.trim();
          },
        ),
      );

  Widget idForm() => Container(
        width: 250.0,
        child: TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.lightGreen,
            ),
            hintStyle: TextStyle(color: Colors.grey[300]),
            hintText: 'รหัสบัตรพนักงาน',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green[900]),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreenAccent[400]),
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'กรุณากรอกเลขบัตรพนักงาน';
            }
            return null;
          },
          onSaved: (String value) {
            idpasswordString = value.trim();
          },
        ),
      );

  Widget showHead() {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/lion_1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          showLogo(),
          Show().showAppName(),
          SizedBox(
            height: 5.0,
          ),
          Show().showAppEmail(),
        ],
      ),
    );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHead(),
          showListDashBorad(),
          showListAnimal(),
          showListaquariam(),
          showListTicket(),
          showListMap(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showDrawer(),
    );
  }
}*/

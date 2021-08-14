import 'package:flutter/material.dart';
import 'package:ticket_material/ticket_material.dart';

class NewPrice extends StatelessWidget {
  const NewPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TicketMaterial(
      height: 50,
      colorBackground: Colors.blue,
      leftChild: _buildLeft(),
      rightChild: _buildRight(),
    );
  }

  Widget _buildLeft() {
    return Container(
      child: Center(
        child: Text('LEFT PART'),
      ),
    );
  }

  Widget _buildRight() {
    return Container(
      child: Center(
        child: Icon(Icons.airplanemode_active),
      ),
    );
  }
}

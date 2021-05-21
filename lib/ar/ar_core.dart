/*import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARcore extends StatefulWidget {
  @override
  _ARcoreState createState() => _ARcoreState();
}

class _ARcoreState extends State<ARcore> {
  late ArCoreController arCoreController;
  void dipsose() {
    super.dispose();
    arCoreController.dispose();
  }

  _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addSphere(arCoreController);
  }

  _addSphere(ArCoreController controller) {
    final material = ArCoreMaterial(color: Colors.red);
    final sphere = ArCoreSphere(materials: [material], radius: 0.2);
    final node = ArCoreNode(
      name: 'sphere',
      shape: sphere,
      position: vector.Vector3(0, -1, -1),
      rotation: vector.Vector4(0, 0, 0, 0),
    );
    controller.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated),
    );
  }
}*/

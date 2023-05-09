import 'package:arcore_flutter_plugin/src/arcore_augmented_image.dart';
import 'package:arcore_flutter_plugin/src/arcore_controller.dart';
import 'package:arcore_flutter_plugin/src/arcore_image.dart';
import 'package:arcore_flutter_plugin/src/arcore_node.dart';
import 'package:arcore_flutter_plugin/src/arcore_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class AugmentedPage extends StatefulWidget {
  @override
  _AugmentedPageState createState() => _AugmentedPageState();
}

class _AugmentedPageState extends State<AugmentedPage> {
  ArCoreController? arCoreController;
  Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AugmentedPage'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enablePlaneRenderer: false,
          type: ArCoreViewType.AUGMENTEDIMAGES,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(dynamic controller) {
    if (controller is ArCoreController) {
      arCoreController = controller;
      arCoreController?.onTrackingImage =
          _handleOnTrackingImage as ArCoreAugmentedImageTrackingHandler?;
      loadSingleImage();
    }
  }

  loadSingleImage() async {
    final ByteData bytes = await rootBundle.load('assets/images/logo_ar.jpg');
    arCoreController?.loadSingleAugmentedImage(
        bytes: bytes.buffer.asUint8List());
  }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
      augmentedImagesMap[augmentedImage.index] = augmentedImage;
      _addImage(augmentedImage);
    }
  }

  Future _addImage(ArCoreAugmentedImage augmentedImage) async {
    final bytes =
        (await rootBundle.load('assets/images/test.png')).buffer.asUint8List();
    final img = ArCoreNode(
        image: ArCoreImage(bytes: bytes, width: 500, height: 500),
        position: vector.Vector3(0.0, 0.0, 0.05),
        rotation: vector.Vector4(0.0, -1.0, 1.0, 0.0),
        scale: vector.Vector3(0.175, 0.175, 0.175));
    arCoreController?.addArCoreNodeToAugmentedImage(img, augmentedImage.index);
  }

  @override
  void dispose() {
    arCoreController?.dispose();
    super.dispose();
  }
}

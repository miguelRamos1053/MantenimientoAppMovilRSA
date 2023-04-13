import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
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

  void _onArCoreViewCreated(ArCoreController controller) async {
    arCoreController = controller;
    arCoreController?.onTrackingImage = _handleOnTrackingImage;
    loadSingleImage();
    //OR
    //loadImagesDatabase();
  }

  loadSingleImage() async {
    final ByteData bytes = await rootBundle.load('assets/logo_ar.jpg');
    arCoreController?.loadSingleAugmentedImage(
        bytes: bytes.buffer.asUint8List());
  }

  loadImagesDatabase() async {
    final ByteData bytes = await rootBundle.load('assets/myimages.imgdb');
    arCoreController?.loadAugmentedImagesDatabase(
        bytes: bytes.buffer.asUint8List());
  }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
      augmentedImagesMap[augmentedImage.index] = augmentedImage;
      //_addSphere(augmentedImage);
      _addImage(augmentedImage);
      //_addCylindre(augmentedImage);
    }
  }

  Future _addSphere(ArCoreAugmentedImage augmentedImage) async {
    final ByteData textureBytes = await rootBundle.load('assets/earth.jpg');

    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      textureBytes: textureBytes.buffer.asUint8List(),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: augmentedImage.extentX / 2,
    );
    final node = ArCoreNode(
      shape: sphere,
    );
    arCoreController?.addArCoreNodeToAugmentedImage(node, augmentedImage.index);
  }

  Future _addImage(ArCoreAugmentedImage augmentedImage) async {
    final bytes =
        (await rootBundle.load('assets/test.png')).buffer.asUint8List();

    final img = ArCoreNode(
        image: ArCoreImage(bytes: bytes, width: 500, height: 500),
        position: vector.Vector3(0.0, 0.0, 0.05),
        rotation: vector.Vector4(0.0, -1.0, 1.0, 0.0),
        scale: vector.Vector3(0.175, 0.175, 0.175));

    arCoreController?.addArCoreNodeToAugmentedImage(img, augmentedImage.index);
  }

  void _addCylindre(ArCoreAugmentedImage augmentedImage) async {
    final ByteData textureBytes = await rootBundle.load('assets/jp.jpg');

    final bytes =
        (await rootBundle.load('assets/test.png')).buffer.asUint8List();

    final material = ArCoreMaterial(
        color: Color.fromARGB(0, 255, 255, 255),
        textureBytes: textureBytes.buffer.asUint8List(),
        metallic: 1.0);
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: augmentedImage.extentX / 2,
      height: augmentedImage.extentX,
    );
    final node = ArCoreNode(
        shape: cylindre, rotation: vector.Vector4(-1.0, -1.0, 1.0, -1.0));
    arCoreController?.addArCoreNodeToAugmentedImage(node, augmentedImage.index);
  }

  @override
  void dispose() {
    arCoreController?.dispose();
    super.dispose();
  }
}

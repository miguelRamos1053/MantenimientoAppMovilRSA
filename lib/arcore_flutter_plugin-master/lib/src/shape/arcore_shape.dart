import '../arcore_material.dart';
import 'package:flutter/widgets.dart';

abstract class ArCoreShape {
  ArCoreShape({required List<ArCoreMaterial> materials})
      : materials = ValueNotifier(materials);

  final ValueNotifier<List<ArCoreMaterial>> materials;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'dartType': runtimeType.toString(),
        'materials': materials.value.map((m) => m.toMap()).toList(),
      }..removeWhere((k, v) => v == null);
}

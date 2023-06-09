import 'arcore_pose.dart';

class ArCorePlane {

  ArCorePlane.fromMap(Map<dynamic, dynamic> map) {
    this.extendX = map['extendX'];
    this.extendZ = map['extendZ'];
    this.centerPose = ArCorePose.fromMap(map['centerPose']);
    this.type = ArCorePlaneType.values[map['type'] ?? 0];
  }
  double? extendX;
  double? extendZ;

  ArCorePose? centerPose;
  ArCorePlaneType? type;
}

enum ArCorePlaneType {
  HORIZONTAL_UPWARD_FACING,
  HORIZONTAL_DOWNWARD_FACING,
  VERTICAL,
}

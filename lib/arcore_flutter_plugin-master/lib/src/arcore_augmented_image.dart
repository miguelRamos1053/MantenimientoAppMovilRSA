import 'arcore_pose.dart';

class ArCoreAugmentedImage {

  ArCoreAugmentedImage.fromMap(Map<dynamic, dynamic> map)
      : this.name = map['name'],
        this.index = map['index'],
        this.extentX = map['extentX'],
        this.extentZ = map['extentZ'],
        this.centerPose = ArCorePose.fromMap(map['centerPose']),
        this.trackingMethod = TrackingMethod.values[map['trackingMethod']];
  String name;
  int index;
  ArCorePose centerPose;
  TrackingMethod trackingMethod;
  double extentX;
  double extentZ;
}

enum TrackingMethod {
  NOT_TRACKING,
  FULL_TRACKING,
  LAST_KNOWN_POSE,
}

import 'package:jimu/common/index.dart';

extension FixDouble on double {
  double get dp {
    return SizeFit.fitWidth(this);
  }
}

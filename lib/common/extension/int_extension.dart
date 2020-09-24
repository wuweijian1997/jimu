import 'package:jimu/common/index.dart';

extension FixInt on int {
  double get dp {
    return SizeFit.fitWidth(this.toDouble());
  }
}

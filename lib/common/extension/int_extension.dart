import 'package:jimu/common/index.dart';

extension FixInt on int {
  double get px {
    return SizeFit.fitWidth(this.toDouble());
  }
}

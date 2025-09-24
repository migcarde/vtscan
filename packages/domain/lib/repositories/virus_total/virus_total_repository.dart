import 'dart:io';

import 'package:result/result.dart';

abstract class VirusTotalRepository {
  Future<Result<String>> postFile(
    File file,
  );
}

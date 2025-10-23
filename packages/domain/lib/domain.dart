import 'package:local/local.dart';
import 'package:riverpod/riverpod.dart';

export 'use_cases/use_cases.dart';
export 'base/base.dart';
export 'core/domain_providers.dart';

class Domain {
  final String apiKey;

  static Domain? _instance = Domain._internal('');

  static Future<void> init({required String apiKey}) async {
    _instance = Domain._internal(apiKey);

    await ProviderContainer().read(objectBoxProvider.notifier);
  }

  Domain._internal(this.apiKey);

  static Domain get instance {
    if (_instance == null) {
      throw Exception('Domain is not initialized');
    }
    return _instance!;
  }
}

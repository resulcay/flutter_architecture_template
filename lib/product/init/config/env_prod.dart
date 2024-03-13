import 'package:envied/envied.dart';
import 'package:pureblog/product/init/config/app_config.dart';

part 'env_prod.g.dart';

@Envied(
  obfuscate: true,
  path: 'assets/env/.prod.env',
)
final class ProdEnv implements AppConfig {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _ProdEnv._baseUrl;

  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _ProdEnv._apiKey;

  @override
  String get apiKey => _apiKey;

  @override
  String get baseUrl => _baseUrl;
}

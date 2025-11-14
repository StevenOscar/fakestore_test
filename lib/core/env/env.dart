import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(obfuscate: true, varName: 'FAKESTORE_BASE_URL')
  static final String baseUrl = _Env.baseUrl;
}

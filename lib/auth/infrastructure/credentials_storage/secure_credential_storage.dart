import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oauth2/oauth2.dart';
import 'credential_storage.dart';

class SecureCredentialsStorage implements CredentialsStorage {
  SecureCredentialsStorage(this._secureStorage);

  final FlutterSecureStorage _secureStorage;
  Credentials? _currentCredentials;

  static const _key = 'oauth2_credentials';

  @override
  Future<void> clear() {
    return _secureStorage.delete(key: _key);
  }

  @override
  Future<Credentials?> read() async {
    final data = await _secureStorage.read(key: _key);
    if (data == null) {
      return _currentCredentials = null;
    }
    try {
      return _currentCredentials = Credentials.fromJson(data);
    } on FormatException {
      return _currentCredentials = null;
    }
  }

  @override
  Future<void> save(Credentials credentials) {
    _currentCredentials = credentials;
    return _secureStorage.write(key: _key, value: credentials.toJson());
  }
}

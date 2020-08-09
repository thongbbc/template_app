import 'package:dio/dio.dart';
import 'package:templateapp/services/spref.dart';
import 'package:templateapp/utils/constant.dart';

class NetWorkClient {
  static final BaseOptions _options = BaseOptions(
    baseUrl: ConfigSystems.baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  static final Dio _dio = Dio(_options);

  NetWorkClient._internal() {
    _dio.clear();
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options) async {
      if (options.headers.containsKey(ConfigSystems.requiresToken)) {
        //remove the auxiliary header
        options.headers.remove(ConfigSystems.requiresToken);
        final String token = await SPref.instance.get(SPrefCache.KEY_TOKEN);
        final String cookie = await SPref.instance.get(SPrefCache.KEY_COOKIE);
        options.headers[ConfigSystems.token] = token;
        options.headers[ConfigSystems.cookie] = cookie;
      }
      return options;
    }));
  }
  static final NetWorkClient instance = NetWorkClient._internal();

  Dio get dio => _dio;
}

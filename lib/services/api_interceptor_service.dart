import 'package:http_interceptor/http_interceptor.dart';

class ApiInterceptorService implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    try {
      data.headers["Content-Type"] = "application/json";
    } catch (e) {
      print(e);
    }
    print(data.headers);
    print(data.url);
    print(data.params);
    print(data.body.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data.body.toString());
    return data;
  }
}

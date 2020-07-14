import 'package:dio/dio.dart';

enum NMMethod { GET, POST, DELETE, PUT }

//使用：NWMethodValues[NWMethod.POST]
const NMMethodValues = {
  NMMethod.GET: "get",
  NMMethod.POST: "post",
  NMMethod.DELETE: "delete",
  NMMethod.PUT: "put"
};

class BaseUrl {
  // 配置默认请求地址
  static const String url = 'https://api.github.com';
}

class FTNetManager {
  //
  static void get(String url,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function success,
      Function error}) async {
    // 数据拼接
    // if (data != null && data.isNotEmpty) {
    //   StringBuffer options = new StringBuffer('?');
    //   data.forEach((key, value) {
    //     // ignore: unnecessary_brace_in_string_interps
    //     options.write('${key}=${value}&');
    //   });
    //   String optionsStr = options.toString();
    //   optionsStr = optionsStr.substring(0, optionsStr.length - 1);
    //   url += optionsStr;
    // }

    // 发送get请求
    await _sendRequest(
      url,
      NMMethod.GET,
      success,
      headers: headers,
      error: error,
    );
  }

  static void post(String url,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function success,
      Function error}) async {
    // 发送post请求
    _sendRequest(
      url,
      NMMethod.POST,
      success,
      data: data,
      headers: headers,
      error: error,
    );
  }

  // 请求处理
  static Future _sendRequest(String url, NMMethod method, Function success,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function error}) async {
    // int _code;
    String _msg;
    var _backData;

    // 检测请求地址是否是完整地址
    if (!url.startsWith('http')) {
      url = BaseUrl.url + url;
    }

    try {
      Map<String, dynamic> dataMap = data == null ? new Map() : data;
      Map<String, dynamic> headersMap = headers == null ? new Map() : headers;

      // 配置dio请求信息
      Response response;
      Dio dio = new Dio();
      dio.options.connectTimeout = 100000; // 服务器链接超时，毫秒
      dio.options.receiveTimeout = 30000; // 响应流上前后两次接受到数据的间隔，毫秒
      dio.options.headers.addAll(headersMap); // 添加headers,统一设置Header
      dio.interceptors.add(LogInterceptor(requestBody: true));

      switch (method) {
        case NMMethod.POST:
          response = await dio.post(url, data: dataMap);
          break;
        case NMMethod.DELETE:
          response = await dio.delete(url, data: dataMap);
          break;
        case NMMethod.PUT:
          response = await dio.put(url, data: dataMap);
          break;
        default:
          response = await dio.get(url);
      }

      if (response.statusCode != 200) {
        _msg = '网络请求错误,状态码:' + response.statusCode.toString();
        _handError(error, _msg);
        return;
      }

      // 数据请求成功
      // print(response.data);

      if (response.data is Map) {
        Map<String, dynamic> _resCallbackMap = response.data;
        _backData = _resCallbackMap;
      } else if (response.data is List) {
        List _resCallbackList = response.data;
        _backData = _resCallbackList;
      } else {
        _backData = response.data;
      }

      if (success != null) {
        success(_backData);
        // if (_code == 0) {
        //   success(_backData);
        // } else {
        //   String errorMsg = _code.toString() + ':' + _msg;
        //   _handError(error, errorMsg);
        // }
      }
    } catch (exception) {
      _handError(error, '数据请求错误：' + exception.toString());
    }
  }

  // 返回错误信息
  // ignore: missing_return
  static Future _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
  }
}

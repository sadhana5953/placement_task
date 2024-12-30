import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TodoHelper
{
  Future fetchData()
  async {
    Uri Url=Uri.parse('https://jsonplaceholder.typicode.com/todos');
    Response response = await http.get(Url);
    if(response.statusCode==200) {
      final json=response.body;
      final List data=jsonDecode(json);
      return data;
    }
    else {
      return {};
    }
  }
}
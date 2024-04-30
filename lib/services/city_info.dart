import 'package:http/http.dart';
import 'package:guidely/services/server_config.dart';
import "dart:convert" as convert;

Future<Map> getAllCities() async {
  try {
    Response response = await get(Uri.http('$SERVER_HOST:$SERVER_PORT', '/city/all'));
    
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      return {"cities": []};
    }
  } catch (e) {
    return {"cities": []};
  }
}

Future<Map> getCityById(cityId) async {
  try {
    Response response = await get(Uri.http('$SERVER_HOST:$SERVER_PORT', '/city/$cityId'));
    
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      return {};
    }
  } catch (e) {
    return {};
  }
}

Future<Map> getCityGenericTours(cityId) async {
  try {
    Response response = await get(Uri.http('$SERVER_HOST:$SERVER_PORT', '/city/$cityId/tours'));
    
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      return {"generic_tours": []};
    }
  } catch (e) {
    return {"generic_tours": []};
  }
}
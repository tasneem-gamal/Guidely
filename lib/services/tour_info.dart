import 'package:http/http.dart';
import 'package:guidely/services/server_config.dart';
import "dart:convert" as convert;

Future<Map> getAllGenericTours() async {
  try {
    Response response = await get(Uri.http('$SERVER_HOST:$SERVER_PORT', '/tour/generic/all'));
    
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

Future<Map> getTourById(tourId) async {
  try {
    Response response = await get(Uri.http('$SERVER_HOST:$SERVER_PORT', '/tour/$tourId'));
    
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

Future<Map> getGenericTourById(genericTourId) async {
  try {
    Response response = await get(Uri.http('$SERVER_HOST:$SERVER_PORT', '/tour/generic/$genericTourId'));
    
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

Future<Map> getGenericTourGuides(genericTourId) async {
  try {
    Response response = await get(Uri.http('$SERVER_HOST:$SERVER_PORT', '/tour/generic/$genericTourId/guides'));
    
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      return {"guides": []};
    }
  } catch (e) {
    return {"guides": []};
  }
}
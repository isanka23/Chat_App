import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chat_app/models/image_model.dart';

class ImageRepository{
  Future<List<PixelFordImage>> getNetworkImage() async {
    var endpointUrl = Uri.parse("https://pixelford.com/api2/images");

    try {
      final response = await http.get(endpointUrl);

      // Check if the request was successful
      if (response.statusCode == 200) {
        final List<dynamic> decodeList = jsonDecode(response.body) as List;
        final List<PixelFordImage> _imageList = decodeList.map((listItem) {
          return PixelFordImage.fromJson(listItem);
        }).toList();
        return _imageList;
      } else {
        throw Exception(
            'Failed to load images. Status code: ${response.statusCode}');
      }
    } catch (e) {
      return [];
    }
  }
}
import 'package:data/operations/chars/char_response.dart';
import 'package:data/operations/chars/char_service.dart';

class CharRemoteDataSource {
  late final CharService charService;

  CharRemoteDataSource({required this.charService});

  Future<List<CharResponse>> getChars(int type) async {
    final response = await charService.getChars(type);

    return response.map((json) => CharResponse.fromJson(json)).toList();
  }
}

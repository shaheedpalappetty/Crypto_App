import 'dart:convert';

import 'package:bloc_crypto_coin/model/crypto_model.dart';
import 'package:http/http.dart' as http;

class CryptoApi {
  static Future<List<Crypto>> fetchData() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      final crypto = body.map(
        (e) {
          return Crypto.fromJson(e);
        },
      ).toList();
      return crypto;
    } else {
      return [];
    }
  }
}

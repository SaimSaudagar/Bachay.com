import 'dart:convert';
import 'package:app/Models/Address/Address.dart';
import 'package:http/http.dart' as http;
import 'package:app/Utils/app_constants.dart';

class AddressRepository {
  Future<AddressList> fetchAllAddresses() async {
    try {
      final response = await http
          .get(Uri.parse('${baseUrl}customer/address/list'), headers: {
        'Authorization': await getToken(),
      });

      if (response.statusCode == 200) {
        return AddressList.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load addresses');
      }
    } catch (e) {
      throw Exception('Failed to load addresses');
    }
  }
}

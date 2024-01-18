import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:github_commits/Interfaces/commitInterface.dart';

class GithubApi {
  final String baseUrl = 'https://githubcommits.up.railway.app/api/v1/commits/';

  Future<List<Commit>> fetchCommits() async {
    try {
      final url = Uri.parse(baseUrl);
      final headers = {"Content-Type": "application/json"};
      final body = json.encode({
        'username': 'loremorayma2'
      }); 

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Commit> commits =
            data.map((item) => Commit.fromJson(item)).toList();
        return commits;
      } else {
        print('Error al cargar commits: ${response.statusCode}');
        print('Respuesta: ${response.body}');
        throw Exception('Failed to load commits');
      }
    } catch (e) {
      print('Excepción al cargar commits: $e');
      throw Exception('Failed to load commits');
    }
  }
}

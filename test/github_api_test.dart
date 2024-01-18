import 'package:flutter_test/flutter_test.dart';
import 'package:github_commits/Infrastructure/api/githubApi.dart';

void main() {
  group('GithubApi', () {
    test('fetchCommits returns a list of commits', () async {
      final githubApi = GithubApi();

      // Llama a fetchCommits y verifica que devuelva una lista de commits
      final commits = await githubApi.fetchCommits();

      // Verifica que commits no sea nulo y que contenga al menos un commit
      expect(commits, isNotNull);
      expect(commits.isNotEmpty, true);
    });
  });
}

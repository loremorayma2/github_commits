class Commit {
  final String sha;
  final String message;
  final String repoName;

  Commit({
    required this.sha,
    required this.message,
    required this.repoName,
  });

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      sha: json['sha'] as String,
      message: json['message'] as String,
      repoName: json['repo_name'] as String,
    );
  }
}

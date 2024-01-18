import 'package:flutter/material.dart';
import 'package:github_commits/UI/components/button.dart';
import 'package:github_commits/UI/components/card.dart';
import 'package:github_commits/Utils/icons.dart';
import 'package:github_commits/styles/colors.dart';
import 'package:github_commits/Infrastructure/api/githubApi.dart';
import 'package:github_commits/Interfaces/commitInterface.dart';
import 'package:url_launcher/url_launcher.dart';

class CommitsPage extends StatelessWidget {
  final GithubApi githubApi = GithubApi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: null,
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.githubIcon(
                    width: 48.0,
                    height: 48.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          color: deepPurple,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: FutureBuilder<List<Commit>>(
                      future: githubApi.fetchCommits(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: SizedBox(
                              height: 48.0,
                              width: 48.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Text('Not found');
                        } else {
                          // Tenemos datos, mostrar la lista
                          final commits = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: commits.length,
                            itemBuilder: (context, index) {
                              final commit = commits[index];
                              return CommitCard(
                                title: commit.message,
                                subtitle: commit.repoName,
                                onPressed1: () {},
                                onPressed2: () {},
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                      child: Button.heading5Style(
                        text: 'Profile',
                        bgColor: secondaryColor,
                        hoverColor: hover,
                        disableColor: disabled,
                        paddingX: 57.0,
                        paddingY: 17.0,
                        onPressed: () async {
                          const url = 'https://github.com/loremorayma2';
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceSafariVC: false,
                              forceWebView: false,
                              headers: <String, String>{
                                'header_key': 'header_value'
                              },
                            );
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

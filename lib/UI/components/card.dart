import 'package:flutter/material.dart';
import 'package:github_commits/Utils/icons.dart';
import 'package:github_commits/styles/colors.dart';

class CommitCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  const CommitCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressed1,
    required this.onPressed2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dark2,
      shadowColor: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              AppIcons.githubIcon(
                width: 48.0,
                height: 48.0,
                color: deepPurple,
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(title, style: TextStyle(color: white),textAlign: TextAlign.end,),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          subtitle,
                          style: TextStyle(color: orange),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lab_examples/appstyles/app_colors.dart';
import 'package:lab_examples/appstyles/app_styles.dart';
import 'package:lab_examples/modules/destiny/story_brain.dart';

class Destiny extends StatefulWidget {
  @override
  _DestinyState createState() => _DestinyState();
}

class _DestinyState extends State<Destiny> {
  StoryBrain storyBrain = new StoryBrain();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: AppStyles.textwidget("Destiny",
          fontWeight: FontWeight.w300,
          color: AppColors.white,
          heightInline: 1.2),
      centerTitle: true,
      backgroundColor: Colors.blueGrey[900],
    );

    final body = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  storyBrain.getStory(),
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    storyBrain.nextStory(1);
                  });
                },
                color: Colors.red,
                child: Text(
                  storyBrain.getChoice1(),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(2);
                    });
                  },
                  color: Colors.blue,
                  child: Text(
                    storyBrain.getChoice2(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: appBar,
      body: body,
    );
  }
}

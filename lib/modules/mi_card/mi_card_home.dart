import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';

class MiCard extends StatefulWidget {
  @override
  _MiCardState createState() => _MiCardState();
}

class _MiCardState extends State<MiCard> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: AppStyles.textwidget("Mi Card",
          fontWeight: FontWeight.w300,
          color: AppColors.white,
          heightInline: 1.2),
      centerTitle: true,
      backgroundColor: Colors.teal[900],
    );

    final body = SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
            AppStyles.textwidget('Harshdeep Singh',
                fontSize: 40.0,
                fontFamily: 'Pacifico',
                color: AppColors.white,
                heightInline: 1.5,
                fontWeight: FontWeight.bold),
            AppStyles.textwidget('FLUTTER DEVELOPER',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                heightInline: 1.5,
                color: Colors.teal.shade100),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: AppStyles.textwidget('+91 9971324287',
                    fontWeight: FontWeight.w400,
                    color: Colors.teal.shade900,
                    fontSize: 20.0),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: AppStyles.textwidget('harshdeeps878@gmail.com',
                    fontWeight: FontWeight.w400,
                    color: Colors.teal.shade900,
                    fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.teal,
      body: body,
    );
  }
}

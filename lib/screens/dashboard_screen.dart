import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/screens/architecture_model.dart';
import 'package:lab_experiments/screens/ui_module.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 480, height: 810, allowFontScaling: true);
    final appBar = AppBar(
      title: AppStyles.textwidget("Lab Experiments",
          color: AppColors.antiqueBrass, heightInline: 1.5),
    );

    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: true,
      // Landing screen
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: AppStyles.textwidget('UI Modules',
                  fontSize: 13, fontWeight: FontWeight.w400),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.description,
              ),
              title: AppStyles.textwidget('Architecture Modules',
                  fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle:
              AppStyles.textStyle(AppColors.activeCard, AppStyles.fontSize(12)),
          unselectedLabelStyle:
              AppStyles.textStyle(AppColors.black, AppStyles.fontSize(12)),
          selectedItemColor: AppColors.antiqueBrass,
          unselectedItemColor: AppColors.black,
          onTap: (index) {
            this.setState(() {
              _selectedIndex = index;
            });
          }),
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Material(
          color: AppColors.antiqueBrass,
          child: SafeArea(
              child: [
            UIModules(),
            ArchModule()
          ].elementAt(_selectedIndex)),
        ),
      ),
    );
  }
}

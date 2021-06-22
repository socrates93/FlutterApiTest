import 'package:flutter/material.dart';

import 'package:fluttertest_altice/pages/app_details_page.dart';
import 'package:fluttertest_altice/pages/home_page.dart';
import 'package:fluttertest_altice/pages/post_details_page.dart';

final appRoutes = {
  "home": (BuildContext _) => HomePage(),
  "details": (BuildContext _) => PostDetailsPage(),
  "appdetails": (BuildContext _) => AppDetailsPage(),
};

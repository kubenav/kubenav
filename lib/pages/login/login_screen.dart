import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/pages/login/login_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Constants.colorPrimary,
      body: Center(
        child: Icon(
          CustomIcons.kubenav,
          color: Colors.white,
          size: 256,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram_app/core/constants/colors.dart';
import 'package:instagram_app/core/helpers/helpers.dart';
import 'package:instagram_app/presentation/global_widgets/custom_auth_button.dart';
import 'package:instagram_app/presentation/global_widgets/custom_text_button.dart';
import 'package:instagram_app/presentation/global_widgets/custom_textfield.dart';
import 'package:instagram_app/presentation/global_widgets/grey_line.dart';
import 'package:instagram_app/presentation/pages/auth/widgets/custom_sized_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              (defaultLogo()),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomSizedBox(
              child: CustomTextField(
                size: size,
                controller: usernameController,
                hint: "Username",
                borderRadius: 7,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomSizedBox(
              child: CustomTextField(
                size: size,
                controller: passwordController,
                hint: "Password",
                borderRadius: 7,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomSizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                    ),
                    style: TextButton.styleFrom(
                        foregroundColor: primaryBlueButtonColor),
                  ),
                ],
              ),
            ),
            CustomSizedBox(
              child: CustomAuthButton(
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(defaultFacebookLogo()),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Log in with facebook',
                    style: TextStyle(color: primaryBlueButtonColor),
                  )
                ],
              ),
            ),
            const CustomSizedBox(
              child: Row(
                children: [
                  GreyLine(sizeRate: 0.3),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                        color: primaryGreyColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GreyLine(
                    sizeRate: 0.3,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: primaryGreyColor,
                    fontSize: 16,
                  ),
                ),
                CustomTextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: primaryBlueButtonColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

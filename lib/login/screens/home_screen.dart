import 'package:flutter/material.dart';
import '../components/components.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TopScreenImage(screenImageName: 'home.jpg'),
              Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, left: 15, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const ScreenTitle(title: '你好'),
                    const Text(
                      '欢迎使用“到没到”\n一款智慧课堂签到系统',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Hero(
                      tag: 'login_btn',
                      child: CustomButton(
                        buttonText: '登录',
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Hero(
                      tag: 'signup_btn',
                      child: CustomButton(
                        buttonText: '注册',
                        isOutlined: true,
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.id);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // const Text(
                    //   'Sign up using',
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //     fontSize: 16,
                    //   ),
                    // ),
                    const SetIP()
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: CircleAvatar(
                    //         radius: 25,
                    //         child:
                    //             Image.asset('assets/images/icons/facebook.png'),
                    //       ),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: CircleAvatar(
                    //         radius: 25,
                    //         backgroundColor: Colors.transparent,
                    //         child:
                    //             Image.asset('assets/images/icons/google.png'),
                    //       ),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: CircleAvatar(
                    //         radius: 25,
                    //         child:
                    //             Image.asset('assets/images/icons/linkedin.png'),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

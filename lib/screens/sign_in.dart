import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:white_matrix_ecommerce/screens/scratch_card.dart';
import 'package:white_matrix_ecommerce/utils/widgets/custom_bottom_bar.dart';
import 'package:white_matrix_ecommerce/screens/otp_screen.dart';
import 'package:white_matrix_ecommerce/utils/theme/custom_themes/text_theme.dart';

class CredentialSignIn extends StatefulWidget {
  const CredentialSignIn({super.key});

  @override
  State<CredentialSignIn> createState() => _CredentialSignInState();
}

class _CredentialSignInState extends State<CredentialSignIn> {
  final TextEditingController _phoneNoSignInController =
      TextEditingController();
  final TextEditingController _emailSignUpController = TextEditingController();
  final TextEditingController _phoneNoSignUpController =
      TextEditingController();
  final TextEditingController _nameSignUpController = TextEditingController();

  final _SignInKey = GlobalKey<FormState>();

  final _signUpKey = GlobalKey<FormState>();
  // final _phoneNoSignUpKey = GlobalKey<FormState>();
  // final _nameSignUpKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();

  bool _isPageLoading = true;

  @override
  void dispose() {
    _phoneNoSignInController.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool _isRememberMe = true;
  bool _isVisibility = false;
  bool _isSignInButtonLoading = false;
  bool _isSignUpButtonLoading = false;

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _fnLoadingDelay();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://videos.pexels.com/video-files/8776998/8776998-sd_540_960_25fps.mp4',
      ),
    )..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
          _controller.setVolume(0.0);
        });
      });
  }

  _fnLoadingDelay() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isPageLoading = false;
      });
    });
  }

  _fnNavigateToOtp() async {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ScreenOtpVerification(),
        settings: const RouteSettings(name: '/otpVerification'),
      ),
    );
  }
  // _fnNavigateToHomePage() async {
  //   Navigator.pushReplacement(
  //     context,
  //     CupertinoPageRoute(
  //       builder: (context) => const CustomBottomBar(),
  //       settings: const RouteSettings(name: '/home'),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: _isPageLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: VideoPlayer(_controller),
                  ),
                  Positioned(
                    top: height * 0.1,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/logos/logo.png',
                      height: height * 0.25,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          // gradient: LinearGradient(
                          //   begin: Alignment.topCenter,
                          //   end: Alignment.bottomCenter,
                          //   colors: [
                          //     Colors.transparent,
                          //     Colors.white54,
                          //     Colors.white,
                          //     Colors.white,
                          //   ],
                          // ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        height: 450,
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _pageController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Welcome Back!',
                                    style:
                                        WTextTheme.dartTextTheme.headlineMedium,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Form(
                                    key: _SignInKey,
                                    child: TextFormField(
                                      maxLength: 10,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.phone,
                                      cursorColor: Colors.grey,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your number';
                                        } else if (value.length < 10 ||
                                            value.length > 10) {
                                          return 'Please enter valid number';
                                        }
                                        return null;
                                      },
                                      controller: _phoneNoSignInController,
                                      decoration: const InputDecoration(
                                        errorStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: 'Phone Number',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: _isSignInButtonLoading
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : ElevatedButton(
                                            onPressed: () async {
                                              if (!_SignInKey.currentState!
                                                  .validate()) {
                                                return;
                                              }
                                              _fnNavigateToOtp();
                                              // fnLogin(
                                              //   "priyakb2002@gmail.com",
                                              //   "priyakb",
                                              // );
                                            },
                                            child: const Text(
                                              'LOGIN',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Don\'t have an account ?',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _pageController.animateToPage(
                                            1,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                        },
                                        child: const Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    endIndent: 40,
                                    indent: 40,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icons/apple_black.png",
                                          fit: BoxFit.fitHeight,
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Image.asset(
                                          "assets/icons/google_black.png",
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10)
                                ],
                              ),
                            ),

                            //Sign Up Page

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Form(
                                key: _signUpKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Sign Up',
                                      style: WTextTheme
                                          .dartTextTheme.headlineMedium,
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.grey,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your name';
                                        }
                                        return null;
                                      },
                                      controller: _nameSignUpController,
                                      decoration: const InputDecoration(
                                        errorStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: 'Name',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.grey,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter a valid email';
                                        } else if (!value.contains('@') &&
                                            value.contains('.') &&
                                            value.length < 5) {
                                          return 'Please enter valid email';
                                        }
                                        return null;
                                      },
                                      controller: _emailSignUpController,
                                      decoration: const InputDecoration(
                                        errorStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.mail,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.phone,
                                      maxLength: 10,
                                      cursorColor: Colors.grey,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your number';
                                        } else if (value.length != 10) {
                                          return 'Please enter valid number';
                                        }
                                        return null;
                                      },
                                      controller: _phoneNoSignUpController,
                                      decoration: const InputDecoration(
                                        errorStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: 'Phone no.',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: _isSignUpButtonLoading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                              ),
                                              onPressed: () async {
                                                if (!_signUpKey.currentState!
                                                    .validate()) {
                                                  return;
                                                }
                                                Navigator.pushReplacement(
                                                    context,
                                                    CupertinoPageRoute(
                                                        builder: (context) =>
                                                            ScratchCardScreen()));

                                                // await Future.delayed(
                                                //   const Duration(seconds: 2),
                                                //   () {
                                                //     _fnNavigateToHomePage();
                                                //   },
                                                // );
                                                // fnLogin(
                                                //   "aravind@gmail.com",
                                                //   "aravind",
                                                // );
                                              },
                                              child: const Text(
                                                'REGISTER',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Already have an account ?',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _pageController.animateToPage(
                                              0,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                          child: const Text(
                                            'Sign In',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
      ),
    );
  }

  // fnLogin(String email, String password) async {
  //   try {
  //     setState(() {
  //       _isSignInButtonLoading = true;
  //     });
  //     UserCredential userCredential =
  //         await services.fnLoginWithEmailAndPassword(
  //       email,
  //       password,
  //     );
  //     if (userCredential.user == null) {
  //       throw ("User not found");
  //     }
  //     DocumentSnapshot<Object?> customer =
  //         await services.fnFetchCustomerFromUserCollection(
  //       userCredential.user!,
  //     );
  //     if (customer.exists) {
  //       _fnNavigateToHomePage();
  //     } else {
  //       throw ("Customer not found");
  //     }
  //     setState(() {
  //       _isSignInButtonLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _isSignInButtonLoading = false;
  //     });
  //     if (!mounted) return;
  //     showDialog(
  //       barrierColor: Colors.black.withOpacity(0.8),
  //       context: context,
  //       builder: (context) => CustomErrorDialog(
  //         content: e.toString(),
  //       ),
  //     );
  //     if (kDebugMode) {
  //       print("fnLogin Exception on loginPage: $e");
  //     }
  //   }
  // }
}

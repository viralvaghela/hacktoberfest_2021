import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.blue.shade600));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline6: GoogleFonts.poppins(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        home: TokeMonSplash(),
      ),
    );
  }
}

class TokeMonSplash extends StatefulWidget {
  @override
  _TokeMonSplashState createState() => _TokeMonSplashState();
}

class _TokeMonSplashState extends State<TokeMonSplash> {
  final _betaCodeFocusNode = FocusNode();
  final _emailTextController = TextEditingController();
  final _betaCodeTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _betaCodeFocusNode.dispose();
    _emailTextController.dispose();
    _betaCodeTextController.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    print('Entered here');
    bool _isValidEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return _isValidEmail;
  }

  void _showCustomDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.green.shade300.withOpacity(0.37),
      builder: (BuildContext ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Image.asset(
          'assets/images/error.png',
          fit: BoxFit.contain,
        ),
        content: Text(
          'Sorry! It seems like you entered an incorrect code. Please try again',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.red.shade900,
                fontWeight: FontWeight.w900,
                wordSpacing: 1.0,
              ),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.check),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(5.0),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red.shade800),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shadowColor:
                  MaterialStateProperty.all<Color>(Colors.red.shade800),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            label: Text(
              'Try Again',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            height: _mediaQuery.height,
            width: _mediaQuery.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Splash Screen.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0.h,
                  right: 40.w,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 110.h,
                    width: 135.w,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/ninjadog.png',
                    height: 220.h,
                    width: 200.w,
                  ),
                ),
                Positioned(
                  top: _mediaQuery.height * 0.6,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 35.h,
                            ),
                            Text(
                              'Please enter Beta Code to continue',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'E-mail',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      fontSize: 14.sp,
                                      color: Colors.green.shade900,
                                      fontWeight: FontWeight.w800,
                                    ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.green.shade900,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30.r,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                errorStyle: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.0,
                                    ),
                              ),
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_betaCodeFocusNode);
                              },
                              validator: (String value) => value.isEmpty
                                  ? 'Please enter e-mail'
                                  : !_isEmailValid(value)
                                      ? 'Please enter valid e-mail'
                                      : null,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            TextFormField(
                              controller: _betaCodeTextController,
                              focusNode: _betaCodeFocusNode,
                              validator: (String value) => value.isEmpty
                                  ? 'Please enter beta code'
                                  : null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Beta Code',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      fontSize: 14.sp,
                                      color: Colors.green.shade900,
                                      fontWeight: FontWeight.w800,
                                    ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.green.shade900,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30.r,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                errorStyle: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.0,
                                    ),
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              width: _mediaQuery.width,
                              height: 50.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _showCustomDialog();
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10.r,
                                      ),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color(
                                      0xFFAFEC800,
                                    ),
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.green.shade900,
                                  ),
                                  textStyle:
                                      MaterialStateProperty.all<TextStyle>(
                                    Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                          // fontSize: 18.sp,
                                          // color: Color(0xFFA54925F),
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ),
                                child: Text(
                                  'Activate'.toUpperCase(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

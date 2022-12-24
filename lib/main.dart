// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.blueAccent),
    ),
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController? pageViewController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
          elevation: 16,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Theme.of(context).iconTheme.color,
            size: 14,
          ),
        ),
        title: Text(
          "My Home",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 3,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: Icon(
              Icons.notifications_active,
              color: Theme.of(context).iconTheme.color,
              size: 24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 150,
                          child: Stack(
                            children: [
                              PageView(
                                controller: pageViewController ??=
                                    PageController(initialPage: 0),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      'https://res.cloudinary.com/sardar/image/upload/v1601823497/HD/gautier-salles-Af89p9BNGuk-unsplash_n9o2ed.jpg',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Image.network(
                                    'https://res.cloudinary.com/sardar/image/upload/v1601824109/HD/boris-baldinger-eUFfY6cwjSU-unsplash_stuur9.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  Image.network(
                                    'https://res.cloudinary.com/sardar/image/upload/v1601823987/HD/ahzam-ibrahim-7P1oKtfl0U0-unsplash_qtlxvo.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: pageViewController ??=
                                        PageController(initialPage: 0),
                                    count: 3,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      pageViewController!.animateToPage(i,
                                          duration: Duration(microseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    effect: smooth_page_indicator.SlideEffect(
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 8,
                                      dotHeight: 8,
                                      dotColor: Color(0xFF9E9E9E),
                                      activeDotColor: Color(0xFF3F51B5),
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dcore/constants/colors.dart';
import 'package:dcore/constants/input_type.dart';
import 'package:dcore/utils/d-button/button.dart';
import 'package:dcore/utils/d-checkbox/checkbox.dart';
import 'package:dcore/utils/d-dialog/active_dialog.dart';
import 'package:dcore/utils/d-drawer/d-bottom_nav_bar/bottom_navigation_bar_item.dart';
import 'package:dcore/utils/d-text/d_text.dart';
import 'package:flutter/material.dart';
import 'package:dcore/constants/display.dart';
import 'package:dcore/utils/d-root_data/root_data.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utils/d-dialog/unfinished_features_dialog.dart';
import 'utils/d-dialog/yes_no_dialog.dart';
import 'utils/d-drawer/d-bottom_nav_bar/bottom_navigation_bar.dart';
import 'utils/d-drawer/d-drawer/drawer.dart';
import 'utils/d-license/license.dart';
import 'utils/d-textfield/textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'NeoSans').copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      // home: const MyHomePage(
      //   title: 'Flutter Demo Home Page',
      //   treeWidget: CenterWidget(),
      // ),
      home: const TestComponent(),
    );
  }
}

class TestComponent extends StatefulWidget {
  const TestComponent({super.key});

  @override
  State<TestComponent> createState() => _TestComponentState();
}

class _TestComponentState extends State<TestComponent> {
  bool? isCheckBoxChecked = false;
  late Widget? screenView;
  late DrawerIndex drawerIndex;
  late AnimationController sliderAnimationController;
  static const String home = 'Home page';
  static const String message = 'Message';
  static const String profile = 'Profile';
  static const String notification = 'Notification';

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;

    /// first  Item in drawer
    screenView = Column(
      children: [
        DCheckBox(
          title: 'Test check box',
          currentValue: isCheckBoxChecked,
          onPressed: (value) {
            setState(() {
              isCheckBoxChecked = value!;
            });
          },
        ),
        DButton.roundButton(
          text: 'Show dialog',
          onPressed: () {
            // showDDiaLog(context, body: [], title: 'Test dialog');
            // showDNotificationDialog(
            //   context,
            //   title: 'test 1',
            //   message: 'Nomess',
            //   onPressed: () {
            //     unfinishedFeaturesDialog(context);
            //   },
            // );
            showDYesNoDialog(
              context,
              title: 'Test Yes no',
              message: 'Hihi this is just test',
              yesPressed: () {
                displayDeleteDialog(context);
              },
            );
          },
          styled: true,
          radius: 30,
          buttonColorType: DButtonType.success,
          color: DColorType.themeColor,
        ),
        DButton.textButton(text: 'hihi', mainAlignment: MainAxisAlignment.start, onPressed: () {}),
      ],
    );
    super.initState();
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const Page(
            content: home,
          );
        });
      } else if (drawerIndex == DrawerIndex.Message) {
        setState(() {
          screenView = const Page(
            content: message,
          );
        });
      } else if (drawerIndex == DrawerIndex.Profile) {
        setState(() {
          screenView = const Page(
            content: profile,
          );
        });
      } else if (drawerIndex == DrawerIndex.Notification) {
        setState(() {
          screenView = const Page(
            content: notification,
          );
        });
      } else {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    printStatus('1. hàm build được gọi do hàm setState được gọi\n\n'); //* đặt log thứ 1
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Component'),
      ),
      bottomNavigationBar: DBottomNavigationBar(tabs: [
        DBottomNavigationItem(
          icon: FontAwesomeIcons.house,
          text: 'Home',
          onPressed: () {
            showDunfinishedFeaturesDialog(context);
          },
        ),
        DBottomNavigationItem(
          icon: FontAwesomeIcons.solidHeart,
          text: 'Likes',
          onPressed: () {
            showLicensePage(
              context: context,
              applicationName: 'DCore',
              applicationIcon: Image.asset(
                "lib/assets/images/main-icon.png",
                height: 50,
                width: 50,
              ),
              applicationVersion: '1.0.0',
              applicationLegalese: '© 2021 DCore',
              useRootNavigator: true,
            );
          },
        ),
        DBottomNavigationItem(
          icon: FontAwesomeIcons.magnifyingGlass,
          text: 'Search',
          onPressed: () {
            showDLicense(context);
          },
        ),
        const DBottomNavigationItem(
          icon: FontAwesomeIcons.solidUser,
          text: 'Profile',
        ),
      ]),
      body: DrawerUserController(
        screenIndex: drawerIndex,
        drawerWidth: MediaQuery.of(context).size.width * 0.75,
        animationController: (AnimationController animationController) {
          sliderAnimationController = animationController;
        },
        onDrawerCall: (DrawerIndex drawerIndexdata) {
          changeIndex(drawerIndexdata);
        },
        screenView: screenView,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String content;

  const Page({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        content,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    this.treeWidget,
  }) : super(key: key);

  final String title;
  final Widget? treeWidget;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 99944012102;
  bool _isCheckBoxChecked = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _switchValue(bool? value) {
    setState(() {
      _isCheckBoxChecked = !value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    printStatus('1. hàm build được gọi do hàm setState được gọi\n\n'); //* đặt log thứ 1
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RootData(
        myData: _counter,
        isCheckBoxChecked: _isCheckBoxChecked,
        switchValue: _switchValue,
        child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(padding: const EdgeInsets.all(10), child: widget.treeWidget!)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CenterWidget extends StatelessWidget {
  const CenterWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    printStatus('2. log build MyCenterWidget\n\n'); // đặt log thứ 2

    return const Center(
      child: ColumnWidget(),
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    printStatus('3. log build MyText với counter = ${RootData.of(context)?.myData ?? 0}\n\n'); // đặt log thứ 3
    TextEditingController controller = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          currencyFormat(RootData.of(context)?.myData ?? 0),
          style: Theme.of(context).textTheme.headline4,
        ),
        const DText.titleAndText(
          text: 'You have pushed the button this many times:',
          title: 'Title',
          color: DColorType.themeColor,
          // width: MediaQuery.of(context).size.width - 20,
          underline: true,
        ),
        DTextField.underLine(
          label: 'Hihi',
          controller: controller,
          type: DTextFieldType.date,
        ),
        DButton.iconButton(
          tooltip: 'Click me',
          icon: Icons.add,
          onPressed: () {
            printStatus('click me');
          },
        ),
        DButton.textButton(
          text: 'Forgot password?',
          onPressed: () {},
          textType: DTextType.defaultText,
          // mainAlignment: MainAxisAlignment.end,
          crossAlignment: CrossAxisAlignment.end,
        ),
        DCheckBox(
          title: 'Check box test',
          currentValue: RootData.of(context)!.isCheckBoxChecked,
          onPressed: RootData.of(context)!.switchValue,
        ),
        DButton.roundButton(text: 'Test button', onPressed: () {}, styled: true, radius: 100),
      ],
    );
  }
}

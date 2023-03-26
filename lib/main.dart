import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_flutter_riverpod/change_notifier_page.dart';
import 'package:state_flutter_riverpod/provider_page.dart';
import 'package:state_flutter_riverpod/provider_page2.dart';
import 'package:state_flutter_riverpod/state_notifier_page.dart';
import 'package:state_flutter_riverpod/state_provider_page.dart';
import 'package:state_flutter_riverpod/widgets/button_widget.dart';

import 'future_stream_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(child: Center(child: WrapperPage())),
    );
  }
}

class WrapperPage extends StatefulWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPage(),
    );
  }

  Widget buildPage() {
    switch (index) {
      case 0:
        return buildProviderPage(context);
      default:
        return Container();
    }
  }

  Widget buildProviderPage(BuildContext context) => Column(
        children: [
          ButtonWidget(
            text: 'Provider',
            onClicked: () => navigateTo(
              context,
              const ProviderPage(),
            ),
          ),
          ButtonWidget(
            text: 'ProviderPage2',
            onClicked: () => navigateTo(context, const ProviderPage2()),
          ),
          ButtonWidget(
            text: 'State Nobitifer Page',
            onClicked: () => navigateTo(context, const StateNotifierPage()),
          ),
          ButtonWidget(
            text: 'State Provider Page',
            onClicked: () => navigateTo(context, const StateProviderPage()),
          ),
          ButtonWidget(
            text: 'Change Notifier Page',
            onClicked: () => navigateTo(context, const ChangeNotifierPage()),
          ),
          ButtonWidget(
            text: 'Future Stream Provider Page',
            onClicked: () => navigateTo(context, const FutureStreamPage()),
          ),
        ],
      );

  void navigateTo(BuildContext context, Widget page) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => page),
      );
}

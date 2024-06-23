import 'package:flutter/material.dart';
import 'package:jamal_ke_dohe/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'components/all_dohas.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text('जमाल के दोहे'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                  icon: Icon(Provider.of<ThemeProvider>(
                    context,
                  ).isDarkMode
                      ? Icons.dark_mode
                      : Icons.light_mode)),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Container(
              // color: Colors.white,

              child: Row(
                children: [
                  TabBar(
                    // dividerColor: Colors.white,
                    dividerHeight: 0,
                    isScrollable: true,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    tabs: [
                      Tab(
                        text: 'सभी',
                      ),
                      Tab(text: 'पसंदीदा'),
                    ],
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 3.0, color: Colors.orange),
                      insets: EdgeInsets.zero,
                    ),
                    // labelColor: Colors.black,
                    tabAlignment: TabAlignment.start,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.orange,
                    labelPadding: EdgeInsets.only(left: 45),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AllDoha(),
            Center(child: Text('Content for पसंदीदा')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_application/constants/app_theme.dart';

class HomeDrawer extends StatefulWidget {
  final VoidCallback onGoToHomeClicked;

  const HomeDrawer({super.key, required this.onGoToHomeClicked});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String selectedTheme = 'Dark';
  String selectedLanguage = 'English';

  List<String> themes = ['Dark', 'Light', 'System'];
  List<String> languages = ['English', 'Arabic'];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
      color: AppTheme.black,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.sizeOf(context).height * 0.2,
            decoration: BoxDecoration(color: AppTheme.white),
            child: Text(
              'News App',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppTheme.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              widget.onGoToHomeClicked();
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/home.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Go To Home',
                    style: textTheme.titleMedium!.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: AppTheme.white, thickness: 1),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/theme.svg'),
                SizedBox(width: 10),
                Text(
                  'Theme',
                  style: textTheme.titleMedium!.copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.white),
              ),
              child: DropdownButton<String>(
                value: selectedTheme,
                isExpanded: true,
                underline: SizedBox(),
                iconEnabledColor: AppTheme.white,
                dropdownColor: Colors.grey[900],
                style: TextStyle(color: AppTheme.white, fontSize: 16),
                items: themes
                    .map(
                      (theme) =>
                      DropdownMenuItem(value: theme, child: Text(theme)),
                )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTheme = value!;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: AppTheme.white, thickness: 1),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/language.svg'),
                SizedBox(width: 10,),
                Text('Language',
                  style: textTheme.titleMedium!.copyWith(fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.white, width: 1)
              ),
              child: DropdownButton<String>(
                  value: selectedLanguage,
                  isExpanded: true,
                  dropdownColor: Colors.grey[900],
                  style: TextStyle(color: AppTheme.white, fontSize: 16),
                  iconEnabledColor: AppTheme.white,
                  underline: SizedBox(),
                  items: languages.map((lang) =>
                      DropdownMenuItem(
                          value: lang,
                          child: Text(lang)
                      )
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}

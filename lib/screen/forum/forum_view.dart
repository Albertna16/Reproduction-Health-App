import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/forum/widget/categories_widget.dart';
import 'package:reprohealth_app/screen/forum/widget/lihat_forum_widget.dart';
import 'package:reprohealth_app/screen/forum/widget/pertanyaan_saya_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ForumView extends StatelessWidget {
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Forum',
            style: semiBold16Green700,
          ),
          elevation: 0,
          backgroundColor: grey10,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cari dan Tanyakan Keluhanmu Disini",
                style: medium14Grey900,
              ),
              const SizedBox(height: 24),
              TextFormComponent(
                controller: searchController,
                hintText: 'Cari Forum Diskusi...',
                hinstStyle: regular14Grey400,
                prefixIcon: Icons.search,
              ),
              const SizedBox(height: 24),
              const CategoriesWidget(),
              const SizedBox(height: 24),
              TabBar(
                labelStyle: medium14Grey400,
                labelColor: grey900,
                unselectedLabelColor: grey400,
                tabs: [
                  Tab(
                    child: Text(
                      'Lihat Forum',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Pertanyaan Saya',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    LihatForumWidget(),
                    PertanyaanSayaWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "1",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(
                  width: 1.5,
                  color: green500,
                ),
              ),
              onPressed: () {
                // First FAB action
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.smart_toy,
                color: green500,
              ),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              heroTag: "2",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () {
                // Second FAB action
                Navigator.pushNamed(
                  context,
                  RoutesNavigation.createForumView,
                );
              },
              backgroundColor: green500,
              child: Icon(
                Icons.edit,
                color: grey10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
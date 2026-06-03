import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/datasource/remote_data/api_services.dart';
import 'package:news_app/featuers/home/componants/categorys_list.dart';
import 'package:news_app/featuers/home/componants/top_headline_list.dart';
import 'package:news_app/featuers/home/componants/view_all_componants.dart';
import 'package:news_app/featuers/home/providers/home_provider.dart';
import 'package:news_app/featuers/home/componants/trinding_news.dart';
import 'package:news_app/core/repos/news_repository.dart';
import 'package:news_app/featuers/home/screens/categorys_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(NewsRepository(ApiService())),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            ////  STACK SECTION
            TrindingNews(),

            SliverToBoxAdapter(child: Gap(15)),

            SliverToBoxAdapter(
              child: ViewAllComponants(
                title: "Categories",
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategorysScreen())),
                texColor: Color(0xff141414),
              ),
            ),

            SliverToBoxAdapter(child: Gap(15)),

            CategorysList(),

            SliverToBoxAdapter(child: Gap(10)),

            /// TOP HEAD LINE
            TopHeadlineList(),
          ],
        ),
      ),
    );
  }
}

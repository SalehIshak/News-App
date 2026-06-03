import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/featuers/home/providers/home_provider.dart';
import 'package:provider/provider.dart';

class CategorysList extends StatelessWidget {
  const CategorysList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 30,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => Gap(20),
            itemCount: categorysList.length,
            itemBuilder: (context, index) {
              return Consumer<HomeProvider>(
                builder: (context, HomeProvider provider, Widget? widget) {
                  final category = provider.sellectedCategory == categorysList[index];
                  return IntrinsicWidth(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            provider.updateSellectedCategorys(categorysList[index]);
                          },
                          child: Text(
                            categorysList[index][0].toUpperCase() + categorysList[index].substring(1),
                            style: TextStyle(
                              color: category ? Colors.red : Color(0xff363636),
                              fontSize: 16,
                              fontFamily: "TimesNewRoman",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        category ? Container(height: 1, color: Colors.red) : SizedBox.shrink(),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

List<String> categorysList = ["Business", "Entertainment", "Health", "Science", "Sports", "Technology"];

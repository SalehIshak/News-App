import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/remote_data/api_services.dart';
import 'package:news_app/core/repos/news_repository.dart';
import 'package:news_app/featuers/home/providers/search_provider.dart';
import 'package:news_app/featuers/home/screens/news_details_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ChangeNotifierProvider<SearchProvider>(
        create: (context) => SearchProvider(NewsRepository(ApiService())),
        child: Scaffold(
          appBar: AppBar(title: Text("Search "), centerTitle: true),

          body: Consumer<SearchProvider>(
            builder: (context, provider, widget) {
              return Column(
                children: [
                  ///TEXT FIELED
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: provider.textEditingController,
                      onChanged: (value) {
                        provider.getEvryThing();
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "search",
                        suffixIcon: Icon(Icons.search, size: 25),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFFA0A0A0))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFFA0A0A0))),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Divider(color: Color(0xff6D6D6D)),
                        ),
                        itemCount: provider.newsEvryThingList.length,
                        itemBuilder: (context, index) {
                          final dataModel = provider.newsEvryThingList[index];
                          return SizedBox(
                            height: 30,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NewsDetailsScreen(dataModel: dataModel)),
                                );
                              },
                              child: ListTile(
                                leading: Icon(Icons.search, color: Color(0xff6D6D6D), size: 30),
                                title: Text(
                                  dataModel.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff6D6D6D),
                                    fontFamily: "TimesNewRoman",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

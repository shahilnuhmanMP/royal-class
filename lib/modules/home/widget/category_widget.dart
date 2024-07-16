import 'package:flutter/material.dart';
import 'package:royal_class_app/app_theme.dart';
import 'package:royal_class_app/modules/home/model/category.dart';
import 'package:royal_class_app/support/constants.dart';

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({
    super.key,
    required this.categoryIndex,
    // required this.categoryList,
  });

  ValueNotifier<int> categoryIndex;
  // final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ValueListenableBuilder(
          valueListenable: categoryIndex,
          builder: (context, val, child) {
            return ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(categoryList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    print(index);
                    print(categoryIndex.value);
                    categoryIndex.value = index;
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: colors(context).shadowColor!,
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 10), // Shadow position, bottom
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: categoryIndex.value == index
                            ? [
                                Color(0xFF34C8E8),
                                Color(0xFF4E4AF2),
                              ]
                            : [
                                Color(0xFF353F54), // #353F54
                                Color(0xFF222834), // #222834
                              ],
                        stops: [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: index == 0
                          ? Text(
                              "All",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: colors(context).text),
                            )
                          : Image.asset(
                              categoryList[index].icon ?? "",
                              fit: BoxFit.fill,
                              height: 24,
                            ),
                    ),
                  ),
                );
              }),
            );
          }),
    );
  }
}

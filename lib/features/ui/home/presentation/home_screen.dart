import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handihub/common/app_colors.dart';
import 'package:handihub/common/assets.dart';
import 'package:handihub/features/widgets/title_widget.dart';

import '../../../../common/models/item_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late PageController pageController;
  List<ItemModel> items = [
    ItemModel(
        image: Assets.imagesLagan2,
        name: 'Laganus pro',
        isLiked: false,
        price: 168.0),
    ItemModel(
        image: Assets.imagesLagan3,
        name: 'Laganus pro',
        isLiked: false,
        price: 168.0),
    ItemModel(
        image: Assets.imagesLagan3,
        name: 'Laganus pro',
        isLiked: false,
        price: 168.0),
    ItemModel(
        image: Assets.imagesLagan2,
        name: 'Laganus pro',
        isLiked: false,
        price: 168.0),
  ];
  ValueNotifier<int> bottomAppBarIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFCF8F4),
      body: Stack(children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const TitleWidget(),
                searchAndFavorite(),
                laganazavr(size),
                TabBar(
                  tabAlignment: TabAlignment.start,
                  controller: tabController,
                  isScrollable: true,
                  onTap: (value) {},
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.primaryColor,
                  ),
                  tabs: ["Hunarmandchilik", "Kulolchilik", "To’quvchilik"]
                      .map(
                        (e) => Tab(
                          text: e,
                          // child: Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(30),
                          //     color: Colors.grey.shade300,
                          //   ),
                          //   child: Text(e),
                          // ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: List.generate(
                      3,
                      (index) => GridView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColors.itemColor.withOpacity(.67),
                                  ),
                                  child: Image.asset(items[index].image)),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items[index].name,
                                          style: TextStyle(
                                              color: AppColors.itemTextColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "\$${items[index].price}",
                                          style: TextStyle(
                                            color: AppColors.itemTextColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CircleAvatar(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.add_shopping_cart)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 300,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomAppBar(),
      ]),
    );
  }

  Widget bottomAppBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        margin: EdgeInsets.only(left: 38, right: 38, bottom: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: bottomAppBarIndex,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 15,
                ),
                bottomItem(0, Assets.iconsHome),
                bottomItem(1, Assets.iconsShop),
                bottomItem(2, Assets.iconsSettings),
                bottomItem(3, Assets.iconsUser),
                SizedBox(
                  width: 15,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget bottomItem(int index, String icon) {
    return IconButton(
      onPressed: () {
        bottomAppBarIndex.value = index;
      },
      icon: Padding(
        padding: const EdgeInsets.all(12),
        child: Image.asset(icon,
            color: bottomAppBarIndex.value == index
                ? AppColors.primaryColor
                : Colors.grey.shade400),
      ),
    );
  }

  Widget laganazavr(Size size) {
    return Container(
      height: 180,
      width: size.width - 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 100,
              width: size.width - 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.primaryColor),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Transform.rotate(
                  angle: 0.2,
                  child: Image.asset(
                    Assets.imagesLagan1,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Laganazavr",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .4,
                      child: const Text(
                        "Lorem Ipsum Dolor, Sit Amet Consectetur ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Row searchAndFavorite() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.grey.shade400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50),
            child: Badge(
              label: const Text("1"),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.favorite_rounded,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:ecommerce_seller/presentation/main_section/home_screen/top_products/filter_by_clicking_top_product/filter_screen.dart';
import 'package:ecommerce_seller/presentation/main_section/home_screen/top_products/product_screen/product_details_screen.dart';
import 'package:ecommerce_seller/presentation/main_section/notification/notification_screen.dart';
import 'package:ecommerce_seller/utilz/colors.dart';
import 'package:ecommerce_seller/utilz/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../on_boarding_section/login_screen/controller/login_controller.dart';
import '../../wish_list_screen/controller/wishlist_controller.dart';
import 'controller/top_products_controller.dart';

class TopProductScreen extends StatefulWidget {
  const TopProductScreen({super.key});

  @override
  State<TopProductScreen> createState() => _TopProductScreenState();
}

class _TopProductScreenState extends State<TopProductScreen> {
  String page = '1';
  String limit = '10';
  final topProductsController = Get.put(TopProductsController());
  final wishlistController = Get.put(WishlistController());
  final authController = Get.put(LoginController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topProductsController.getTopProducts(page, limit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16.px,
            )),
        title: Text(
          'Top Products',
          style:
              GoogleFonts.poppins(fontSize: 18.px, fontWeight: FontWeight.w500),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: Image.asset('assets/images/appbar1.png')),
          sizedBoxWidth20,
          Image.asset('assets/images/appbar2.png'),
          sizedBoxWidth20,
          Image.asset('assets/images/appbar3.png'),
          sizedBoxWidth20,
        ],
      ),
      body: Obx(() {
        return (topProductsController.isLoading.value == true ||
                wishlistController.isLoading.value == true)
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => const FilterScreen());
                              },
                              child:
                                  Image.asset('assets/images/topproduct.png')),
                          sizedBoxWidth10,
                          Text(
                            'Filters',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 15.px),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.sp),
                                color: Color(0xffE2E5D7)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sort By',
                                  style: GoogleFonts.poppins(
                                      fontSize: 13.px,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Icon(Icons.arrow_drop_down_sharp)
                              ],
                            ),
                          )
                        ],
                      ),
                      sizedBoxHeight10,
                      Container(
                          // height: 50.h,
                          width: 100.w,
                          // height: 50.h,
                          //   color: green,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // Number of columns
                                    crossAxisSpacing:
                                        5, // Spacing between columns
                                    mainAxisSpacing:
                                        9.0, // Spacing between rows
                                    childAspectRatio: 0.75),
                            itemCount: topProductsController
                                .topProductsModel!.data!.docs!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => ProductDetailsScreen(
                                        productId: topProductsController
                                            .topProductsModel!
                                            .data!
                                            .docs![index]
                                            .id!,
                                      ));
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AnimalDetails(),));
                                },
                                child: Stack(children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 230, 227, 227),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            // height: 11.h,
                                            width: 100.w,
                                            // color: green,
                                            child: topProductsController
                                                    .topProductsModel!
                                                    .data!
                                                    .docs![index]
                                                    .sampleImage!
                                                    .isNotEmpty
                                                ? Image.network(
                                                    topProductsController
                                                        .topProductsModel!
                                                        .data!
                                                        .docs![index]
                                                        .sampleImage!,
                                                    fit: BoxFit.cover,
                                                    width: 100.w,
                                                  )
                                                : Image.asset(
                                                    'assets/images/topproduct2.png',
                                                    fit: BoxFit.cover,
                                                    width: 100.w,
                                                  ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 5,
                                              right: 5,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  topProductsController
                                                      .topProductsModel!
                                                      .data!
                                                      .docs![index]
                                                      .name!
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: black,
                                                      fontSize: 13.px,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )

                                                // Icon(Icons.share,size: 12.sp,color: green,)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Neque porro quisquam est qui dolorem ipsum quia',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 10.px,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '₹${topProductsController.topProductsModel!.data!.docs![index].minPrice!}',
                                                  style: TextStyle(
                                                      color: black,
                                                      fontSize: 13.px,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Spacer(),
                                                Text(
                                                  'MOQ: ${topProductsController.topProductsModel!.data!.docs![index].noOfPairs!} Pcs',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13.px),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${topProductsController.topProductsModel!.data!.docs![index].maxPrice!}',
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: Colors.black26,
                                                      fontSize: 13.px,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                sizedBoxWidth10,
                                                Text(
                                                  '40%Off',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13.px,
                                                      color: Colors.green),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              VxRating(
                                                count: 5,
                                                selectionColor: buttonColor,
                                                onRatingUpdate: (value) {},
                                              ),
                                              Text(
                                                '56890',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontSize: 12.px),
                                              )
                                            ],
                                          ),
                                          // sizedBoxHeight20,
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Spacer(),
                                        // (),
                                        InkWell(
                                          onTap: () async {
                                            await wishlistController
                                                .addWishList(
                                                    authController
                                                        .authModel!.data!.id!,
                                                    topProductsController
                                                        .topProductsModel!
                                                        .data!
                                                        .docs![index]
                                                        .id!);
                                            await topProductsController
                                                .getTopProducts(page, limit);
                                          },
                                          child: const Icon(
                                            Icons.favorite,
                                            color: whiteColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              );
                            },
                          ))
                    ],
                  ),
                ),
              );
      }),
    );
  }
}

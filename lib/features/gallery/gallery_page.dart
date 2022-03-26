import 'package:advertisers/features/gallery/gallery_card.dart';
import 'package:advertisers/features/help_and_support/title_support_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  static const _pageSize = 20;

 // final PagingController<int, CharacterSummary> _pagingController =
 // PagingController(firstPageKey: 0);

  @override
  void initState() {
    // _pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    super.initState();
  }

  // Future<void> _fetchPage(int pageKey) async {
  //   try {
  //     final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
  //     final isLastPage = newItems.length < _pageSize;
  //     if (isLastPage) {
  //       _pagingController.appendLastPage(newItems);
  //     } else {
  //       final nextPageKey = pageKey + newItems.length;
  //       _pagingController.appendPage(newItems, nextPageKey);
  //     }
  //   } catch (error) {
  //     _pagingController.error = error;
  //   }
  // }

  @override
  Widget build(BuildContext context) =>SafeArea(
    child: Scaffold(

      body: Column(
        children: [
          AppBarWidget(isFilter: true,isSideMenu: false,isSearchBar: true),
          //const TitleSupportWidget(title: "المفضلة", image: 'images/savetodrive.svg'),


          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  height: 30.0,
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xff4184CE)
                  ),
                  child: Text('المفضلة',style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                ),
                SvgPicture.asset('images/savetodrive.svg',height: 52.43.h,
                  width: 47.43.w,fit: BoxFit.fitHeight,),
              ],
            ),
          ),
          // const Divider(
          //   color: AppColors.dividerBottom,
          //   thickness: 4.0,
          // ),

          SizedBox(height:18.h),
          Expanded(
            child: GridView.count(primary: false,
                padding: const EdgeInsets.only(bottom:10,left: 15,right: 15),
                crossAxisSpacing: 10,
                //mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(10, (index) => GalleryCard(url: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",))),
          ),
        ],
      )));


      // Don't worry about displaying progress or error indicators on screen; the
  // package takes care of that. If you want to customize them, use the
  // [PagedChildBuilderDelegate] properties.
  // PagedGridView<int, CharacterSummary>(
  //   pagingController: _pagingController,
  //   builderDelegate: PagedChildBuilderDelegate<CharacterSummary>(
  //     itemBuilder: (context, item, index) => CharacterListItem(
  //       character: item,
  //     ),
  //   ),
  // );

  @override
  void dispose() {
   // _pagingController.dispose();
    super.dispose();
  }
}
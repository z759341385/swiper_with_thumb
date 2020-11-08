/*
 * @Author: zhc
 * @Date: 2020-11-08 01:13:43
 * @LastEditTime: 2020-11-08 16:22:55
 * @Description: 
 * @LastEditors: zhc
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ThumbSwiper extends StatefulWidget {
  ///图片Lst
  List<Map> imageList;
  double height = double.maxFinite;
  double width = double.maxFinite;

  ThumbSwiper({@required this.imageList, this.height, this.width});

  @override
  _ThumbSwiperState createState() => _ThumbSwiperState(imageList: imageList);
}

class _ThumbSwiperState extends State<ThumbSwiper> {
  List<Map> imageList;
  _ThumbSwiperState({this.imageList});
  SwiperController _swiperController = SwiperController();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Swiper(
              loop: false,
              onIndexChanged:(cur_idx){
                print(cur_idx);
                _swiperController.index =cur_idx;
                _listScroll(cur_idx);
                setState(() {});
              },
              itemCount: imageList.length,
              controller: _swiperController,
              itemBuilder: (BuildContext context, int index) {
                return _createSwiperItem(index);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, index) {
                return _buildThumbItem(index);
              },
              scrollDirection: Axis.horizontal,
              itemCount: imageList.length,
            ),
          ),
        ],
      ),
    );
  }

  _listScroll(int index){
    double _scroll = 150.0 * index;
    if(150 *(index +1) > MediaQuery.of(context).size.width){
      _scrollController.animateTo(_scroll, duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
    }
    print(MediaQuery.of(context).size.width);
    
  }

  _createSwiperItem(index) {
    return GestureDetector(
      onTap: () {
        print('click swiper index $index');

      },
      child: Container(
        color: Colors.grey[200],
        child: Image.network(
          imageList[index]['path'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildThumbItem(int index) {
    return GestureDetector(
      onTap: () {
        print('click thumb index $index');
        _swiperController.move(index,animation: false);
        setState((){});
      },
      child: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: 150,
            child: Image.network(
              imageList[index]['path'],
              // height: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            height: 200,
            width: 150,
            child: _swiperController.index == index?Container(): Container(color: Colors.black45),
          ),
        ],
      ),
    );
  }
}

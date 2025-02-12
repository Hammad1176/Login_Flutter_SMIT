// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  BuildContext contextM;
  SliderPage(this.contextM, {super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CarouselSlider(
        //   items: imgList,
        //   carouselController: CarouselSliderController(),
        //   options: CarouselOptions(
        //     height: MediaQuery.of(context).size.height * 0.40,

        //     // Customize the height of the carouse
        //     enlargeCenterPage: true,
        //     autoPlay: true,
        //     aspectRatio: 16 / 9,
        //     autoPlayCurve: Curves.fastOutSlowIn,
        //     enableInfiniteScroll: true,
        //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
        //     viewportFraction: 0.8, // Enable infinite scroll
        //     onPageChanged: (index, reason) {
        //       setState(() {
        //         _controller = index;
        //         print("slider indec $index and Reason $reason");
        //       });
        //       // Optional callback when the page changes
        //       // You can use it to update any additional UI components
        //     },
        //   ),
        // ),
        // // ignore: avoid_types_as_parameter_names
        CarouselSlider.builder(
          itemCount: imgList.length,
          // ignore: avoid_types_as_parameter_names
          itemBuilder: (BuildContext, index, int1) {
            return Container(
                margin: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.20,
                // width: MediaQuery.of(context).size.width * 0.40,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20),
                // ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    imgList[index],
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                ));
          },
          options: CarouselOptions(
              autoPlay: true,
              animateToClosest: true,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.slowMiddle),
        )
      ],
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/models.dart';
import 'specialist_widget.dart';

class SpecialistBannerWidget extends StatefulWidget {
  final List<BannerType> bannersData;

  const SpecialistBannerWidget({
    required this.bannersData
  });

  @override
    _SpecialistBannerWidgetState createState() => _SpecialistBannerWidgetState();
}

class _SpecialistBannerWidgetState extends State<SpecialistBannerWidget> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    startAutoPlay();
  }

  void startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        if (_currentPage < widget.bannersData.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bannersData.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onPanDown: (details) => stopAutoPlay(),
          onPanEnd: (details) => startAutoPlay(),
          child: SizedBox(
            height: 160,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.bannersData.length,
              onPageChanged: (index) => _currentPage = index,
              itemBuilder: (context, index) {
                var banner = widget.bannersData[index];
                return SpecialistWidget(
                  title: banner.title,
                  subtitle: banner.description,
                  imagePath: banner.image,
                  backgroundColor: Colors.green,
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: widget.bannersData.length,
            effect: WormEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.white.withOpacity(0.5),
              dotHeight: 8,
              dotWidth: 8,
              spacing: 16,
            ),
          ),
        ),
      ],
    );
  }
}

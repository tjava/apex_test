import 'package:equatable/equatable.dart';
import 'package:apex_test/core/constants/assets_constant.dart';

class PageContentEntity extends Equatable {
  final String image;
  final String title;
  final String description;
  const PageContentEntity({
    required this.image,
    required this.title,
    required this.description,
  });

  factory PageContentEntity.first() {
    return const PageContentEntity(
      image: onBoarding1,
      title: 'Finance app the safest and most trusted',
      description:
          'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
    );
  }

  factory PageContentEntity.second() {
    return const PageContentEntity(
      image: onBoarding2,
      title: 'The fastest transaction process only here',
      description:
          'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
    );
  }

  @override
  List<Object> get props => [image, title, description];
}

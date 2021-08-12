class BrandModel{
  final String image, title;
  final int id;

  BrandModel({
    required this.image,
    required this.title,
    required this.id,
  });
}

List<BrandModel> brand = [
  BrandModel(
      image: 'assets/images/detol.jpg',
      title: 'Detol',
      id: 1,
  ),
  BrandModel(
      image: 'assets/images/beurer.jpg',
      title: 'Beurer',
      id: 2,
  ),
  BrandModel(
      image: 'assets/images/lifebuoy.jpg',
      title: 'Lifebouy',
      id: 3,
  ),
  BrandModel(
      image: 'assets/images/easy.jpg',
      title: 'Easy',
      id: 4
  ),
  BrandModel(
      image: 'assets/images/maxtouch.jpg',
      title: 'Max Touch',
      id: 5,
  ),
  BrandModel(
      image: 'assets/images/maskon.jpg',
      title: 'Mask On',
      id: 6,
  ),
  BrandModel(
      image: 'assets/images/fix.jpg',
      title: 'Fix',
      id: 7,
  ),
  BrandModel(
      image: 'assets/images/higeen.jpg',
      title: 'HiGeen',
      id: 8,
  ),
  BrandModel(
      image: 'assets/images/drphi.jpg',
      title: 'Dr Phi',
      id: 9,
  ),
];
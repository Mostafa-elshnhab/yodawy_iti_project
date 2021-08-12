class BrandsPage{
  final String image, title;
  final int id;

  BrandsPage({
    required this.image,
    required this.title,
    required this.id,
  });
}

List<BrandsPage> brandPage = [
  BrandsPage(
    image: 'assets/images/detol.jpg',
    title: 'Detol',
    id: 1,
  ),
  BrandsPage(
    image: 'assets/images/beurer.jpg',
    title: 'Beurer',
    id: 2,
  ),
  BrandsPage(
    image: 'assets/images/lifebuoy.jpg',
    title: 'Lifebouy',
    id: 3,
  ),
  BrandsPage(
      image: 'assets/images/easy.jpg',
      title: 'Easy',
      id: 4
  ),
  BrandsPage(
    image: 'assets/images/maxtouch.jpg',
    title: 'Max Touch',
    id: 5,
  ),
  BrandsPage(
    image: 'assets/images/maskon.jpg',
    title: 'Mask On',
    id: 6,
  ),
  BrandsPage(
    image: 'assets/images/fix.jpg',
    title: 'Fix',
    id: 7,
  ),
  BrandsPage(
    image: 'assets/images/higeen.jpg',
    title: 'HiGeen',
    id: 8,
  ),
  BrandsPage(
    image: 'assets/images/drphi.jpg',
    title: 'Dr Phi',
    id: 9,
  ),
];
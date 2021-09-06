class TopPicksModel {
  final String imgpath, productName;
  final int id;

  TopPicksModel(
      {required this.id, required this.imgpath, required this.productName});
}

List<TopPicksModel> topPick = [
  TopPicksModel(
    productName: 'Summer Offers',
    imgpath: 'assets/images/tp1.jpg',
    id: 1,
  ),
  TopPicksModel(
    productName: 'Travel Essentilals',
    imgpath: 'assets/images/tp2.jpg',
    id: 2,
  ),
  TopPicksModel(
    productName: 'Molfix',
    imgpath: 'assets/images/tp3.jpg',
    id: 3,
  ),
  TopPicksModel(
    productName: 'Top Bundles',
    imgpath: 'assets/images/tp4.jpg',
    id: 4,
  ),
  TopPicksModel(
    productName: 'Larocie Posay',
    imgpath: 'assets/images/tp5.jpg',
    id: 5,
  ),
  TopPicksModel(
    productName: 'Vichy',
    imgpath: 'assets/images/tp6.jpg',
    id: 6,
  ),
  TopPicksModel(
    productName: 'Pampers',
    imgpath: 'assets/images/tp7.jpg',
    id: 7,
  ),
  TopPicksModel(
    productName: 'L\'Oreal',
    imgpath: 'assets/images/tp8.jpg',
    id: 8,
  ),
];

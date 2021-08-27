class CategoryItem {
  final String image, title;
  final int id;

  CategoryItem({required this.image, required this.title, required this.id});
}

List<CategoryItem> category = [
  CategoryItem(
    image: 'assets/images/masks.jpg',
    title: 'Masks',
    id: 1,
  ),
  CategoryItem(
    image: 'assets/images/kidsmasks.jpg',
    title: 'Kids Masks',
    id: 2,
  ),
  CategoryItem(
    image: 'assets/images/gloves.jpg',
    title: 'Gloves',
    id: 3,
  ),
  CategoryItem(
    image: 'assets/images/fever.jpg',
    title: 'Fever',
    id: 4,
  ),
  CategoryItem(
    image: 'assets/images/breathing.jpg',
    title: 'Breathing',
    id: 5,
  ),
//  CategoryItem(
//    image: 'assets/images/allantibacterials.jpg',
//    title: 'All Anti-bacterials',
//    id: 6,
//  )
  CategoryItem(
    image: 'assets/images/sanitizers.jpg',
    title: 'Sanitizers',
    id: 7,
  ),
  CategoryItem(
    image: 'assets/images/immunity.jpg',
    title: 'Immunity Boosters',
    id: 8,
  ),
];

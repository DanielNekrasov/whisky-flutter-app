import 'package:whisky_flutter_app/data/whisky.dart';

class LocalWhiskyProvider {
  static List<Whisky> whiskies = [
    Whisky(
      id: 1,
      name: 'Aberfeldy 12 YO',
      imagePath:
          'https://www.lcbo.com/content/dam/lcbo/products/255281.jpg/jcr:content/renditions/cq5dam.web.1280.1280.jpeg',
      shortDescription:
          'Ананас, ракитник, медовый солод, ячменный солод, мускатный орех, подсушенный на торфе солод',
      region: 'Хайленд, Шотландия',
      category: WhiskyCategory.single_malt,
      fragrance: Flavour.fruit,
      taste: Flavour.cereal,
      aftertaste: Flavour.woody,
      rating: 3,
      abv: 40.0,
    ),
    Whisky(
      id: 2,
      name: 'Glenmorangie Lasanta',
      imagePath: 'https://img.thewhiskyexchange.com/900/gmgob.12yov5.jpg',
      shortDescription:
          'Желе из айвы, молочный шоколад, миндальный мёд, гуава, херес олоросо, апельсин',
      region: 'Хайленд, Шотландия',
      category: WhiskyCategory.single_malt,
      fragrance: Flavour.fruit,
      taste: Flavour.sweet,
      aftertaste: Flavour.wine,
      rating: 3,
      abv: 46.0,
      note: 'Выдержка в бочках из-под олоросо. Холодная фильтрация',
    ),
  ];
}

import 'package:flutter/material.dart';

class Restaurant {
  final int id;
  final String imageUrl;
  final String name;
  final String address;
  final double rating;
  final int reviewCount;

  Restaurant(
      {required this.imageUrl,
      required this.name,
      required this.address,
      required this.rating,
      required this.reviewCount,
      required this.id});
}

List<Restaurant> restaurants = [
  Restaurant(
      id: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1511018556340-d16986a1c194?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJha2VyeXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60',
      name: 'Saleem Caterers',
      address: 'House # 184/61 Block A Latifabad Unit 6',
      rating: 4.8,
      reviewCount: 213),
  Restaurant(
    id: 2,
    imageUrl:
        'https://images.unsplash.com/photo-1479044769763-c28e05b5baa5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    name: 'Hyderabad Bakers',
    address: 'House # 184/61 Block A Mehmoodabad Unit 6',
    rating: 4.3,
    reviewCount: 200,
  ),
  Restaurant(
    id: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    name: 'Chinese Cha Cha Cha',
    address: '789 Oak St, City, Country',
    rating: 4.7,
    reviewCount: 300,
  ),
  Restaurant(
    id: 4,
    imageUrl:
        'https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
    name: 'MacDonalds',
    address: '101 Pine St, City, Country',
    rating: 4.8,
    reviewCount: 250,
  ),
];

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // radius of 15
          ),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                //borderRadius: BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    height: 150, // Set this to the desired height
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.network(
                      restaurant.imageUrl,
                      fit: BoxFit
                          .cover, // This makes the image scale down to fit within the box while maintaining its aspect ratio.
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(
                          fontFamily: 'Manrope-ExtraBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                        height:
                            4.0), // Add some space between the name and the address
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.location_on,
                          size: 20,
                          color: Colors.grey,
                        ), // This is the location icon
                        const SizedBox(
                            width:
                                4.0), // Add some space between the icon and the text
                        Text(
                          restaurant.address,
                          style: const TextStyle(
                            fontFamily: 'Manrope-Regular',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 18,
                    ),
                    const SizedBox(
                        width:
                            4.0), // Add some space between the icon and the text
                    Text(
                      "${restaurant.rating} (${restaurant.reviewCount} reviews)",
                      style: const TextStyle(
                          fontFamily: 'Manrope-Bold',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFCB585A),
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

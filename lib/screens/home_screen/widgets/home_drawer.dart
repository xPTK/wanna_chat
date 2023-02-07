import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:wanna_chat/global_widgets/avatar.dart';
import 'package:wanna_chat/helpers.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.9,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 72.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        Helpers.randomImageUrl(),
                      ),
                      fit: BoxFit.cover,
                      opacity: 0.5,
                    ),
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border(
                  //   bottom: BorderSide(width: 3, color: Colors.white),
                  //   top: BorderSide(width: 3, color: Colors.white),
                  //   left: BorderSide(width: 3, color: Colors.white),
                  //   right: BorderSide(width: 3, color: Colors.white),
                  // ),
                ),
                child: Avatar.large(
                  url: Helpers.randomImageUrl(),
                  //borderColor: Colors.black,
                ),
              ),
              Positioned(
                top: 8.0,
                left: 8.0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_photo_alternate_outlined,
                    shadows: [
                      buildShadow(),
                    ],
                  ),
                  color: Colors.white,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.cyan,
                    shape: StadiumBorder(),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            shadows: [
                              buildShadow(),
                            ],
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              Faker().person.name(),
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      color: Colors.cyan,
                      shape: StadiumBorder(),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                              shadows: [
                                buildShadow(),
                              ],
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                Faker().internet.freeEmail(),
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.cyan,
                    shape: StadiumBorder(),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            shadows: [
                              buildShadow(),
                            ],
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              Faker().address.city(),
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Shadow buildShadow() {
    return Shadow(
      color: Colors.black,
      offset: Offset.fromDirection(1, 1),
      blurRadius: 1,
    );
  }
}

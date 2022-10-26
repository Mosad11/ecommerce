import 'package:ecommerce/helpers/constance.dart';
import 'package:ecommerce/view_models/account_view_model.dart';
import 'package:ecommerce/views/auth/sign_in_view.dart';
import 'package:ecommerce/views/home/track_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends GetWidget<AccountViewModel> {
  AccountView({Key? key}) : super(key: key);
  final controller = Get.put(AccountViewModel());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountViewModel>(
        builder: (_) => SafeArea(
              child: Scaffold(
                body: SizedBox(
                  height: Get.height,
                  width: Get.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: Get.width * 120 / 375,
                                width: Get.width * 120 / 375,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryColor.withOpacity(0.3)),
                                child: const Icon(
                                  Icons.person,
                                  color: primaryColor,
                                  size: 50,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.email,
                                    style: const TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => TrackView());
                          },
                          child: ListTile(
                            title: const Text("Track Order"),
                            leading: Image.asset("assets/track.png"),
                            trailing: const RotatedBox(
                                quarterTurns: 2,
                                child: Icon(Icons.arrow_back_ios)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.firebaseAuth.signOut().then((value) {
                              Get.offAll(() => SignInView());
                            });
                          },
                          child: ListTile(
                            title: const Text("Logout"),
                            leading: Image.asset("assets/logout.png"),
                            trailing: const RotatedBox(
                                quarterTurns: 2,
                                child: Icon(Icons.arrow_back_ios)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}

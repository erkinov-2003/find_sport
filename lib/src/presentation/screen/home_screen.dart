import 'package:find_sport/src/presentation/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController addressController;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: AppColors.greyColor,
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.clear,
            size: 25,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: false,
        title: Text(
          "New ads",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.arrow_forward,
              color: AppColors.blackColor,
              size: 25,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  text: "Title",
                  hintText: "Enter product title",
                  controller: titleController,
                ),
                const SizedBox(height: 20),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 230,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.greyColor,
                        width: 0.3,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, right: 10),
                      child: Column(
                        children: [
                          TextField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Enter the description",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColors.greyColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            minLines: 1,
                            maxLines: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  text: "Address by location",
                  hintText: "Enter the map address",
                  controller: addressController,
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: 200,
                    child: GoogleMap(
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(41.3851, 2.1734),
                        zoom: 11,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        controller.moveCamera(
                          CameraUpdate.newLatLngZoom(
                              const LatLng(41.3851, 2.1734), 11),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

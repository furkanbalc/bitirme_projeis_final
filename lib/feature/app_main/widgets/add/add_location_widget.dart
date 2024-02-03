import 'package:bende_fazla/feature/app_main/view_model/base_provider.dart';
import 'package:bende_fazla/feature/app_main/widgets/add/index.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AddLocationWidget extends StatelessWidget {
  const AddLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BaseProvider>();
    return Padding(
      padding: context.paddings.onlyBottomUltra,
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            const AddFormTitleWidget(title: AppStrings.kAddFormLocation),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: context.borders.circularBorderRadiusMedium,
                border: Border.all(color: AppColors.purplePrimary),
              ),
              child: ClipRRect(
                borderRadius: context.borders.circularBorderRadiusMedium,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(watch.currentPosition?.latitude ?? 39.1667, watch.currentPosition?.longitude ?? 35.6667),
                    zoom: 12.0,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId("1"),
                      position: LatLng(watch.currentPosition?.latitude ?? 39.1667, watch.currentPosition?.longitude ?? 35.6667),
                      infoWindow: const InfoWindow(title: "İşaretlenen Konum"),
                    ),
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

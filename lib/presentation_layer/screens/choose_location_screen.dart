import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

// ui should be refactored
class ChooseLocationScreen extends StatelessWidget {
  final MapController controller = MapController();

  ChooseLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: OSMFlutter(
              controller: controller,
              isPicker: true,
              stepZoom: 1,
              initZoom: 2,
              minZoomLevel: 2,
              maxZoomLevel: 18,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: (() async {
                  final p = await controller
                      .getCurrentPositionAdvancedPositionPicker();
                  await controller.cancelAdvancedPositionPicker();
                  Navigator.pop(context, p);
                }),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.05)
                ),
                child: const Text(
                  "Choose location",
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }
}

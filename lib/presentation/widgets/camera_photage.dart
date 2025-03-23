import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


class CameraPhotage extends StatefulWidget {
  CameraPhotage({super.key});

  @override
  State<CameraPhotage> createState() => _CameraPhotageState();
}

class _CameraPhotageState extends State<CameraPhotage> {
  bool cameraOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Camera Preview",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(colors: [
                      Colors.grey.shade400,
                      Colors.grey.shade800
                    ])),
                child: cameraOpen
                    ? const CameraView()
                    : const Center(
                  child: SizedBox(height: 200,child: Icon(Icons.camera,size: 50,)),
                ),
              ),
              onTap: () => setState(() {
                cameraOpen = !cameraOpen;
              })
            ),
          ],
        ),
      ),
    );
  }
}

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    _setUpCameraController();
  }


  @override
  Widget build(BuildContext context) {
    if( cameraController == null || cameraController?.value.isInitialized == false){
      return const SizedBox(height: 200,);
    }
    return CameraPreview(cameraController!);
  }

  Future<void> _setUpCameraController() async {
    List<CameraDescription> _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      setState(() {
        cameras = _cameras;
        cameraController =
            CameraController(_cameras.last, ResolutionPreset.high);
      });
      cameraController?.initialize().then((_) {
        setState(() {});
      });
    }
  }
}

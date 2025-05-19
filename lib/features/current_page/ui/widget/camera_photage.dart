import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';


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
      color: Colors.cyan[50],
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
                      Colors.blue.shade200,
                      Colors.blue.shade900
                    ])),
                child: cameraOpen
                    ? const CameraView()
                    // ?  CameraStreamPage()
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


class CameraPhotage2 extends StatefulWidget {
  CameraPhotage2({super.key});

  @override
  State<CameraPhotage2> createState() => _CameraPhotage2State();
}

class _CameraPhotage2State extends State<CameraPhotage2> {
  bool cameraOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
      // color: Theme.of(context).colorScheme.inversePrimary,
      color: Colors.teal[50],
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
                    // ? const CameraView()
                    ?  CameraStreamPage2()
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

class CameraStreamPage extends StatefulWidget {
  @override
  _CameraStreamPageState createState() => _CameraStreamPageState();
}

class _CameraStreamPageState extends State<CameraStreamPage> {
  late VlcPlayerController _vlcViewController;

  @override
  void initState() {
    super.initState();
    _vlcViewController = VlcPlayerController.network(
      'rtsp://192.168.0.108:8554/left',
      hwAcc: HwAcc.auto,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() {
    _vlcViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  VlcPlayer(
          controller: _vlcViewController,
          aspectRatio: 16 / 9,
          placeholder: const Center(child: CircularProgressIndicator()),
        );
    
  }
}

class CameraStreamPage2 extends StatefulWidget {
  @override
  _CameraStreamPage2State createState() => _CameraStreamPage2State();
}

class _CameraStreamPage2State extends State<CameraStreamPage2> {
  late VlcPlayerController _vlcViewController;

  @override
  void initState() {
    super.initState();
    _vlcViewController = VlcPlayerController.network(
      'rtsp://192.168.0.108:8554/right',
      hwAcc: HwAcc.auto,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() {
    _vlcViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  VlcPlayer(
          controller: _vlcViewController,
          aspectRatio: 16 / 9,
          placeholder: const Center(child: CircularProgressIndicator()),
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

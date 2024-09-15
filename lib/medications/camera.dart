import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:rx_track/medications/picture.dart';

class Camera extends StatefulWidget {
  final CameraDescription camera;

  const Camera({super.key, required this.camera});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.ultraHigh,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.camera_alt),
                onPressed: () async {
                  try {
                    await _initializeControllerFuture;
                    final image = await _controller.takePicture();
              
                    if (!context.mounted) return;
              
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Picture(
                          imagePath: image.path,
                          camera: widget.camera,
                        ),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

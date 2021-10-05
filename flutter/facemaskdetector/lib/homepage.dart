import 'package:camera/camera.dart';
import 'package:facemaskdetector/styles.dart';
import 'package:flutter/material.dart';
import 'package:facemaskdetector/main.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CameraImage? imgCamera;
  CameraController? cameraController;
  bool isWorking = false;
  bool isSafe = false;
  String result = "";

  initCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);

    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        cameraController!.startImageStream((imageFromStream) => {
              if (!isWorking)
                {
                  isWorking = true,
                  imgCamera = imageFromStream,
                  runModelOnFrame(),
                }
            });
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }

  runModelOnFrame() async {
    if (imgCamera != null) {
      var recognitions = await Tflite.runModelOnFrame(
          bytesList: imgCamera!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: imgCamera!.height,
          imageWidth: imgCamera!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 1,
          threshold: 0.1,
          asynch: true);

      recognitions!.forEach((response) {
        setState(() {
          result = response["label"];
          if (response["label"] == "with_mask") {
            setState(() {
              isSafe = true;
              result = "With Face Mask";
            });
          } else {
            setState(() {
              isSafe = false;
              result = "Without Face Mask";
            });
          }
          result;
        });
      });
    }

    isWorking = false;
  }

  @override
  void initState() {
    super.initState();

    initCamera();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Face mask detector",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              width: size.width,
              height: size.height,
              child: Container(
                  height: size.height - 150,
                  width: size.width,
                  child: (!cameraController!.value.isInitialized)
                      ? Container()
                      : AspectRatio(
                          aspectRatio: cameraController!.value.aspectRatio,
                          child: CameraPreview(cameraController!),
                        )),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  height: 100,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Container(
                      height: 75,
                      width: size.width / 1.5,
                      decoration: isSafe == true
                          ? CustomStyle().withMaskContainer
                          : CustomStyle().withoutMaskContainer,
                      child: Center(
                        child: Text(result,
                            style: isSafe == true
                                ? CustomStyle().withMaskResult
                                : CustomStyle().withoutMaskResult),
                      ),
                    ),
                  )),
            ),

            // Positioned(
            //     bottom: 100,
            //     left: 0,
            //     right: 0,
            //     child: CircleAvatar(
            //       radius: 40,
            //       child: Image.asset("assets/prof.jpg"),
            //     ))
          ],
        ),
      ),
    );
  }
}

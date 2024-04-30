import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:guidely/utils/hex_color_conversion.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Function loadingTask = () async {};

  void doTask() async {
    Future.delayed(const Duration(seconds: 0), () async {
      dynamic taskResult = await loadingTask();
      if (mounted) {
        Navigator.pop(context, {"task_result": taskResult});
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    loadingTask = arguments["loading_task"];
    doTask();
    return Scaffold(
      backgroundColor: arguments["isStart"]
          ? Color(hexColorToAARRGGBB("#067A5A"))
          : Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            arguments["isStart"] ? 'Guidely' : '',
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SpinKitThreeBounce(
            color: arguments["isStart"]
                ? Colors.white
                : Color(hexColorToAARRGGBB("#067A5A")),
            size: 20.0,
          )
        ],
      ),
    );
  }
}

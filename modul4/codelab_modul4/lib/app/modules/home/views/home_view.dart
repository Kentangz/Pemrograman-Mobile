import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Audio Player with GetX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextField for entering the audio URL
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter audio URL',
                border: OutlineInputBorder(),
              ),
              onChanged: (url) => controller.updateAudioUrl(url),
            ),
            const SizedBox(height: 20),

            // Slider to control audio position
            Obx(() {
              return Slider(
                min: 0.0,
                max: controller.duration.value.inSeconds.toDouble(),
                value: controller.position.value.inSeconds.toDouble(),
                onChanged: (value) {
                  controller.seekAudio(Duration(seconds: value.toInt()));
                },
              );
            }),

            // Display current position and total duration
            Obx(() {
              return Text(
                '${_formatDuration(controller.position.value)} / ${_formatDuration(controller.duration.value)}',
              );
            }),
            const SizedBox(height: 20),

            // Control buttons for playback
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.isPlaying.value
                        ? controller.pauseAudio
                        : controller.resumeAudio,
                    child: Text(controller.isPlaying.value ? 'Pause' : 'Resume'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => controller.playAudio(),
                    child: const Text('Play'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: controller.stopAudio,
                    child: const Text('Stop'),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  // Helper function to format duration as minutes:seconds
  String _formatDuration(Duration duration) {
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}

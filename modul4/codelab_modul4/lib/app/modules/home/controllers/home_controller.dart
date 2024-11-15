import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // AudioPlayer instance to handle audio
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Reactive variables to manage playback state, duration, and position
  var isPlaying = false.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;
  var audioUrl = ''.obs; // Stores the audio URL input

  @override
  void onInit() {
    super.onInit();

    // Listen to audio duration changes
    _audioPlayer.onDurationChanged.listen((d) {
      duration.value = d;
    });

    // Listen to audio position changes
    _audioPlayer.onPositionChanged.listen((p) {
      position.value = p;
    });
  }

  @override
  void onClose() {
    _audioPlayer.dispose(); // Clean up AudioPlayer
    super.onClose();
  }

  // Update the audio URL
  void updateAudioUrl(String url) {
    audioUrl.value = url;
  }

  // Play the audio using the current URL
  Future<void> playAudio() async {
    if (audioUrl.isNotEmpty) {
      await _audioPlayer.play(UrlSource(audioUrl.value));
      isPlaying.value = true;
    }
  }

  // Pause the audio
  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
    isPlaying.value = false;
  }

  // Resume the audio
  Future<void> resumeAudio() async {
    await _audioPlayer.resume();
    isPlaying.value = true;
  }

  // Stop the audio and reset position
  Future<void> stopAudio() async {
    await _audioPlayer.stop();
    isPlaying.value = false;
    position.value = Duration.zero;
  }

  // Seek to a specified position in the audio
  void seekAudio(Duration newPosition) {
    _audioPlayer.seek(newPosition);
  }
}

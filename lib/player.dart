
import 'package:audioplayers/audio_cache.dart';

class Player{

  final _audioCache = AudioCache();

  void playSound() async{
    var result = _audioCache.play("yo_sound.mp3");
    print(result);
  }
}

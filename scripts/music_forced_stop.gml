music_play(""); if (audio_exists(objMusic.plmusic)) {if (audio_is_playing(objMusic.plmusic)) {
    audio_sound_gain(objMusic.plmusic,0,100); objMusic.ch=2; objMusic.currentMusic="";} else {
        objMusic.ch=3; objMusic.currentMusic="";}} else {objMusic.ch=3; objMusic.currentMusic="";}
objMusic.currentMusic=""; objMusic.lastMusic=""; audio_stop_sound(objMusic.plmusic); audio_destroy_stream(objMusic.rmusic); objMusic.mseek=0;
//objMusic.canPlay=0; //audio_stop_sound(objMusic.plmusic); audio_destroy_stream(objMusic.rmusic); objMusic.lastMusic="";

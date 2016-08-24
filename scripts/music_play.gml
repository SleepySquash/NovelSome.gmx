global.mFadeMax=1; global.mFadeIn=1000; global.mFadeOut=500;
objMusic.pathed=0; if (objMusic.currentMusic==argument0) {
    if (audio_exists(objMusic.plmusic)) {if (!audio_is_playing(objMusic.plmusic)) {
        audio_play_sound(objMusic.plmusic,10,1);
        audio_sound_gain(objMusic.plmusic,0,0);
        audio_sound_gain(objMusic.plmusic,global.musicVolume,1000);}}}
objMusic.currentMusic=argument0;

objMusic.localFadeMax=global.mFadeMax;
objMusic.localFadeIn=global.mFadeIn;
objMusic.localFadeOut=global.mFadeOut;

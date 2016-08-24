draw_texture_flush();
global.inGame=0; global.noTrAdding=0;
global.gameIsLoaded=0; global.savCount=120;
global.canGamePause=1; objGUI_ingame.selPage=0;
global.gamePause=0; global.mPrStart=0;
global.location=""; global.locLoading=0; global.is3DHide=0;
global.locationid=-1; global.location=""; global.gRChanged=0;
objScene.path=""; with (objScene) {scene_load();} ds_map_clear(novdat.charlist);
global.control=noone; instance_create(0,0,objWindowRes); global.backgrounddepth=0; global.persondepth=0;
global.mFadeMax=1; global.mFadeIn=1000; global.mFadeOut=500;
if (objMusic.currentMusic!=global.menuMusic) {music_stop();}
if (global.skinChanged) {skin_deapply(); skin_apply();} global.skinChanged=0; global.skChanged_isFN=0; global.skChanged_path="";
global.dDrawFont=global.dialTextFont; global.dDrawFont_t=global.dialTextFont_t;
global.gameType="Single"; global.gameMode="Free"; global.storyID=-1;
audio_listener_position(0,0,0); global.cursor=cr_default; global.btCl1=1;
if (instance_exists(novel)) {if (novel.novid!=-1) {
    for (im=1;im<=novdat.charCount[novel.novid];im+=1) {
        ds_list_destroy(novdat.charoflist[novel.novid,im]);}}}
//if (global.canSave) {game_ini_save();}
//after_deinit();
chat_reinit(); trBack_clear();
global.backOMove=0.008; global.charOMove_n=0.020; global.charOMove_f=0.011; global.charOMove_c=0.035;
global.nowaitset=0; global.alphaRefValue=128;
while (instance_exists(novel)) {with (novel) {instance_destroy();}}
while (instance_exists(objScr_gameInit)) {with (objScr_gameInit) {instance_destroy();}}
while (instance_exists(objGUI_dialogue)) {with (objGUI_dialogue) {instance_destroy();}}
while (instance_exists(objDialBack)) {with (objDialBack) {instance_destroy();}}
while (instance_exists(objHUD)) {with (objHUD) {instance_destroy();}}
while (instance_exists(objSNv_background)) {with (objSNv_background) {instance_destroy();}}
while (instance_exists(objSNv_imAnim)) {with (objSNv_imAnim) {instance_destroy();}}
while (instance_exists(objSNv_person)) {with (objSNv_person) {instance_destroy();}}
while (instance_exists(objSNv_wait)) {with (objSNv_wait) {instance_destroy();}}
while (instance_exists(objSNv_video)) {with (objSNv_video) {instance_destroy();}}
while (instance_exists(objEmitter)) {with (objEmitter) {instance_destroy();}}
while (instance_exists(obj3DCamera)) {with (obj3DCamera) {instance_destroy();}}
while (instance_exists(obj3DPoint)) {with (obj3DPoint) {instance_destroy();}}
while (instance_exists(obj3DObject)) {with (obj3DObject) {instance_destroy();}}
while (instance_exists(par_wall)) {with (par_wall) {instance_destroy();}}
while (instance_exists(objPlayer)) {with (objPlayer) {instance_destroy();}}
while (is_dialog_exists()) {dialogue_remove();}
//if (instance_exists(conn)) {with (conn) {disconnected=1;}}
view_set_target(noone,0);
if (global.debug) {with (objGUI_chat) {chat_add_color("Game deinit'ing...",c_maroon);}}

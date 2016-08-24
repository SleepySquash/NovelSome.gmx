if (instance_exists(objScr_gameInit)) {exit;}
game_deinit(); a=instance_create(0,0,objScr_gameInit);
a.novid=argument0; global.loading=1; global.loadingFile=argument1;

if (instance_exists(objView)) {_snd=instance_create(objView.x,objView.y,objEmitter);}
else {_snd=instance_create(x,y,objEmitter);}
_snd.type='ambient';
_snd.sound=argument0;
if (instance_exists(objView)) {_snd.from=objView;}
return _snd;

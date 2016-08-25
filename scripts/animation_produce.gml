if (novid!=-1) {if (!novdat.isObsolete[novid]) {
if (!animated) {exit;} if (global.gamePause) {alarm[1]=1; exit;} _zoff=0; if (object_index == obj3DCamera) {_zoff = _lookfromz;}
if (wtime>0) {if (_wtm<wtime) {_wtm+=1*Time.deltatime;} else {_wtm=0; waitingForComplete=0; wtime=0;}}

shline=1; _file=-1; while (!waitingForComplete) {if (crline>=lineCount) {animated=0; if (!nogamenolife) {
    if (!atelled && !anotell) {if (instance_exists(novel)) {novel.waitingForComplete=0;} atelled=1;}} exit;} fstr=line[crline];
while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
while (string_copy(fstr,string_length(fstr),1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,1,string_length(fstr)-1);}}

if (nss_check("move ")) {_byx=string_get_tillsymbol(fstr,string_length("move "),' '); if (_byx!="") {
    _bytime=animation_checktime(); _byy=""; _byz=""; ipos=string_length("move ")+string_length(_byx)+2;
    while (ipos<=string_length(fstr)) {_str2=string_get_tillsymbol(fstr,ipos,' '); if (_str2 == "nowait") {nowait=1;}
        else if (string_copy(_str2,1,string_length("time:")) == "time:") {_bytime=string_convert_topos(string_copy(_str2,string_length("time:"),string_length(fstr)-string_length("time:")));}
        else if (string_copy(_str2,1,string_length("x:")) == "x:") {_byx=(string_copy(_str2,string_length("x:"),string_length(fstr)-string_length("x:")));}
        else if (string_copy(_str2,1,string_length("y:")) == "y:") {_byy=(string_copy(_str2,string_length("x:"),string_length(fstr)-string_length("x:")));}
        else if (string_copy(_str2,1,string_length("z:")) == "z:") {_byz=(string_copy(_str2,string_length("x:"),string_length(fstr)-string_length("x:")));}
        else {if (_byy=="") {_byy=_str2;} else if (_byz=="") {_byz=_str2;}}
        ipos+=string_length(_str2);} timeLeft1=_bytime; timeLeft2=_bytime; timeLeft6=_bytime;
    if (_byx!="") {xcon=string_convert_topos(_byx);} if (_byy!="") {ycon=string_convert_topos(_byy);} if (_byz!="") {zcon=string_convert_topos(_byz);}}}
else if (nss_check("repeat start")) {if (crline+1<lineCount) {
    if (string_copy(line[crline+1],1,string_length('repeat count '))=='repeat count ') {
        _rcon=(string_copy(line[crline+1],string_length('repeat count ')+1,string_length(line[crline+1])-string_length('repeat count ')));
            if (_rcon!="") {repCount=string_convert_topos(_rcon); if (crline+2<lineCount) {isRepeat=1; rLine=crline+2;}}}
    else {repCount=0; rLine=crline+1; isRepeat=1;}}}
else if (nss_check("repeat end")) {if (isRepeat) {if (repCount<=0) {crline=rLine; exit;}
    else {repCur+=1; if (repCur>=repCount) {isRepeat=0; repCur=0;} else {crline=rLine; exit;}}}}
else if (nss_check("animation nowait")) {if (!nogamenolife) {
    if (!atelled && !anotell) {if (instance_exists(novel)) {novel.waitingForComplete=0;} atelled=1;}}}
else if (nss_check("nowait")) {nowait=1;}
else if (nss_check("wait ")) {hmany=string_copy(fstr,string_length('wait ')+1,string_length(fstr)-string_length("wait "));
    if (hmany!="") {wtime=30*string_convert_topos(hmany); waitingForComplete=1;}}
if (nowait) {if (waitingForComplete) {waitingForComplete=0; nowait=0;}}
crline+=shline;}

if (timeLeft1!=0) {_xsclreq=1; if (object_index == objSNv_person) {_xsclreq=cuscale*xscale;} else if (object_index == objSNv_background) {_xsclreq=addbx*xscale;}
    xoff+=(xcon)/(timeLeft1) + (xcon/2*(_xsclreq-1))/(timeLeft1); _time1+=1*Time.deltatime;
    if (_time1>=timeLeft1) {timeLeft1=0; _time1=0; if (xmovingW) {waitingForComplete-=1;} xmovingW=0;}}



} else {if (!animated) {exit;} if (global.gamePause) {alarm[1]=1; exit;} if (nwsync) {cond=(waitingForComplete);} else {cond=1;} _zoff=0; if (object_index == obj3DCamera) {_zoff = _lookfromz;}
if (wtime>0) {if (_wtm<wtime) {_wtm+=1*Time.deltatime;} else {_wtm=0; waitingForComplete=0; wtime=0;}}
if (cond) {if (xscaling) {if (_time4<timeLeft3) {xscale+=xslcon*Time.deltatime; _time4+=1*Time.deltatime;} else {xscaling=0; _time4=0; if (xscalingW) {waitingForComplete=0;}}}
if (yscaling) {if (_time5<timeLeft4) {yscale+=yslcon*Time.deltatime; _time5+=1*Time.deltatime;} else {yscaling=0; _time5=0; if (yscalingW) {waitingForComplete=0;}}}
if (xmoving) {if (_time1<timeLeft1) {if (imp) {for (i=0;i<acount;i+=1) {if (object_index == objSNv_person) {_xsclreq=cuscale*xscale*sscale[i];
    } else {_xsclreq=addbx*mbackx[i]*xscale*shscale[i];} indxoff[i]+=(xmcon*(_xsclreq))*Time.deltatime;}} else {
    _xsclreq=1; if (object_index == objSNv_person) {_xsclreq=cuscale*xscale;} else if (object_index == objSNv_background) {_xsclreq=addbx*xscale;}
    xoff+=(xmcon*(_xsclreq))*Time.deltatime; if (object_index == obj3DCamera) {x+=(xmcon*(_xsclreq))*Time.deltatime;}} _time1+=1*Time.deltatime;} else {xmoving=0; _time1=0; if (xmovingW) {waitingForComplete=0;}}}
if (ymoving) {if (_time2<timeLeft2) {if (imp) {for (i=0;i<acount;i+=1) {if (object_index == objSNv_person) {_ysclreq=cuscale*yscale*sscale[i];
    } else {_ysclreq=addbx*mbacky[i]*yscale*shscale[i];} indyoff[i]+=(ymcon*(_ysclreq))*Time.deltatime;}} else {
    _ysclreq=1; if (object_index == objSNv_person) {_ysclreq=cuscale*yscale;} else if (object_index == objSNv_background) {_ysclreq=addbx*yscale;}
    yoff+=(ymcon*(_ysclreq))*Time.deltatime; if (object_index == obj3DCamera) {y+=(ymcon*(_ysclreq))*Time.deltatime;}} _time2+=1*Time.deltatime;} else {ymoving=0; _time2=0; if (ymovingW) {waitingForComplete=0;}}}
if (zmoving) {if (_time6<timeLeft6) {_ysclreq=1; zoff+=(zmcon*(_ysclreq))*Time.deltatime;
    if (object_index == obj3DCamera) {z+=(zmcon*(_ysclreq))*Time.deltatime;} _time6+=1*Time.deltatime;} else {zmoving=0; _time6=0; if (zmovingW) {waitingForComplete=0;}}}
if (lookingAt) {if (_time7<timeLeft7) {obj3DCamera.direction-=lktAt_dir*(lktAt_spd*Time.deltatime);
    //obj3DCamera.direction=lerp(obj3DCamera.direction,lktAt_dir,lktAt_spd*Time.deltatime);
    obj3DCamera.pitch-=lktAt_pitch*(lktAt_spd*Time.deltatime);
    //obj3DCamera.pitch=lerp(obj3DCamera.pitch,lktAt_pitch,lktAt_spd*Time.deltatime);
    _time7+=1*Time.deltatime;} else {lookingAt=0; _time7=0; if (lookingAtW) {waitingForComplete=0;}}}
if (fovingOut) {if (_time8<timeLeft8) {if (obj3DCamera.FOV!=fvOut_end) {obj3DCamera.FOV+=(fvOut_end-fvOut_stFov)*fvOut_spd*Time.deltatime;}
    //obj3DCamera.FOV=lerp(obj3DCamera.FOV,fvOut_end,fvOut_spd*Time.deltatime);
    _time8+=1*Time.deltatime;} else {fovingOut=0; _time8=0; if (fovingOutW) {waitingForComplete=0;}}}
/*if (xmoving) {_time1+=1*Time.deltatime; if (object_index == objSNv_person) {if (imp) {_isFinished=0; for (i=0;i<acount;i+=1) {if (_time1>=timeLeft1*1.3) {indxoff[i]=xpointend;} if (indxoff[i]<>xpointend) {
        _xmcon = xmcon*(cuscale*xscale*sscale[i])*Time.deltatime; indxoff[i]+=_xmcon; if (indxoff[i]>xpointend-_xmcon && indxoff[i]<xpointend+_xmcon) {indxoff[i]=xpointend;}} else {_isFinished+=1;}}
        if (_isFinished==acount) {xmoving=0; _time1=0; if (xmovingW) {waitingForComplete=0;}}} else {if (_time1>=timeLeft1*1.3) {xoff=xpointend;} if (xoff<>xpointend) {
        _xmcon = xmcon*(cuscale*xscale)*Time.deltatime; xoff+=_xmcon; if (xoff>xpointend-_xmcon && xoff<xpointend+_xmcon) {xoff=xpointend;}} else {xmoving=0; _time1=0; if (xmovingW) {waitingForComplete=0;}}}}
    else {if (imp) {_isFinished=0; for (i=0;i<acount;i+=1) {if (_time1>=timeLeft1*1.3) {indxoff[i]=xpointend;} if (indxoff[i]<>xpointend) {
        _xmcon = xmcon*(addbx*mbackx[i]*xscale*shscale[i])*Time.deltatime; indxoff[i]+=_xmcon; if (indxoff[i]>xpointend-_xmcon && indxoff[i]<xpointend+_xmcon) {indxoff[i]=xpointend;}} else {_isFinished+=1;}}
        if (_isFinished==acount) {xmoving=0; _time1=0; if (xmovingW) {waitingForComplete=0;}}} else {if (_time1>=timeLeft1*1.3) {xoff=xpointend;} if (xoff<>xpointend) {
        _xmcon = xmcon*(addbx*xscale)*Time.deltatime; xoff+=_xmcon; if (xoff>xpointend-_xmcon && xoff<xpointend+_xmcon) {xoff=xpointend;}} else {xmoving=0; _time1=0; if (xmovingW) {waitingForComplete=0;}}}}}
if (ymoving) {_time2+=1*Time.deltatime; if (object_index == objSNv_person) {if (imp) {_isFinished=0; for (i=0;i<acount;i+=1) {if (_time2>=timeLeft2*1.3) {indyoff[i]=ypointend;} if (indyoff[i]<>ypointend) {
        _ymcon = ymcon*(cuscale*yscale*sscale[i])*Time.deltatime; indyoff[i]+=_ymcon; if (indyoff[i]>ypointend-_ymcon && indyoff[i]<ypointend+_ymcon) {indyoff[i]=ypointend;}} else {_isFinished+=1;}}
        if (_isFinished==acount) {ymoving=0; _time1=0; if (ymovingW) {waitingForComplete=0;}}} else {if (_time2>=timeLeft2*1.3) {yoff=ypointend;} if (yoff<>ypointend) {
        _ymcon = ymcon*(cuscale*yscale)*Time.deltatime; yoff+=_ymcon; if (yoff>ypointend-_ymcon && yoff<ypointend+_ymcon) {yoff=ypointend;}} else {ymoving=0; _time1=0; if (ymovingW) {waitingForComplete=0;}}}}
    else {if (imp) {_isFinished=0; for (i=0;i<acount;i+=1) {if (_time2>=timeLeft2*1.3) {indyoff[i]=ypointend;} if (indyoff[i]<>ypointend) {
        _ymcon = ymcon*(addbx*mbacky[i]*yscale*shscale[i])*Time.deltatime; indyoff[i]+=_ymcon; if (indyoff[i]>ypointend-_ymcon && indyoff[i]<ypointend+_ymcon) {indyoff[i]=ypointend;}} else {_isFinished+=1;}}
        if (_isFinished==acount) {ymoving=0; _time1=0; if (ymovingW) {waitingForComplete=0;}}} else {if (_time2>=timeLeft2*1.3) {yoff=ypointend;} if (yoff<>ypointend) {
        _ymcon = ymcon*(addbx*yscale)*Time.deltatime; yoff+=_ymcon; if (yoff>ypointend-_ymcon && yoff<ypointend+_ymcon) {yoff=ypointend;}} else {ymoving=0; _time1=0; if (ymovingW) {waitingForComplete=0;}}}}}*/
if (afading && !dest) {if (_time3<timeLeft5) {alpha+=fspd*Time.deltatime; if (alpha>fadeinmax) {alpha=fadeinmax;} _time3+=1*Time.deltatime;} else {if (alpha>fadeinmax) {alpha=fadeinmax;} afading=0; _time3=0; if (afadingW) {waitingForComplete=0;}}}}
if (waitingForComplete) {alarm[1]=1; exit;} else {if (nwsync) {nwsync=0;}} while (!waitingForComplete) {if (crline>=lineCount) {animated=0;
    if (!nogamenolife) {if (!atelled && !anotell) {if (instance_exists(novel)) {novel.waitingForComplete=0;} atelled=1;}
    if (bnum!=-1) {if (instance_exists(novel)) {if (object_index==objSNv_background) {
        novdat.backanim[novel.novid,bnum]="";} else if (object_index==objSNv_person) {novdat.charanim[novel.novid,bnum]="";}}}} exit;} crstr=line[crline]; shline=1;
if (string_copy(crstr,1,string_length(" "))==" ") {blnum=""; bldef=""; num="_"; _count=1; while (num!="") {_ph=string_copy(crstr,1,_count);
    if (string_copy(_ph,string_length(_ph),1)!=" ") {_ph=string_copy(_ph,1,string_length(_ph)-1); num="";} else {_count+=1; if (_count>=global.maxSpaceCount) {break;}}}
    if (_ph!="") {crstr=string_copy(crstr,string_length(_ph)+1,string_length(crstr)-string_length(_ph));}}
if (string_copy(crstr,1,string_length('movex '))=='movex ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} xcon=(string_copy(line[crline],string_length('movex ')+1,string_length(line[crline])-string_length('movex ')));
        if (xcon!="" && string_digits(xcon)!="") {if (timedoing==0) {
            if (imp) {for (i=0;i<acount;i+=1) {if (object_index == objSNv_person) {_xsclreq=cuscale*xscale*sscale[i];
            } else if (object_index == objSNv_background) {_xsclreq=addbx*mbackx[i]*xscale*shscale[i];} indxoff[i]+=(real(xcon)*(_xsclreq));}} else {
            if (object_index == objSNv_person) {_xsclreq=cuscale*xscale;} else if (object_index == objSNv_background) {_xsclreq=addbx*xscale;}
            xoff+=(real(xcon)*(_xsclreq));}} else {xmoving=1; xmovingW=!nowait; xpointend=real(xcon); timeLeft1=timedoing; xmcon=real(xcon)/timedoing; waitingForComplete=1;}}}
else if (string_copy(crstr,1,string_length('movey '))=='movey ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} ycon=(string_copy(line[crline],string_length('movey ')+1,string_length(line[crline])-string_length('movey ')));
        if (ycon!="" && string_digits(ycon)!="") {if (timedoing==0) {yoff+=real(ycon);} else {ymoving=1; ymovingW=!nowait; ypointend=real(ycon); timeLeft2=timedoing; ymcon=real(ycon)/timedoing; waitingForComplete=1;}}}
else if (string_copy(crstr,1,string_length('movexy '))=='movexy ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} xcon=string_get_ssnumber(line[crline],string_length('movexy ')+1);
            if (xcon!="" && string_digits(xcon)!="") {ycon=string_get_ssnumber(line[crline],string_length('movexy  ')+1+string_length(xcon));
                if (ycon!="" && string_digits(ycon)!="") {if (timedoing==0) {yoff+=real(ycon); xoff+=real(xcon);} else {timeLeft1=timedoing; timeLeft2=timedoing; waitingForComplete=1;
                    __xoff = xoff; __yoff = yoff; if (imp) {__xoff = indxoff[0]; __yoff = indxoff[0];}
                    ymoving=1; ymovingW=!nowait; ypointend=__yoff+real(ycon); ymcon=real(ycon)/timedoing; xmoving=1; xmovingW=!nowait; xpointend=__xoff+real(xcon); xmcon=real(xcon)/timedoing;}}}}
else if (string_copy(crstr,1,string_length('movexyz '))=='movexyz ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} xcon=string_get_ssnumber(line[crline],string_length('movexyz ')+1);
            if (xcon!="" && string_digits(xcon)!="") {ycon=string_get_ssnumber(line[crline],string_length('movexyz  ')+1+string_length(xcon));
                if (ycon!="" && string_digits(ycon)!="") {zcon=string_get_ssnumber(line[crline],string_length('movexyz   ')+1+string_length(xcon)+string_length(ycon));
                    if (zcon!="" && string_digits(zcon)!="") {if (timedoing==0) {yoff+=real(ycon); xoff+=real(xcon); zoff+=real(zcon);
                            if (object_index == obj3DCamera) {y+=real(ycon); x+=real(xcon); z+=real(zcon);}
                        } else {timeLeft1=timedoing; timeLeft2=timedoing; timeLeft6=timedoing; waitingForComplete=1;
                        __xoff = xoff; __yoff = yoff; if (imp) {__xoff = indxoff[0]; __yoff = indxoff[0];}
                        ymoving=1; ymovingW=!nowait; ypointend=__yoff+real(ycon); ymcon=real(ycon)/timedoing; xmoving=1; xmovingW=!nowait; xpointend=__xoff+real(xcon); xmcon=real(xcon)/timedoing;
                        zmoving=1; zmovingW=!nowait; zpointend=zoff+real(zcon); zmcon=real(zcon)/timedoing;}}}}}
else if (string_copy(crstr,1,string_length('lookat cont '))=='lookat cont ') {lktAtName=string_get_sstring(line[crline],string_length('lookat cont ')+1);
        if (lktAtName!="") {if (ds_map_exists(objScene.objects,lktAtName)) {lktAtObj = ds_map_find_value(objScene.objects,lktAtName); camera_lookat_cont(lktAtObj);} else {
            if (lktAtName=="point") {imgnum1=string_get_sstring(line[crline],string_length('lookat cont point ')+1);
                if (imgnum1!="") {imgnum2=string_get_sstring(line[crline],string_length('lookat cont point  ')+string_length(imgnum1)+1);
                    if (imgnum2!="") {imgnum3=string_get_sstring(line[crline],string_length('lookat cont point   ')+string_length(imgnum1)+string_length(imgnum2)+1);
                        if (imgnum3!="") {_point = instance_create(real(imgnum1),real(imgnum2),obj3DPoint); _point.z=real(imgnum3);
                            obj3DCamera.follow=_point;}}}} else {obj3DCamera.follow=noone;}}}}
else if (string_copy(crstr,1,string_length('lookat '))=='lookat ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} lktAtName=(string_get_sstring(line[crline],string_length('lookat ')+1));
        if (lktAtName!="") {if (ds_map_exists(objScene.objects,lktAtName)) {lktAtObj = ds_map_find_value(objScene.objects,lktAtName);
            if (instance_exists(obj3DCamera.follow)) {if (obj3DCamera.follow.object_index!=objPlayer) {obj3DCamera.follow=noone;}}
            if (timedoing==0) {camera_lookat(lktAtObj);} else {lookingAt=1; lktAt_spd = 1/timedoing; lookingAtW=!nowait; timeLeft7=timedoing; waitingForComplete=1;
                with (obj3DCamera) {//other.lktAt_dir = point_direction(x,y,other.lktAtObj.x,other.lktAtObj.y);
                    //if ((360-obj3DCamera.direction)-other.lktAt_dir < (obj3DCamera.direction)-other.lktAt_dir) {obj3DCamera.direction = 360-obj3DCamera.direction;}
                    other.lktAt_dir = angle_difference(obj3DCamera.direction,point_direction(x,y,other._point.x,other._point.y));
                    other.lktAt_pitch = angle_difference(obj3DCamera.pitch,-point_direction(0,z+_lookfromz,point_distance(x,y,other.lktAtObj.x,other.lktAtObj.y),other.lktAtObj.z));
                    /*__pdirect = -point_direction(0,z+_lookfromz,point_distance(x,y,other.lktAtObj.x,other.lktAtObj.y),other.lktAtObj.z);
                    if (__pdirect<-viewLimz) {__pdirect = 360+__pdirect;} if (__pdirect>viewLimz) {__pdirect = __pdirect-360;} other.lktAt_pitch = __pdirect;*/}}}
            else {if (lktAtName=="point") {imgnum1=string_get_sstring(line[crline],string_length('lookat point ')+1);
                if (imgnum1!="") {imgnum2=string_get_sstring(line[crline],string_length('lookat point  ')+string_length(imgnum1)+1);
                    if (imgnum2!="") {imgnum3=string_get_sstring(line[crline],string_length('lookat point   ')+string_length(imgnum1)+string_length(imgnum2)+1);
                        if (imgnum3!="") {_point = instance_create(real(imgnum1),real(imgnum2),obj3DPoint); _point.z=real(imgnum3); lktAtObj=_point;
                            if (instance_exists(obj3DCamera.follow)) {if (obj3DCamera.follow.object_index!=objPlayer) {obj3DCamera.follow=noone;}}
                            if (timedoing==0) {camera_lookat(_point);} else {lookingAt=1; lktAt_spd = 1/timedoing; lookingAtW=!nowait; timeLeft7=timedoing; waitingForComplete=1;
                            with (obj3DCamera) {other.lktAt_dir = angle_difference(obj3DCamera.direction,point_direction(x,y,other._point.x,other._point.y));
                                //if ((360-obj3DCamera.direction)-other.lktAt_dir < (obj3DCamera.direction)-other.lktAt_dir) {obj3DCamera.direction = 360-obj3DCamera.direction;}
                                other.lktAt_pitch = angle_difference(obj3DCamera.pitch,-point_direction(0,z+_lookfromz,point_distance(x,y,other._point.x,other._point.y),other._point.z));
                                /*__pdirect = -point_direction(0,z+_lookfromz,point_distance(x,y,other._point.x,other._point.y),other._point.z);
                                if (__pdirect<-viewLimz) {__pdirect = 360+__pdirect;} if (__pdirect>viewLimz) {__pdirect = __pdirect-360;} other.lktAt_pitch = __pdirect;*/}}}}}}}}}
else if (string_copy(crstr,1,string_length('fov '))=='fov ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} lktAtName=(string_copy(line[crline],string_length('fov ')+1,string_length(line[crline])-string_length('fov ')));
        if (lktAtName!="") {fvOut_ = clamp(real(lktAtName),5,179); if (timedoing==0) {obj3DCamera.FOV = fvOut_;} else {
            fovingOut=1; fvOut_spd = 1/timedoing; fovingOutW=!nowait; fvOut_stFov=obj3DCamera.FOV; timeLeft8=timedoing; waitingForComplete=1; fvOut_end = fvOut_;}}}
else if (string_copy(crstr,1,string_length('posx '))=='posx ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} xcon=(string_copy(line[crline],string_length('posx ')+1,string_length(line[crline])-string_length('posx ')));
        if (xcon!="" && string_digits(xcon)!="") {xcon=-real(xcon); if (timedoing==0) {xoff=real(xcon);} else {xmoving=1; xmovingW=!nowait; xpointend=real(xcon); timeLeft1=timedoing;
        xmcon=(real(xcon)-xoff)/timedoing; waitingForComplete=1;}}}
else if (string_copy(crstr,1,string_length('posy '))=='posy ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} ycon=(string_copy(line[crline],string_length('posy ')+1,string_length(line[crline])-string_length('posy ')));
        if (ycon!="" && string_digits(ycon)!="") {ycon=-real(ycon); if (timedoing==0) {yoff=real(ycon);} else {ymoving=1; ymovingW=!nowait; ypointend=real(ycon); timeLeft2=timedoing;
        ymcon=(real(ycon)-yoff)/timedoing; waitingForComplete=1;}}}
else if (string_copy(crstr,1,string_length('posxy '))=='posxy ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} xcon=string_get_ssnumber(line[crline],string_length('posxy ')+1);
            if (xcon!="" && string_digits(xcon)!="") {ycon=string_get_ssnumber(line[crline],string_length('posxy  ')+1+string_length(xcon));
                if (ycon!="" && string_digits(ycon)!="") {xcon=-real(xcon); ycon=-real(ycon);if (timedoing==0) {yoff=real(ycon); xoff=real(xcon);} else {
                    timeLeft1=timedoing; timeLeft2=timedoing; waitingForComplete=1; ymoving=1; ymovingW=!nowait; ypointend=real(ycon); ymcon=(real(ycon)-yoff)/timedoing; xmoving=1; xmovingW=!nowait; xpointend=real(xcon); xmcon=(real(xcon)-xoff)/timedoing;}}}}
else if (string_copy(crstr,1,string_length('posxyz '))=='posxyz ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} xcon=string_get_ssnumber(line[crline],string_length('posxyz ')+1);
            if (xcon!="") {ycon=string_get_ssnumber(line[crline],string_length('posxyz  ')+1+string_length(xcon));
                if (ycon!="") {zcon=string_get_ssnumber(line[crline],string_length('posxyz   ')+1+string_length(xcon)+string_length(ycon));
                    if (zcon!="") {if (timedoing==0) {yoff=real(ycon); xoff=real(xcon); zoff=real(xcon);
                        if (object_index == obj3DCamera) {y=real(ycon); x=real(xcon); z=real(zcon);}} else {
                        timeLeft1=timedoing; timeLeft2=timedoing; timeLeft6=timedoing; waitingForComplete=1; ymoving=1; ymovingW=!nowait; ypointend=real(ycon); ymcon=(real(ycon)-yoff)/timedoing;
                        xmoving=1; xmovingW=!nowait; xpointend=real(xcon); xmcon=(real(xcon)-xoff)/timedoing; zmoving=1; zmovingW=!nowait; zmcon=(real(zcon)-obj3DCamera.z)/timedoing;}}}}}
else if (string_copy(crstr,1,string_length('scale '))=='scale ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} xcon=(string_copy(line[crline],string_length('scale ')+1,string_length(line[crline])-string_length('scale ')));
        if (xcon!="" && string_digits(xcon)!="") {if (timedoing==0) {xscale=real(xcon); yscale=real(xcon);} else {xscaling=1; yscaling=1; timeLeft3=timedoing; timeLeft4=timedoing;
        xscalingW=!nowait; yscalingW=!nowait; xmovingW=!nowait; xslcon=(real(xcon)-xscale)/timedoing; yslcon=(real(xcon)-yscale)/timedoing; waitingForComplete=1;}}}
else if (string_copy(crstr,1,string_length('scalex '))=='scalex ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} xcon=(string_copy(line[crline],string_length('scalex ')+1,string_length(line[crline])-string_length('scalex ')));
        if (xcon!="" && string_digits(xcon)!="") {if (timedoing==0) {xscale=real(xcon);} else {xscaling=1; timeLeft3=timedoing;
        xslcon=(real(xcon)-xscale)/timedoing; xscalingW=!nowait; waitingForComplete=1;}}}
else if (string_copy(crstr,1,string_length('scaley '))=='scaley ') {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} xcon=(string_copy(line[crline],string_length('scaley ')+1,string_length(line[crline])-string_length('scaley ')));
        if (xcon!="" && string_digits(xcon)!="") {if (timedoing==0) {yscale=real(xcon);} else {yscaling=1; timeLeft4=timedoing;
        yslcon=(real(xcon)-yscale)/timedoing; yscalingW=!nowait; waitingForComplete=1;}}}
else if (string_copy(crstr,1,string_length("scale reset"))=="scale reset") {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} if (timedoing==0) {xscale=1; yscale=1;} else {waitingForComplete=1; timeLeft3=timedoing; timeLeft4=timedoing;
                xscaling=1; xscalingW=!nowait; yscalingW=!nowait; xslcon=(1-xscale)/timedoing; yscaling=1; yslcon=(1-yscale)/timedoing;}}
else if (string_copy(crstr,1,string_length("position reset"))=="position reset") {timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} if (timedoing==0) {xoff=0; yoff=0; if (imp) {for (i=0;i<acount;i+=1) {indxoff[i]=0; indyoff[i]=0;}}}
                else {waitingForComplete=1; timeLeft1=timedoing; timeLeft2=timedoing; xpointend=0; ypointend=0; xmovingW=!nowait; ymovingW=!nowait;
                if (imp) {xmcon=(-indxoff[0])/timedoing; ymcon=(-indyoff[0])/timedoing;} else {xmcon=(-xoff)/timedoing; ymcon=(-yoff)/timedoing;} xmoving=1; ymoving=1;}}
else if (string_copy(crstr,1,string_length('fadeto '))=='fadeto ') {fd=1; timedoing=0;
    if (crline+1<lineCount) {if (string_copy(line[crline+1],1,string_length('time '))=='time ') {shline+=1;
        _tm=string_digits(string_copy(line[crline+1],string_length('time ')+1,string_length(line[crline+1])-string_length('time ')));
            if (_tm!="") {timedoing=real(_tm);}}} fam=string_copy(line[crline],string_length('fadeto ')+1,global.maxDigitCount); if (fam!="") {
                if (timedoing==0) {if (fadeinmax<real(fam)) {fadeinmax=real(fam);} alpha=real(fam);} else {afading=1; timeLeft5=timedoing; if (fadeinmax<real(fam)) {fadeinmax=real(fam);} waitingForComplete=1;
                    ram=real(fam)-alpha; afadingW=!nowait; fspd=real(ram)/timedoing;}}}
else if (string_copy(crstr,1,string_length("sound "))=="sound ") {fname=string_copy(crstr,string_length("sound ")+1,string_length(crstr)-string_length("sound "));
        if (fname=="stop") {for (i=0;i<instance_number(objEmitter);i+=1) {ab=instance_find(objEmitter,i); if (ab.type=='streamsound') {ab.alarm[1]=1;}}
            } else {ext=string_lower(string_copy(fname,string_length(fname)-3,4));
        if (ext==".mp3"||ext==".fla"||ext==".wma"||ext==".aac"||ext==".wav") {if (global.debug) {with (objGUI_chat) {chat_add_color("Only .ogg files supported!",c_red);
            alarm[1]=1; exit;}}} if (ext!="" && (ext==".ogg")) {
        if (instance_exists(novel)) {_novid=novel.novid;} else {_novid=novid;} if (_novid!=-1) {_path=novdat.FolName[_novid]+"\";
        if (string_copy(crstr,1,string_length("sound Stuff/"))=="sound Stuff/") {_path=fname;}
        else if (string_copy(crstr,1,string_length("sound Stuff\"))=="sound Stuff\") {_path=fname;}
        if (_path!=novdat.FolName[_novid]+"\") {fname="";} sound_stream_sound(working_directory+_path+fname,_path+fname);}}}}
else if (string_copy(crstr,1,string_length("repeat start"))=="repeat start") {if (crline+1<lineCount) {
    if (string_copy(line[crline+1],1,string_length('repeat count '))=='repeat count ') {
        _rcon=string_digits(string_copy(line[crline+1],string_length('repeat count ')+1,string_length(line[crline+1])-string_length('repeat count ')));
            if (_rcon!="") {repCount=real(_rcon); if (crline+2<lineCount) {isRepeat=1; rLine=crline+2;}}} else {repCount=0; rLine=crline+1; isRepeat=1;}}}
else if (string_copy(crstr,1,string_length("repeat end"))=="repeat end") {if (isRepeat) {if (repCount<=0) {crline=rLine; alarm[1]=1; exit;}
    else {repCur+=1; if (repCur>=repCount) {isRepeat=0; repCur=0;} else {crline=rLine; alarm[1]=1; exit;}}}}
else if (string_copy(crstr,1,string_length("setstate"))=="setstate ") {path=string_copy(crstr,string_length("setstate ")+1,string_length(crstr)-string_length("setstate "));
    if (imp) {if (path!="") {sprState=path; for (i=0;i<acount;i+=1) {if (sprite_exists(aimage[i])) {sprite_delete(aimage[i]);}} acount=0; person_alarm0();}}}
else if (string_copy(crstr,1,string_length("nowait sync"))=="nowait sync") {nowait=1; nwsync=1;}
else if (string_copy(crstr,1,string_length("animation nowait"))=="animation nowait") {if (!nogamenolife) {if (!atelled && !anotell) {if (instance_exists(novel)) {novel.waitingForComplete=0;} atelled=1;}}}
else if (string_copy(crstr,1,string_length("nowait"))=="nowait") {nowait=1; nwsync=0;}
else if (string_copy(crstr,1,string_length("wait "))=="wait ") {hmany=string_digits(string_copy(crstr,string_length('wait ')+1,string_length(crstr)-string_length("wait ")));
    if (hmany!="") {wtime=real(hmany); waitingForComplete=1;}}
if (nowait) {if (waitingForComplete) {waitingForComplete=0; nowait=0;}}
crline+=shline;} alarm[1]=1;}}

finstr=""; for (gi=1;gi<=novdat.GenreCount[argument0];gi+=1) {
    gcur=get_genre_list(novdat.Genre[argument0,gi]); if (gi==1) {finstr+=gcur;}
    if (string_width(finstr+gcur)>700) {return finstr+" [+"+string(novdat.GenreCount[argument0]-gi+1)+"]"; break;}
        else {if (gi!=1) {finstr+=", "+gcur;}}
    if (gi>=novdat.GenreCount[argument0]) {return finstr; break;}}

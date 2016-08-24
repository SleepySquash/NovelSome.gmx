for (i=0;i<chat_totallines;i+=1){
    //if (global.chat_line[i]=='') {exit;}
    if (chat_alpha_t[i]==0) {if (chat_alpha[i]<1) {chat_alpha[i]+=0.1;}else{chat_alpha_t[i]=1;}}
    if (chat_alpha_t[i]==1) {if (chat_alpha_time[i]<130) {chat_alpha_time[i]+=1;}else{chat_alpha_t[i]=2;}}
    if (chat_alpha_t[i]==2) {if (chat_alpha[i]>0) {chat_alpha[i]-=0.1;}else{chat_alpha_t[i]=3;}}
}

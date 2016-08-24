if (argument0==0) {dialog_start();}

with(global.dialog) {
    if (argument0-1>=0) {actor[argument0]=actor[argument0-1];} else {actor[argument0] = noone;}
    if (argument0-1>=0) {speaker[argument0]=speaker[argument0-1];} else {speaker[argument0] = "";}
    if (argument0-1>=0) {is_question[argument0]=is_question[argument0-1];} else {is_question[argument0] = 0;}
    is_transfer[argument0] = argument1;
    if (argument0-1>=0) {dialog[argument0]=dialog[argument0-1];} else {dialog[argument0] = "";}
    if (argument0-1>=0) {exists[argument0]=exists[argument0-1];} else {exists[argument0] = 1;}}

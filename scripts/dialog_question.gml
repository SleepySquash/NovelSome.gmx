//ГЫГЫ ЛОЛ ЭТО СКРИПТ 228 АПАСНЫЙ ЛОЛ
if argument0=0
    dialog_start()

with(global.dialog) {
    diagcount+=1;
    speaker[argument0]="a"
    exists[argument0]=1
    choices[argument0]=0
    qutype[argument0]=0;
    dclrcnt[argument0] = 0;
    dialog[argument0] = "";
    is_transfer[argument0] = -1;
    is_question[argument0]=1
    if is_string(argument1) {choice[argument0,0]=argument1; choices[argument0]+=1}
    if is_string(argument2) {choice[argument0,1]=argument2; choices[argument0]+=1}
    if is_string(argument3) {choice[argument0,2]=argument3; choices[argument0]+=1}
    if is_string(argument4) {choice[argument0,3]=argument4; choices[argument0]+=1}
    if is_string(argument5) {choice[argument0,4]=argument5; choices[argument0]+=1}}

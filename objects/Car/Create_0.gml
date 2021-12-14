pause = true;
maxSpd = 4;
accSpd = .5;
fricSpd = .25;
turnSpd = 3;

maxReverseSpd = 3;
accReverseSpd = .3;
turnReverseSpd = 1.5;

dir = 0;

xrot = 0;
ytrans = 0;
hspd = 0;
vspd = 0;
xaxis = 0;
yaxis = 0;
len = 0;

moving = false;

delayedInputX = ds_list_create();
delayedInputY = ds_list_create();
delayedVal = 0;

cooldown = 0;
countdown = 150;
laptimer = 0;
faults =  [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
laptime = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];

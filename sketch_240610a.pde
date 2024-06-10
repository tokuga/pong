int r=0;
int g=0;
int b=0;
int ex=100;
int ey=400;
int px=700;
int py=400;
int ox=400;
int oy=450;
int P1Score=0;
int P2Score=0;
int Winner=0;
int GAMESTATE=0;
boolean WPressed=false;
boolean UPPressed=false;
boolean SPressed=false;
boolean DOWNPressed=false;
boolean travLeft=true;
boolean travDown=false;
void setup(){
  size(800,800);
  background(255,180,180);
}
void draw(){
  if(GAMESTATE==0){
    background(r,g,b);
    fill(255,255,255);
    rect(px,py,30,100);
    fill(255,255,255);
    rect(ex,ey,30,100);
      textSize(15);
      fill(255);
      text("Score",20,100);
      text(P1Score,60,100);
      text("-",67,100);
      text(P2Score,72,100);
    if(travLeft){
      ox--;
    } else {
      ox++;
    }
    if(travDown){
      oy++;
    } else {
      oy--;
    }
    if(ox==0){
         P2Score=P2Score+1;
         ox=400;
    }
    if(ox==800){
         P1Score=P1Score+1;
         ox=400; 
       }
     
    if(P1Score==10){
      GAMESTATE=1;
      Winner=1;
    }
  
    if(P2Score==10){
      GAMESTATE=1;
      Winner=2;
    }
  
    if(oy==0){
         travDown=!travDown;
    }
    if(oy==800){
         travDown=!travDown;
    }
    if(ox<0&&oy==800){
      P2Score=P2Score+1;
      ox=400;
    }
    if(ox>px-15&&ox<px+35&&oy>py&&py+100>oy){
     travLeft=true;
   while(ox>px-1){
     ox--;
   }
  }
 }
  else if(GAMESTATE==1){
      background(0,0,0);
    if(Winner==1){
          textSize(200);
          fill(216);
          text("P1 WINS!",20,450);
    }
    if(Winner==2){
          textSize(200);
          fill(216);
          text("P2 WINS!",20,450);
    }
  }
   if(ox<ex+45&&ox>ex-95&&oy>ey&&ey+100>oy){
   travLeft=false;
  while(ox<ex+31){
    ox++;
  }
}
  fill(0,255,0);
  circle(ox,oy,30);
  fill(255,255,255);
 
 if(WPressed){
   ey=ey-5;
 }
 
 if(SPressed){
   ey=ey+5;
 }
 
 if(UPPressed){
   py=py-5;
 }
 
 if(DOWNPressed){
   py=py+5;
 }
   
}
void keyPressed(){
  if(key=='w'||key=='W'){
    WPressed=true;
  }
  if(key=='s'||key=='S'){
    SPressed=true;
  }

  if(key == CODED){
  if(keyCode == UP){
    UPPressed=true;
  }
  if(keyCode == DOWN){
    DOWNPressed=true;
  }
  }
}
void keyReleased(){
  if(key=='w'||key=='W'){
    WPressed=false;
  }
  if(key=='s'||key=='S'){
    SPressed=false;
  }

  if(key == CODED){
  if(keyCode == UP){
    UPPressed=false;
  }
  if(keyCode == DOWN){
    DOWNPressed=false;
  }
}
}

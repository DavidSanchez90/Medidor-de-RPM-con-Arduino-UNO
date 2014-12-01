
int pot=0;
int MatVar=0;
int operacion=0;
byte boton=0;

void setup(){
  Serial.begin(100000);
  pinMode(7,INPUT); 
}

void loop(){
  pot=analogRead(A0);
  boton=digitalRead(7);
  
  Serial.print(boton);
  Serial.println(pot);
  
  delay(30);
 
}

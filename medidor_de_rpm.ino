const int hardwareCounterPin = 5;   // Pin de lectura de señal mediante Timer1 
int PinOut = 11;  // Pin de salida para señal que muestre 
                                    //  tiempo de lectura del Arduino UNO

const int Period = 1000;   // A Period se le asigna un valor de 1000 (milisegundos)
unsigned int count;
unsigned int rpm;
int Val=0;
int Valr=0;
void setup()
{
  Serial.begin(9600);      // Se define seria para su uso
  pinMode(PinOut,OUTPUT);  // Se define pin 13 como salida
  // Palabra reservada para el uso de timer1 del hardware Atmel
  TCCR1A=0;        // Reset Timer1/contador en registro A
}  

void loop()
{
  // Segenera la replica de como se hace conteo donde el alto representa 
  //  el conteo de pulsos
 
   
  
 
  
  // Inicio de conteo
  bitSet(TCCR1B ,CS12);    // Counter Clock source is external pin
  bitSet(TCCR1B ,CS11);    // Clock on rising edge  
  delay(Period);
  // Detener conteo
  TCCR1B = 0;              // Detiene el Timer1     
  count = TCNT1;           // Asigna el valor de Timer1 que seria el numero 
                           // de pulsos que lee el Timer1 en 1000 milisegundos 
  TCNT1 = 0;               // Reinicia el contador 
  rpm=(count)/12;      // Operacion que combierte la cantidad de pulsos leida 
     
     
                         //  a rpm
  Serial.println(rpm);    // Muestra dato de RPM en Serial
  Val= Serial.parseInt();
  Valr=Val*7.5;
  analogWrite(PinOut,Valr);
}

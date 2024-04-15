
#include <IRremote.h>
#include <MsTimer2.h>
#define RED 2
#define YELLOW 3
#define GREEN 4 
#define blue 5
#define white 6
#define RECV_PIN 11
#define PR A0
int buttonFlag = 0;
int mode = 0;
int brightness = 10;
IRrecv irrecv(RECV_PIN);
decode_results results;
void setup() { 
  Serial.begin(9600);
  pinMode(RED, OUTPUT);
  pinMode(YELLOW, OUTPUT);
  pinMode(GREEN, OUTPUT);
  pinMode(white, OUTPUT);
  pinMode(blue, OUTPUT);
  irrecv.enableIRIn();
  MsTimer2::set(10, interrupt_for_remote_control); //timer interrupt
  MsTimer2::start();
}

void loop() {
  if(analogRead(PR) > brightness){
    digitalWrite(RED, LOW);
    digitalWrite(YELLOW, LOW);
    digitalWrite(GREEN, LOW);
    digitalWrite(white, LOW);
    digitalWrite(blue, LOW);
  } 
  Serial.println(analogRead(PR));
  Serial.println(mode);
  if((analogRead(PR) < brightness) && mode == 0) digitalWrite(RED, HIGH);
  if((analogRead(PR) < brightness) && mode == 1){
    digitalWrite(RED, LOW);
    digitalWrite(YELLOW, HIGH);
  }
  if((analogRead(PR) < brightness) && mode == 2){
    digitalWrite(YELLOW, LOW);
    digitalWrite(GREEN, HIGH);
  }
  if((analogRead(PR) < brightness) && mode == 3){
    digitalWrite(GREEN, LOW);
    digitalWrite(white, HIGH);
  }
  if((analogRead(PR) < brightness) && mode == 4){
    digitalWrite(white, LOW);
    digitalWrite(blue, HIGH);
  }
  if((analogRead(PR) < brightness) && mode == 5) {
    digitalWrite(blue, LOW);
    digitalWrite(RED, HIGH);delay(500);digitalWrite(RED, LOW);
    digitalWrite(YELLOW, HIGH);delay(500);digitalWrite(YELLOW, LOW);
    digitalWrite(GREEN, HIGH);delay(500);digitalWrite(GREEN, LOW);
    digitalWrite(white, HIGH);delay(500);digitalWrite(white, LOW);
    digitalWrite(blue, HIGH);delay(500);digitalWrite(blue, LOW);
  }

}

void interrupt_for_remote_control(){
  if (irrecv.decode(&results)) {
    Serial.println("remote controller pressed!");
    if(mode == 5){
      mode = 0;
    }
  else mode++;
  irrecv.resume();
  }
}

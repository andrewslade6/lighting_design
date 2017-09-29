#include <Adafruit_NeoPixel.h>

#define DATA_PIN          6
#define NUMBER_OF_PIXELS  12

uint8_t R = 0;
uint8_t G = 0;
uint8_t B = 0;
char current;
  

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMBER_OF_PIXELS, DATA_PIN,
  NEO_RGB+NEO_KHZ800);

void RGB(uint8_t hue, uint8_t* R, uint8_t* G, uint8_t* B){

  uint8_t r,g,b;
  
  if(hue < 43){
    // to yellow
    r = 255;
    g = 6*hue;
    b = 0;
  }
  else if(hue < 86) {
    // to green
    g = 255;
    r = (255 - 6*(hue-43));
    b = 0;
  }
  else if(hue < 129) {
    // to blue green
    g = 255;
    b = 6*(hue-86);
    r = 0;
  }
  else if(hue < 171) {
    // to blue
    b = 255;
    g = (255 - 6*(hue-129));
    r = 0;
  }
  else if(hue < 213){
    // to purple
    b = 255;
    r = 6*(hue - 171);
    g = 0;
  }
  else if(hue < 255){
    // to red
    r = 255;
    b = (255 - 6*(hue-213));
    g = 0;
  }

  *R = r;
  *G = g;
  *B = b;
}



void setup() {
  // put your setup code here, to run once:
  pinMode(2, INPUT_PULLUP);
  Serial.begin(115200);
  pixels.begin();

  // set to red on reset
  RGB(0, &R ,&G, &B);
  for(int p = 0; p<NUMBER_OF_PIXELS; p++)
    pixels.setPixelColor(p, G/12, R/12, B/12);
  pixels.show();
  
}

void loop() {
  // put your main code here, to run repeatedly:
  
  if (Serial.available()) {

    current = Serial.read();
    
    if(current == 'R'){
      RGB(0, &R ,&G, &B);
      for(int p = 0; p<NUMBER_OF_PIXELS; p++)
        pixels.setPixelColor(p, G/12, R/12, B/12);
    } else if(current == 'G'){
      RGB(255/3, &R ,&G, &B);
      for(int p = 0; p<NUMBER_OF_PIXELS; p++)
        pixels.setPixelColor(p, G/12, R/12, B/12);
    } else if(current == 'B'){
      RGB(2*255/3, &R ,&G, &B);
      for(int p = 0; p<NUMBER_OF_PIXELS; p++)
        pixels.setPixelColor(p, G/12, R/12, B/12);
    } else{
      
    }

    pixels.show();

  }

}

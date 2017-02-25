//White=0
//Red=1
//Yellow=2
//Magenta=3
//Green=4
//Blue=5


import processing.video.*;
import java.awt.Color;

Capture video;
long totalR = 0;
long totalG = 0;
long totalB = 0;
long totalPixels;
float[] hsb = {0, 0, 0};
int h = 720/5;
int[][] cube = new int[6][5*5];
int[] side = new int[5*5];


void setup() {
  size(720, 720);
  String[] cameras = Capture.list();
  printArray(cameras);
  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, 1280, 720, Capture.list()[49]);

  // Start capturing the images from the camera
  video.start();
  totalPixels = h*h;
}

void draw() {
  if (video.available()) {
    loadPixels();

    video.read();
    video.loadPixels();

    //long timeOld = millis();
    for (int a=0; a<5; a++) {
      for (int b=0; b<5; b++) {
        //new Kolor().start();
        totalR = 0;
        totalG = 0;
        totalB = 0;
        for (int j = a*h; j < (a+1)*h; j ++) {
          for (int i = 280+(h*b); i < 280+(h*(b+1)); i ++) {
            int pixelColor = video.pixels[j*video.width + i];
            totalR += (pixelColor >> 16) & 0xff;
            totalG += (pixelColor >> 8) & 0xff;
            totalB += pixelColor & 0xff;
            pixels[j*width+i-280] = color((pixelColor >> 16) & 0xff, (pixelColor >> 8) & 0xff, pixelColor & 0xff);
          }
        }
        Color.RGBtoHSB((int)(totalR/totalPixels), (int)(totalG/totalPixels), (int)(totalB/totalPixels), hsb);
        side[(a*5)+b] = ClassifyInt(hsb);
        //if (b==4)
        //  println(Classify(hsb));
        //else
        //  print(Classify(hsb)+" | ");
      }
    }
    //Color.RGBtoHSB((int)(totalR/totalPixels), (int)(totalG/totalPixels), (int)(totalB/totalPixels), hsb);
    //println(millis()-timeOld);
    //println("");

    background(totalR/totalPixels, totalG/totalPixels, totalB/totalPixels);
  }
  updatePixels();
  //image(video, 0, 0, width, height);
}

public String Classify(float[] hsb)
{
  float hue = hsb[0];
  float sat = hsb[1];
  float lgt = hsb[2];

  //if (lgt < 0.2)  return "Bl";
  //if (lgt > 0.8)  return "Wh";

  if (sat < 0.3) return "W";

  if (hue < 0.05)   return "R";
  if (hue < 0.2)   return "Y";
  if (hue < 0.55)  return "G";
  if (hue < 0.7)  return "B";
  if (hue < 0.97)  return "M";
  if (hue < 1)  return "R";
  else return "FELA";
}

public int ClassifyInt(float[] hsb)
{
  float hue = hsb[0];
  float sat = hsb[1];
  float lgt = hsb[2];

  //if (lgt < 0.2)  return "Bl";
  //if (lgt > 0.8)  return "Wh";

  if (sat < 0.3) return 0;

  if (hue < 0.05)   return 1;
  if (hue < 0.2)   return 2;
  if (hue < 0.55)  return 4;
  if (hue < 0.7)  return 5;
  if (hue < 0.97)  return 3;
  if (hue < 1)  return 2;
  else return -1;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      cube[side[13]] = side;
      for (int a=0; a<5; a++) {
        for (int b=0; b<5; b++) {
          if (b==4)
            println(cube[side[13]][(a*5)+b]);
          else
            print(cube[side[13]][(a*5)+b]+" | ");
        }
      }
    } else if (keyCode == DOWN) {
      for (int i=0; i<6; i++) {
        for (int a=0; a<5; a++) {
          for (int b=0; b<5; b++) {
            if (b==4)
              println(cube[i][a*b]);
            else
              print(cube[i][a*b]+" | ");
          }
        }
        println(i);
      }
    }
  } else {
  }
}

class Kolor extends Thread {

  public void run() {
    for (int j = 0; j < video.height; j ++) {
      for (int i = 80; i < video.width-80; i ++) {
        int pixelColor = video.pixels[j*video.width + i];

        totalR += (pixelColor >> 16) & 0xff;
        totalG += (pixelColor >> 8) & 0xff;
        totalB += pixelColor & 0xff;
      }
    }
  }
}
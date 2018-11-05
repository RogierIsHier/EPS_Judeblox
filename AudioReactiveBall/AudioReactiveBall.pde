/**
  * This sketch demonstrates how to play a file with Minim using an AudioPlayer. <br />
  * It's also a good example of how to draw the waveform of the audio. Full documentation 
  * for AudioPlayer can be found at http://code.compartmental.net/minim/audioplayer_class_audioplayer.html
  * <p>
  * For more information about Minim and additional features, 
  * visit http://code.compartmental.net/minim/
  */

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

void setup()
{
  size(512, 200, P3D);
  
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("Safe.mp3");
  fft = new FFT(player.bufferSize(), player.sampleRate());
  ellipseMode(CENTER);
}

void draw()
{

  background(0);
  stroke(255);
player.play();
int numFrames = player.mix.size();
float amplitute = player.mix.level();

fft.forward(player.mix);
for(int i = 0; i<fft.specSize(); i++){
  line(i, height, i, height - fft.getBand(i)*4);
}

for(int i = 0; i<numFrames; i++){
ellipse(width/2,height/2,amplitute*500,amplitute*500);
}

}

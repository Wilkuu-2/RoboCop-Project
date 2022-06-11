import processing.video.*;
 
class Webcam {
  Capture cam;
 
 
 
  Webcam(PApplet applet) {
    String[] cameras = Capture.list();
 
    if (cameras.length == 0) {
      println("There are no cameras available for capture.");
      exit();
    } else {
      println("Available cameras:");
      for (int i = 0; i < cameras.length; i++) {
        println(cameras[i]);
      }
 
      // The camera can be initialized directly using an
      // element from the array returned by list():
      cam = new Capture(applet, cameras[0]);
      cam.start();
    }
  }
 
  void capture() {
    if (cam.available() == true) {
      cam.read();
    }
  }
}

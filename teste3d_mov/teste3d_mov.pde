PShape prensa;
float rotationX = 0;
float rotationY = 0;
float sensitivity = 0.01;
float scaleValue = 1.0;  // Initial scale value
float minScale = 1;   // Minimum scale limit
float maxScale = 2;   // Maximum scale limit
float wheelDelta = 0;    // Variable to store mouse wheel delta


void setup() {
  size(512, 512, P3D);
  prensa = loadShape("prensa.obj");
}

void draw() {
  background(0x782602);
  lightFalloff(1, 0, 0);
  lightSpecular(0, 0, 0);
  ambientLight(128, 128, 128);
  directionalLight(128, 128, 128, 0, 0, -1);
  camera(0, 0, height * .86602,
    0, 0, 0,
    0, 1, 0);


  rotationY += sensitivity * (mouseX - pmouseX);

  // Adjust scale based on mouse wheel
  float delta = 0.5 * sensitivity * -1 * wheelDelta;  // Use the stored wheelDelta
  scaleValue = constrain(scaleValue + delta, minScale, maxScale); // Use constrain to limit scale
// Adjust rotation around the X-axis to only show the "top"
  rotationX = constrain(rotationX + sensitivity * (mouseY - pmouseY), -HALF_PI, HALF_PI);
  
  rotateX(rotationX);
  
  rotateY(rotationY);
  scale(scaleValue);

  // Draw the shape
  shape(prensa);
}

void mouseWheel(MouseEvent event) {
  wheelDelta = event.getCount();
}

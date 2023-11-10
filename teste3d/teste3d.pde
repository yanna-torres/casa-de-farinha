PShape pieta;

void setup() {
  size(512, 512, P3D);
  pieta = loadShape("prensa.obj");
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
  shape(pieta);
  pieta.rotateY(.01);
}

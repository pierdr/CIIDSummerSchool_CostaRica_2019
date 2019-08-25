GH gh;

void setup() {
  size(1024,512,P2D);
  gh = new GH("airports.csv",6,7);
}

void draw(){
  background(0);
  image(gh.getImage(),0,0,width,height);
}

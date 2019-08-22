GH gh;

void setup() {
  size(1024,512,P2D);
  gh = new GH("cities.csv",2,3);
}

void draw(){
  background(0);
  image(gh.getImage(),0,0,width,height);
}

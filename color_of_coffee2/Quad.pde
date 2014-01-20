class Quad {
  float rad;
  float angle;
  float dec;

  //particle constructor
  Quad(float angle_) {
    angle = angle_;
    dec = 200 * 0.00004; 

  }

  void display () {
    //for GIF POP version only
    pushMatrix();
    scale(2.0, 2.0);
    
    pushMatrix();
    rotate(radians(90));
    
    fill(#C0FFEE, 45);
    
    quad(20*sin(angle), sin(angle), 180*cos(angle), sin(angle), 
    120*cos(angle), 100*sin(angle)+100, sin(angle), abs(30*sin(angle)));
    
    pushMatrix();
    scale(1.0, -1.0);
    quad(20*sin(angle), sin(angle), 180*cos(angle), sin(angle), 
    120*cos(angle), (100*sin(angle)+100), sin(angle), abs(30*sin(angle)));
    popMatrix();
    
    angle+=dec;
    popMatrix();
    
    popMatrix();
  }
}



boolean stop = false;
int direction[] = {-3, 0, 3};
int direction_size = 3;

void setup() {
  size(600, 600);
  frameRate(24);
}

// triangle position and movment delta x and y
int tri_x1 = 125;
int tri_y1 = 205;
int tri_x2 = 185; 
int tri_y2 = 105;
int tri_x3 = 245;
int tri_y3 = 205;
int t_movement_of_x = 4;
int t_movement_of_y = 4;

// ufo position and movment delta x and y
int circ_x = 400;
int circ_y = 300;
int size = 90;
int elli_width = 180;
int elli_height = 40;
int c_movement_of_x = 4;
int c_movement_of_y = 4;

// star position and movment delta x and y
int star_x1 = 80;
int star_y1 = 30;
int star_x2 = 94;
int star_y2 = 60;
int star_x3 = 127;
int star_y3 = 65;
int star_x4 = 103;
int star_y4 = 87;
int star_x5 = 109;
int star_y5 = 120;
int star_x6 = 80;
int star_y6 = 105;
int star_x7 = 51;
int star_y7 = 120;
int star_x8 = 57;
int star_y8 = 87;
int star_x9 = 33;
int star_y9 = 65;
int star_x10 = 66;
int star_y10 = 60;
int s_movement_of_x = 4;
int s_movement_of_y = 4;

int share_color = #c4c2bf;

void draw() {
  background(#000000);
  drawTriangle();
  drawUFO();
  drawStar();
  noStroke();
  fill(share_color);
}

void keyTyped() {
  if (key == 'R' || key == 'r') {
    share_color = #a77979; // color red
  }
  
  if (key == 'G' || key == 'g' ) {
    share_color = #9c9e89; // color green 
  } 
  
  if (key == 'B' || key == 'b') {
    share_color = #99a4bc; // color blue
  }
  
  if (key == 'W' || key == 'w') {
    share_color = #f5f5f4; // color wheit
  }
  
  if (key == 'D' || key == 'd') {
    share_color = #c4c2bf; // defualt color -> gray
  }
  
  if (key == ' ') { // stop the movment
    stop = !stop;
  }
}

// function for stop the movment
void mousePressed() {
  if (mouseButton == LEFT || mouseButton == RIGHT) {
    stop = !stop;
  } 
}

// function to draw the triangle and change the postition for next frame
void drawTriangle() {
  triangle(tri_x1, tri_y1, tri_x2, tri_y2, tri_x3, tri_y3);
  
  if (!stop) { 
    tri_x1 = tri_x1 + t_movement_of_x;
    tri_y1 = tri_y1 + t_movement_of_y;
    tri_x2 = tri_x2 + t_movement_of_x;
    tri_y2 = tri_y2 + t_movement_of_y;
    tri_x3 = tri_x3 + t_movement_of_x;
    tri_y3 = tri_y3 + t_movement_of_y;
    
    if (tri_x1 > width || tri_x2 > width || tri_x3 > width) {
      t_movement_of_x = -1 * t_movement_of_x;
    }
    
    if (tri_x1 < 0 || tri_x2 < 0 || tri_x3 < 0) {
     t_movement_of_x = -1 * t_movement_of_x;
    }
    
    if (tri_y1 > height || tri_y2 > height || tri_y3 > height) {
      t_movement_of_y = -1 * t_movement_of_y;
    }
    
    if (tri_y1 < 0 || tri_y2 < 0 || tri_y3 < 0) {
      t_movement_of_y = -1 * t_movement_of_y;
    }
    
  } else {
    // move random dir after the stop
    int temp = (int)random(direction_size);
    t_movement_of_x = direction[temp];
   
    temp = (int)random(direction_size);
    t_movement_of_y = direction[temp];
    
    while (t_movement_of_x == t_movement_of_y) {
      temp = (int)random(direction_size);
      t_movement_of_x = direction[temp];
    }
  }
}

// function to draw the ufo and change the postition for next frame
void drawUFO() {
  ellipse(circ_x, circ_y, size, size);
  ellipse(circ_x, circ_y + 5, elli_width, elli_height);
  
  if (!stop) {
    circ_x = circ_x + c_movement_of_x;
    circ_y = circ_y + c_movement_of_y;
    
    if ( circ_x + (elli_width / 2) > width || circ_x < (elli_width / 2)) {
      c_movement_of_x = -1 * c_movement_of_x;
    }
    
    if ( circ_y + (size / 2) > height || circ_y < (size / 2)) {
      c_movement_of_y = -1 * c_movement_of_y;
    }
    
  } else {
    // move random dir after the stop
    int temp = (int)random(direction_size);
    c_movement_of_x = direction[temp];
  
    temp = (int)random(direction_size);
    c_movement_of_y = direction[temp];

    while(c_movement_of_x == c_movement_of_y) {
      temp = (int)random(direction_size);
      c_movement_of_x = direction[temp];
    }
  }
}

// function to draw the star and change the postition for next frame
void drawStar() {
  beginShape();
  vertex(star_x1, star_y1);
  vertex(star_x2, star_y2);
  vertex(star_x3, star_y3);
  vertex(star_x4, star_y4);
  vertex(star_x5, star_y5);
  vertex(star_x6, star_y6);
  vertex(star_x7, star_y7);
  vertex(star_x8, star_y8);
  vertex(star_x9, star_y9);
  vertex(star_x10, star_y10);
  endShape(CLOSE);
  
  if (!stop) {
    star_x1 += s_movement_of_x;
    star_x2 += s_movement_of_x;
    star_x3 += s_movement_of_x;
    star_x4 += s_movement_of_x;
    star_x5 += s_movement_of_x;
    star_x6 += s_movement_of_x;
    star_x7 += s_movement_of_x;
    star_x8 += s_movement_of_x;
    star_x9 += s_movement_of_x;
    star_x10 += s_movement_of_x;
    
    star_y1 += s_movement_of_y;
    star_y2 += s_movement_of_y;
    star_y3 += s_movement_of_y;
    star_y4 += s_movement_of_y;
    star_y5 += s_movement_of_y;
    star_y6 += s_movement_of_y;
    star_y7 += s_movement_of_y;
    star_y8 += s_movement_of_y;
    star_y9 += s_movement_of_y;
    star_y10 += s_movement_of_y;
    
    if (star_x3 > width || star_x9 < 0) {
       s_movement_of_x *= -1;
    }
    
    if (star_y1 < 0 || star_y5 > height || star_y7 > height) {
       s_movement_of_y *= -1;
    }
  
  } else {
    // move random dir after the stop
    int temp = (int)random(direction_size);
    s_movement_of_x = direction[temp];
    
    temp = (int)random(direction_size);
    s_movement_of_y = direction[temp];

    while(s_movement_of_x == s_movement_of_y) {
      temp = (int)random(direction_size);
      s_movement_of_x = direction[temp];
    }
  }
}

PImage miImagen;

void setup() {
  size(800, 400);
  miImagen = loadImage("ladamadelarmino.jpg");
}

void draw() {
  background(255);
  image(miImagen, 0, 0, 400, 400);

  noStroke();
  fill(182, 144, 98); 
  ellipse(605, 95, 100, 120);

  noStroke();
  fill(182, 144, 98); 
  beginShape();
    vertex(567, 135); 
    vertex(566, 168);
    
    bezierVertex(584, 179, 615, 171, 622, 159);
    vertex(621, 151); // Cierre del cuello
  endShape(CLOSE);
  fill(73, 98, 94); 
  beginShape();
    vertex(566, 168); 
    bezierVertex(502, 208, 438, 286, 400, 400); 
    vertex(667, 394); 
    bezierVertex(732, 297, 717, 231, 622, 161); 
   
    bezierVertex(615, 171, 584, 179, 566, 168); 
  endShape(CLOSE);

  
  noFill();
  stroke(0);
  
  
  beginShape();
    vertex(562, 64);
    vertex(648, 64);
  endShape();


  
  beginShape();
    vertex(616, 90);
    vertex(618, 121);
    vertex(606, 121);
  endShape();

  
  beginShape();
    vertex(597, 137);
    vertex(621, 137);
  endShape();
 
}

PImage Naruto1, Naruto2, Naruto3, Naruto4, Naruto5;
PFont miFuente;
int pantalla=1;
boolean inicio= false;

String textoPantalla1= "Naruto cuenta la historia de Naruto Uzumaki,\nun joven ninja rechazado por su aldea porque tiene\nencerrado dentro de él al Zorro de Nueve Colas.";
String textoPantalla2= "A pesar de las dificultades, Naruto sueña con\nconvertirse en Hokage, el líder más fuerte y \nrespetado  de la Aldea de la Hoja.";
String textoPantalla3= "Durante su entrenamiento, forma un equipo junto\na Sasuke Uchiha y Sakura Haruno, mientras aprende nuevas técnicas y enfrenta peligrosos enemigos.";
String textoPantalla4= "Con el tiempo, Naruto demuestra su valentía y \nlogra ganarse la confianza y amistad de las personas que antes lo rechazaban.";
String textoPantalla5= "La historia combina acción, amistad y superación, mostrando cómo Naruto lucha por proteger a sus amigos y cumplir su sueño.";

int tiempoInicio = 0;


float textoX1=-600; // posicion texto pantall 1
float textoY2=500; // posicion texto pantalla 2
float velocidadX1 =3;
float velocidadY2 =1;
float textoX3 = 640; //posicion texto pantalla 3
float textoY4 = 480; //posicion texto pantalla 4
float opacidad5 = 0;
float velocidadX3 = 3;
float velocidadY4 = 2;
float velocidadOpacidad = 2;

int botonInicioX= 480; // ubicacion boton inicio
int botonInicioY= 400;
int botonInicioAncho= 140;
int botonInicioAlto= 40;

int botonReinicioX = 480; // ubicacion botón reinicio
int botonReinicioY = 400;
int botonReinicioAncho = 140;
int botonReinicioAlto = 40;

void setup () {
  size (640, 480);
  miFuente= loadFont ("MyanmarText-Bold-25.vlw");
  Naruto1 =loadImage ("naruto1.jpg");
  Naruto2=loadImage ("naruto2.jpg");
  Naruto3= loadImage ("naruto3.jpg");
  Naruto4= loadImage ("naruto4.jpeg");
  Naruto5 = loadImage ("naruto5.jpeg");

  tiempoInicio = millis();
}
void draw () {
    // pantalla empezar
  image (Naruto1, 0, 0, 640, 480);

  if (inicio == false) {
    textAlign(CENTER, CENTER);
    fill(255, 100, 0);
    rect(botonInicioX, botonInicioY, botonInicioAncho, botonInicioAlto, 10);

    fill(255);
    textSize(25);
    text("Empezar", botonInicioX + botonInicioAncho/2, botonInicioY + botonInicioAlto/2);

    return;
  }

  textAlign(LEFT, BASELINE);

  int duracionPantalla = 10000;
  pantalla = ((millis() - tiempoInicio) / duracionPantalla) + 1;
  if (pantalla > 5) pantalla = 5;

  

  //pantalla 1
  if (pantalla ==1) {
    image (Naruto1, 0, 0, 640, 480);
    fill (255);

    textSize (25);
    textFont (miFuente, 25);
    if (textoX1 < 20) {
      textoX1 += velocidadX1;
    } else {
      textoX1 = 20;
    }
    text (textoPantalla1, textoX1, 240);
  }
  //pantalla 2
  if (pantalla ==2) {
    image (Naruto2, 0, 0, 640, 480);
    fill(255);
    textFont (miFuente, 25);
    textSize (25);
    textoY2 -= velocidadY2;
    text (textoPantalla2, 20, textoY2);
    if (textoY2 <-200) {
      textoY2 = height;
    }
  }
  //pantalla 3
  if (pantalla ==3) {
    image (Naruto3, 0, 0, 640, 480);
    fill (255);
    textFont (miFuente, 25);
    textSize(25);
    if (textoX3 > 20)
    {
      textoX3 -= velocidadX3;
    }
    text (textoPantalla3, textoX3, 240, 600, 160);
  }
  //pantalla 4
  if (pantalla == 4) {
    image(Naruto4, 0, 0, 640, 480);
    fill(255);
    textFont(miFuente, 25);
    textSize(25);
    textoY4 -= velocidadY4;
    if (textoY4 < -160) {
      textoY4 = height;
    }

    text(textoPantalla4, 20, textoY4, 600, 160);
  }
  //pantall 5
  if (pantalla == 5) {
    image(Naruto5, 0, 0, 640, 480);

    if (opacidad5 < 255) {
      opacidad5 += velocidadOpacidad;
    }

    fill(255, opacidad5);
    textFont(miFuente, 25);
    textSize(25);
    text(textoPantalla5, 20, 240, 600, 160);

    // botón reinicio
    if (opacidad5 >= 255) {
      fill(200, 50, 50);
      rect(botonReinicioX, botonReinicioY, botonReinicioAncho, botonReinicioAlto, 10);
      fill(255);
      textSize(25);
      textAlign(CENTER, CENTER);
      text("Reiniciar", botonReinicioX + botonReinicioAncho/2, botonReinicioY + botonReinicioAlto/2);
     
    }
  }
}


void mouseClicked() {

  if (inicio == false && mouseX >= botonInicioX && mouseX <= botonInicioX + botonInicioAncho && mouseY >= botonInicioY && mouseY <= botonInicioY + botonInicioAlto) {
    inicio = true;
    tiempoInicio = millis();
  }
}


void mousePressed() {
  
  if (pantalla == 5 && opacidad5 >= 255) {
    if (mouseX >= botonReinicioX && mouseX <= botonReinicioX + botonReinicioAncho && mouseY >= botonReinicioY && mouseY <= botonReinicioY + botonReinicioAlto) {
      
      reiniciarPresentacion(); 
      
    }
  }
}

void reiniciarPresentacion() {
  inicio = false; 
  tiempoInicio = millis();
  pantalla = 1;
  textoX1 = -600;
  textoY2 = 500;
  textoX3 = 640;
  textoY4 = 480;
  opacidad5 = 0;
}

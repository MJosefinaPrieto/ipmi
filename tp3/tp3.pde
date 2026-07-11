//https://youtu.be/Uq_uV-rhWjA
PImage miImagen;

float anguloCuad = 0; 
float ancho = 30;
float alto= 50;

boolean ordenado = false; 
boolean girando = false; 

void setup() {
  size(800, 400);
  miImagen = loadImage("14.jpg");
}

void draw() {
  background(255);
  image(miImagen, 0, 0, 400, 400);
  // verifico Si la variabñe girando es verdadera  le aumenta 0.05 radianes a la variable anguloCuad, los cuadrados van rotando.
  if (girando) {
    anguloCuad += 0.05;
  }
  stroke(150);
  strokeWeight(2);

  //ciclo for anidado para dibujar las filas ycolumnas
  for (int fila = 0; fila < 8; fila++) {
    for (int columna = 0; columna < 15; columna++) {
      
      float desplazamientoX = 0;
      if (!ordenado && fila % 2 !=0) {
        desplazamientoX = ancho / 2;
      }

      // se dibuja la grilla en la mitad derecha de la pantalla  
      float x = 400 + desplazamientoX + columna * ancho;
      float y = fila * alto;
 
      color colorCuad;
 
      // Colores del tablero
      if ((fila + columna) % 2 != 0) { 
        colorCuad = color(0); // si es impar negro
      } else {
        colorCuad = color(255); // si es par blanco 
      }

      // calcula cuanto crece el cuadrado segun que tan cerca este del mouse
      float tamaño = calcularTam(x, y, ancho, alto);

      // Dibuja el cuadrado (llamado a funcion) 
      dibujarCuadrados(x, y, ancho, alto, colorCuad, tamaño);
    }
  }
}
// interacciones mouse 
void mouseClicked () {
  if (mouseButton == LEFT) {
    ordenado = !ordenado;
  } else if (mouseButton== RIGHT) {
    girando = !girando;
  }
}
// boton reinicio
void keyPressed() {
  if (key == 'r' || key == 'R') {
    anguloCuad = 0;
    ordenado = false;
    girando = false;
  }
}

 // https://youtu.be/1zB7dFDEc7Q 
  PImage miImagen;
 
  
  boolean movimientoFilas = true; // controla si las filas pueden moverse está declarada como true, las filas se pueden moverse ni bien arranca el programa
  boolean alternarColores = false; // controla el cambio de los colores, es false porque al iniciar estan en blanco y negro
  
  color cuadradoBlanco;
  color cuadradoNegro;
  
  float[] desplazamientos = new float[8]; // un arreglo que hice para guardar cuanto se movio cada fila, son 8 filas

  
  void setup() {
    size(800, 400);
  
    miImagen = loadImage("14.jpg");
  
    cuadradoBlanco = color(255);
    cuadradoNegro = color(0);
  
    for (int i = 0; i < 8; i++) { // es para que al iniciar el programa o reiniciarlo las filas vuelvan a su lugar. 
      desplazamientos[i] = 0; 
    }
  }
  
  void draw() {
    background(255);
    image(miImagen, 0, 0, 400, 400);
  
    stroke(150);
    strokeWeight(2);
    
    // hace que los colores se vayan alternando automaticamente cada cierto tiempo (30 frames) despues de hacer clic
    
    boolean invertido = (frameCount / 30) % 2 == 0;
  
    //ciclo for para dibujar las filas
    for (int fila = 0; fila < 8; fila++) {
      
      // estructura sCondicional para mover las filas cuando pasa el mouse por encima (detecta por que fila pasa el mouse)
  
      if (movimientoFilas && mouseY > fila * 50 && mouseY < (fila + 1) * 50 && mouseX > 400) {
  
        desplazamientos[fila] = calcularMovimientoX(mouseX); // mouseX entra en la funcion como posicionMouse
      }
  
      // ciclo for  para dibujar las columnas
      for (int columna = 0; columna < 15; columna++) {
        color colorActual;
        
  // condicional para los colores esta condicion se cumple cuand arranca el programa (los cuadrados estan en b y n)
        if (!alternarColores) { // se ejecuta cuando es falsa
  
          if ((fila + columna) % 2 == 0) { //suma el numero de filas y el de columnas para saber si es par o impar
          // si es par es blanco
            colorActual = cuadradoBlanco;
          } else {
            // si es impar es negro
            colorActual = cuadradoNegro;
          }
  
        } else {
          // los colores que aparecen al hacer clic
  
          if ((fila + columna) % 2 == 0) {
  
            if (!invertido) {
              colorActual = color(180, 80, 255); //color violeta
            } else {
              colorActual = color(255, 230, 0); // color amarillo
            }
  
          } else {
  
            if (!invertido) {
              colorActual = color(255, 230, 0); // color amarillo
            } else {
              colorActual = color(180, 80, 255); // color violeta
            }
          }
        }
  // funcion que hace que la grilla se vea desfaasada
        float desplazamiento = 0; //varibale la inicializo en 0, cuanto se va a correr horizontalmente cada fila
  //condicion pregunta si la fila es impar
        if (fila % 2 == 1) {
          // si la fila es impar se le suma 15 (el ancho es de 30 pixeles)
          desplazamiento = 15;
        }
        // hace que el tablero se dibuje en la mitad derecha de la pantalla
  
        float x = 400 + columna * 30 + desplazamiento + desplazamientos[fila];
  
        if (x < 400) {
          x = 400;
        }
  
        dibujarCuadrado(x, fila * 50, colorActual); // ejecuta la funcion propia
      }
    }
  }
  // Funciones propias
   
  // funcion que retorna valor
  
  float calcularMovimientoX (float posicionMouse) { //recibe un valor de la ubicacion horizontal del mouse. devuelve un valor de decimal entre 0 y 50
    
    return map(posicionMouse, 400, width, 0, 50); 
  }
  
  // funcion que NO retorna valor
  
  void dibujarCuadrado(float x, float y, color c) { // recibe 3 parametros dibujar cada cuadrado de la grilla
  
    pushMatrix();
    translate(x + 15, y + 25); // la rotacion se hace desde el centro del cuadrado
  
    if (mousePressed) {
  
      float distancia = dist(mouseX, mouseY, x + 15, y + 25); // calcula la distancia del mouse
  
      if (distancia < 100) { // esto es para que no se muevan todos los cuadrados, solo los que estan a 100 px de distancia
  
        float angulo = map( distancia,0, 100, radians (25),0); //calcula el angulo de rotacion
        
        rotate(angulo); //rota los cuadrados
      }
    }
  
    fill(c);
    rectMode(CENTER);
    rect(0, 0, 30, 50);
    popMatrix();
    rectMode(CORNER);
  }
  
  void mouseClicked() {
    alternarColores = true;
  }
  
  void keyPressed() {
  
    if (key == 'r' || key == 'R') {
  
      alternarColores = false;
      movimientoFilas = true;
      
      cuadradoBlanco = color(255);
      cuadradoNegro = color(0);
  
      for (int i = 0; i < 8; i++) {
        desplazamientos[i] = 0;
      }
    }
  }

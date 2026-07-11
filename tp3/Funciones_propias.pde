// funcion propia que retorna valor: calcula la distancia entre el mouse y el centro de los cuadrados. Devuelve el tamño que va a tener el cuad
float calcularTam(float x, float y, float ancho, float alto) { // recibe cuatro parametros
 // calcula el centro del cuadrado 
  float centroX = x + ancho / 2;  
  float centroY = y + alto / 2;
// calcula la dist entre el mouse y el centro
  float distancia = dist(mouseX, mouseY, centroX, centroY);
  // convertir un valor de un rango a otro (cuando el mouse esta encima, el cuad mide 100) 
  float tamaño = map(distancia, 0, 20, 100, 0);

  if (tamaño < 0) { // con este if limito a que map me de un valor negativo
    tamaño = 0;
  }

  return tamaño; // me devuelve el tamño del cuadrado segun la distancia 
}
// no retorna valor recibe datos calculados, dibuja los cuadrados
void dibujarCuadrados(float x, float y, float ancho, float alto, color colorCuad, float tamaño) {
  pushMatrix();
  translate(x + ancho/2, y + alto/2); // origen de la rotacion de los cuad (centro)
  rotate(anguloCuad);

  fill(colorCuad);
  rectMode(CENTER);

  rect(0, 0, ancho + tamaño, alto + tamaño); // dibujo el cuad con el tamaño dependiendo de la cercanua del mouse

  popMatrix();
  rectMode(CORNER);
}

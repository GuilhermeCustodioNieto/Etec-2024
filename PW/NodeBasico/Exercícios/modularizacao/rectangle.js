export function area(largura, altura) {
  return largura * altura;
}

export function perimetro(largura, altura) {
  return 2 * (largura + altura);
}

export function diagonal(largura, altura) {
  return Math.sqrt(largura * largura + altura + altura);
}

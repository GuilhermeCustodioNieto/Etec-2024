function area(largura, altura) {
  return largura * altura;
}

function perimetro(largura, altura) {
  return 2 * (largura + altura);
}

function diagonal(largura, altura) {
  return Math.sqrt(largura * largura + altura + altura);
}

module.exports = {
  area: area,
  perimetro: perimetro,
  diagonal: diagonal,
};

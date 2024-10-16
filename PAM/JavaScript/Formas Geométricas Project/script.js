var lados = prompt("Insira a quantidade de Lados:");

function Formas(lados) {
  const novaDiv = document.createElement("div");
  if (lados == 3) {
    var resultado =
      "A forma geometrica é o Triangulo" +
      " Formula do Perimetro: p = l+l+l" +
      " Formula da Área: A = b*h/2";
    novaDiv.appendChild(conteudo);
    var currentDiv = document.getElementById("div1");
    document.body.insertBefore(novaDiv, currentDiv);
  } else if (lados == 4) {
    console.log(
      "A forma geometrica é o Quadrado" +
        " Formula do Perimetro: p = b*h" +
        " Formula da Área: A = b*b"
    );
  } else if (lados == 5) {
    console.log(
      "A forma geometrica é o Pentágono" +
        " Formula do Perimetro: p = a*5" +
        " Formula da Área: A =1/4 raiz de 5*5+2*raiz de 5 * a*2"
    );
  } else if (lados == 6) {
    console.log(
      "A forma geometrica é o Hexágono" +
        " Formula do Perimetro: p = a*6" +
        " Formula da Área: A =3*1,2/2*a*2"
    );
  } else if (lados == 7) {
    console.log(
      "A forma geometrica é o Heptágono" +
        " Formula do Perimetro: p = a*7" +
        " Formula da Área: A =7/4a*2cot* pi/7"
    );
  } else if (lados == 8) {
    console.log(
      "A forma geometrica é o Octógono" +
        " Formula do Perimetro: p = a*8" +
        " Formula da Área: A =2*1+raiz de 2*a*2"
    );
  } else if (lados == 9) {
    console.log(
      "A forma geometrica é o nonaágono" +
        " Formula do Perimetro: p = a*9" +
        " Formula da Área: A =9/4a>2cot* pi/9"
    );
  } else if (lados == 10) {
    console.log(
      "A forma geometrica é o Decágono" +
        " Formula do Perimetro: p = a*10" +
        " Formula da Área: A = 5/2a>2cot* pi/10"
    );
  }
}

function criarElemento(resultado) {
  var div = document.createElement("div");
  var counteudo = document.createTextNode(resultado);
  div.appendChild(conteudo);
  var currentDiv = document.getElementById("div1");
  document.body.insertBefore(novaDiv, currentDiv);
}

console.log(Formas(lados));

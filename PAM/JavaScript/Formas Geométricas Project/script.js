function verificaForma(lados) {
    if (lados == 3) {
      return (
        "A forma geometrica é o Triangulo\n" +
        " Formula do Perimetro: p = l+l+l\n" +
        " Formula da Área: A = b*h/2"
        + "<img src=\"./assets/triangulo.png\" class=\"\imgs\" alt=\"\">"
      );
    } else if (lados == 4) {
      return (
        "A forma geometrica é o Quadrado\n" +
        " Formula do Perimetro: p = b*h\n" +
        " Formula da Área: A = b*b\n"
        + "<img src=\"./assets/quadrado.png\" class=\"\imgs\" alt=\"\">"
      );
    } else if (lados == 5) {
      return (
        "A forma geometrica é o Pentágono\n" +
        " Formula do Perimetro: p = a*5\n" +
        " Formula da Área: A = 1/4 raiz de 5*5+2*raiz de 5 * a*2\n"
        + "<img src=\"./assets/pentagono.png\" class=\"\imgs\" alt=\"\">"
      );
    } else if (lados == 6) {
      return (
        "A forma geometrica é o Hexágono\n" +
        " Formula do Perimetro: p = a*6\n" +
        " Formula da Área: A = 3*1,2/2*a*2\n"
        + "<img src=\"./assets/hexagono.png\" class=\"\imgs\" alt=\"\">"
      );
    } else if (lados == 7) {
      return (
        "A forma geometrica é o Heptágono\n" +
        " Formula do Perimetro: p = a*7\n" +
        " Formula da Área: A = 7/4a*2cot* pi/7\n"
        + "<img src=\"./assets/heptagono.png\" class=\"\imgs\" alt=\"\">"
      );
    } else if (lados == 8) {
      return (
        "A forma geometrica é o Octagono\n" +
        " Formula do Perimetro: p = a*8\n" +
        " Formula da Área: A = 2*1+raiz de 2*a*2\n"
        + "<img src=\"./assets/octagono.png\" class=\"\imgs\" alt=\"\">"
      );
    } else if (lados == 9) {
      return (
        "A forma geometrica é o Nonaágono\n" +
        " Formula do Perimetro: p = a*9\n" +
        " Formula da Área: A = 9/4a*2cot* pi/9\n"
        + "<img src=\"./assets/nonagono.png\" class=\"\imgs\" alt=\"\">"
      );
    } else if (lados == 10) {
      return (
        "A forma geometrica é o Decágono\n" +
        " Formula do Perimetro: p = a*10\n" +
        " Formula da Área: A = 5/2a*2cot* pi/10\n"
        + "<img src=\"./assets/decagono.png\" class=\"\imgs\" alt=\"\">"
      );
    } else {
      return "O número de lados não se enquadra nos números aceitos\nApenas de 3 a 10";
    }
  }
  
  function mostraLados(lados) {
    console.log("chamou");
  
    let divForma = document.querySelector("#dados");
  
    const dados = verificaForma(lados);
  
    divForma.innerHTML = dados.replace(/\n/g, "<br>");
  }
  
  const enviarDadosBtn = document
    .querySelector("#dados-form")
    .addEventListener("submit", (event) => {
      event.preventDefault();
      const lados = document.querySelector("#lados").value;
      mostraLados(lados);
    });
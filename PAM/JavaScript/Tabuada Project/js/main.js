function pegarTabuada(numTabuada, limite) {
  let final = [];

  for (let i = 0; i <= limite; i++) {
    final.push(`${numTabuada} x ${i} = ${numTabuada * i}`);
  }

  return final;
}

function alteraHtml(tabuada) {
  let lista = document.querySelector(".card-list");

  html = "";

  html += '<div class="card swiper-slide"><ul class="tabuada">';

  tabuada.forEach((i) => {
    html += `<li>${i}</li>`;
  });

  html += "</ul>";
  html += "</div>";

  lista.innerHTML += html;
}

for (let i = 1; i <= 10; i++) {
  const tabuada = pegarTabuada(i, 10);
  alteraHtml(tabuada);
}

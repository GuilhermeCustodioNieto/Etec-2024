import http from "http";
import url from "url";

function setup(req, res) {
  res.setHeader("Content-Type", "text/html");

  res.write(`
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />

      <style>
      .container{
        height: 101%;
        width: 101%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        background: rgb(6,20,27);
        background: linear-gradient(140deg, rgba(6,20,27,1) 0%, rgba(17,33,45,1) 20%, rgba(37,55,69,1) 40%, rgba(74,92,106,1) 60%, rgba(155,168,171,1) 80%, rgba(204,208,207,1) 100%);
    }
    .sub-container{
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      width: 300px;
      height: 350px;
      background-color: #00000057;
      border-radius: 10px;
      box-shadow: 0 0 12px #111;
      padding: 10px;
  }
      .text-titulo{
      font-size: 25px;
      padding: 15px;
      margin:10px;
      color: #eee;
    }

    .btn-input{
      border:solid 2px #222;
      background-color: #333;
      color: #eee;
      border-radius: 15px;
      box-shadow: 0 0 10px #222;
      padding: 15px;
  }
    .btn-input:hover{
    border:solid 1.5px #44a0a0;
    background-color: #548383;
    color: #fff;
    text-shadow: 0 0 10px #fff;
    border-radius: 15px;
    box-shadow: 0 0 10px #7da0ca;
    padding: 15px;
    transition:0.8s;
  }
  .input-text{
    border-radius: 5px;
    border: none;
    padding: 10px;
    margin: 5px;
  }
    .input-text:focus{
    background-color: #7da0ca;
    color: #000;
    font-size: 14px;
    border: solid 2px #052659;
  }
    .input-text::selection{
    background-color: #7da0ca;
  }

  .apresentacao{
    color: #eee;
    font-size: 35px;
    text-shadow: 0 0 15px #fff;
}

      </style>


      <title>Soma de Variáveis</title>
    </head>
  `);
}

const server = http.createServer(async (req, res) => {
  setup(req, res);
  const urlInfo = url.parse(req.url, true);
  const parametroVariavel = urlInfo.query;

  if (!parametroVariavel.a || !parametroVariavel.b) {
    res.write(`
      <form action="" method="get" class="container">
      <div class="sub-container">
        <label class="text-titulo" for="a">Entre com o valor A:</label>
        <input class="input-text" type="text" name="a" id="a" />
        <br />
        <label class="text-titulo" for="b">Entre com o valor B:</label>
        <input class="input-text" type="text" name="b" id="b" />
        <br />
        <input class="btn-input" type="submit" value="Calcular" />
        </div>
      </form>
    `);
    res.end();
  } else {
    const a = Number(parametroVariavel.a);
    const b = Number(parametroVariavel.b);
    res.end(`<div class="container"><h1 class="apresentacao">Resultado da soma A + B = ${a + b}</h1></div>`);
  }
});

server.listen(3000, () => {
  console.log("Server is running on port 3000");
});
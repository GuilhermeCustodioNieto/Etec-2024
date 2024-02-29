export default function area(largura, altura) {
    return largura * altura;
}

export default function perimetro(largura, altura) {
    return 2 * (largura + altura)
}

export default function diagonal(largura, altura) {
    Math.sqrt(largura * largura + altura + altura)
}
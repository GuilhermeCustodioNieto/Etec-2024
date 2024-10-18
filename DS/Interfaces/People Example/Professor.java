public class Professor implements Pessoa{
    private String nome;
    private String endereco;
    private String telefone;
    private String matricula;

    public Professor(String nome, String endereco, String telefone, String matricula) {
        this.nome = nome;
        this.endereco = endereco;
        this.telefone = telefone;
        this.matricula = matricula;
    }

    @Override
    public String getNome() {
        return nome;
    }

    @Override
    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String getEndereco() {
        return endereco;
    }

    @Override
    public String setEndereco(String endereco) {
        return this.endereco = endereco;
    }

    @Override
    public String getTelefone() {
        return telefone;
    }

    @Override
    public String setTelefone(String telefone) {
        return this.telefone = telefone;
    }

    public String getMatricula() {
        return matricula;
    }

    public String setMatricula(String matricula) {
        return this.matricula = matricula;
    }

    public void apresentar(){
        System.out.println("Nome: " + this.getNome());
        System.out.println("Endereco: " + this.getEndereco());
        System.out.println("Telefone: " + this.getTelefone());
        System.out.println("Matricula: " + this.getMatricula());
    }
}

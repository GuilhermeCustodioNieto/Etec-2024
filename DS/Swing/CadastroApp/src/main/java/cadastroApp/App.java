package cadastroApp;
import cadastroApp.views.Cadastrar;
import java.awt.EventQueue;

public class App {

	public static void main(String[] args) {
		 EventQueue.invokeLater(new Runnable() {
	            public void run() {
	                try {
	                    Cadastrar cadastrar = new Cadastrar();
	                    cadastrar.setVisible(true);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
	        });


	}

}

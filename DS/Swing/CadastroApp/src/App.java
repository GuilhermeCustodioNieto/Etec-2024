
import java.awt.EventQueue;

import cadastroApp.views.Home;

public class App {

	public static void main(String[] args) {
		 EventQueue.invokeLater(new Runnable() {
	            public void run() {
	                try {
	                	//Cadastrar cadastrar = new Cadastrar();
	                	
	                	Home home = new Home();
	                    home.setVisible(true);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
	        });


	}

}

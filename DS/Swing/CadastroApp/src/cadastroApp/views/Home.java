package cadastroApp.views;

import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

public class Home extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;


	public Home() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 479);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));


		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setBounds(108, 132, 217, 229);
		contentPane.add(panel);
		panel.setLayout(null);
		
		JButton listarBtn = new JButton("Listar produtos");
		listarBtn.setBounds(new Rectangle(0, 0, 50, 50));
		listarBtn.setBounds(34, 11, 160, 42);
		panel.add(listarBtn);
		
		JButton atualizarBtn = new JButton("Atualizar produtos");
		atualizarBtn.setBounds(new Rectangle(0, 0, 50, 50));
		atualizarBtn.setBounds(34, 117, 160, 42);
		panel.add(atualizarBtn);
		
		JButton cadastrarBtn = new JButton("Cadastrar novo produto");
		cadastrarBtn.setBounds(new Rectangle(0, 0, 50, 50));
		cadastrarBtn.setBounds(34, 64, 160, 42);
		panel.add(cadastrarBtn);
		
		JButton sairBtn = new JButton("SAIR\r\n");
		sairBtn.setBounds(new Rectangle(0, 0, 50, 50));
		sairBtn.setBounds(34, 170, 160, 42);
		panel.add(sairBtn);
		
		listarBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				Lista lista = new Lista();
				lista.setVisible(true);
			}
		});
		
		atualizarBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				UpdateScreen updateScreen = new UpdateScreen();
				updateScreen.setVisible(true);
			}
		});
		
		cadastrarBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				
				
				Cadastro cadastro = new Cadastro();
				cadastro.setVisible(true);
			}
		});
		
		sairBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				System.exit(ABORT);
			}
		});
		
		JLabel lblNewLabel = new JLabel("");
		lblNewLabel.setIcon(new ImageIcon(Home.class.getResource("/cadastroApp/views/assets/productsIcon.png")));
		lblNewLabel.setBounds(170, 11, 99, 101);
		contentPane.add(lblNewLabel);
	}
}
package cadastroApp.views;



import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Lista extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	public Lista() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 409);
		contentPane = new JPanel();
		contentPane.setBackground(Color.WHITE);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JButton btnNewButton = new JButton("Cadastrar um novo usuário");
		btnNewButton.setBounds(231, 312, 193, 23);
		btnNewButton.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();
				
				Cadastro cadastrar = new Cadastro();
				cadastrar.setVisible(true);
				
			}
		});
		contentPane.add(btnNewButton);
		
		JLabel lblNewLabel = new JLabel();
		lblNewLabel.setBorder(new EmptyBorder(0, 20, 0, 0));
		lblNewLabel.setHorizontalTextPosition(SwingConstants.LEFT);
		lblNewLabel.setHorizontalAlignment(SwingConstants.LEFT);
		lblNewLabel.setBackground(SystemColor.control);
		lblNewLabel.setBounds(123, 73, 204, 82);
		contentPane.add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("Lista de Produtos");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 18));
		lblNewLabel_1.setBounds(136, 24, 161, 38);
		contentPane.add(lblNewLabel_1);
		
		JButton btnIncio = new JButton("In\u00EDcio");
		btnIncio.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				
				Home home = new Home();
				home.setVisible(true);
			}
		});
		btnIncio.setBounds(10, 312, 193, 23);
		contentPane.add(btnIncio);
	}
}
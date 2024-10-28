package cadastroApp.views;
import java.awt.Color;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.Box;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

public class Cadastrar extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTextField textField_3;

	public Cadastrar() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		getContentPane().setBackground(Color.WHITE);
		setBounds(100, 100, 450, 479);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		getContentPane().setLayout(null);
		
		JLabel lblNewLabel = new JLabel("");
		lblNewLabel.setBounds(162, 11, 99, 101);
		lblNewLabel.setIcon(new ImageIcon(".\\src\\main\\java\\cadastroApp\\views\\assets\\productsIcon.png"));
		getContentPane().add(lblNewLabel);
		
		Box verticalBox = Box.createVerticalBox();
		verticalBox.setBounds(75, 117, 284, 232);
		getContentPane().add(verticalBox);
		
		JLabel lblNewLabel_1 = new JLabel("Nome:");
		lblNewLabel_1.setBorder(new EmptyBorder(5, 0, 0, 0));
		verticalBox.add(lblNewLabel_1);
		
		JTextField textField_2 = new JTextField();
		verticalBox.add(textField_2);
		textField_2.setBackground(SystemColor.controlHighlight);
		textField_2.setColumns(10);
		
		JLabel lblNewLabel_2 = new JLabel("Preço:");
		lblNewLabel_2.setBorder(new EmptyBorder(5, 0, 0, 0));
		verticalBox.add(lblNewLabel_2);
		
		JTextField textField_1 = new JTextField();
		verticalBox.add(textField_1);
		textField_1.setBackground(SystemColor.controlHighlight);
		textField_1.setColumns(10);
		
		JLabel lblNewLabel_3 = new JLabel("Descrição:");
		lblNewLabel_3.setBorder(new EmptyBorder(5, 0, 0, 0));
		verticalBox.add(lblNewLabel_3);
		
		JTextField textField = new JTextField();
		verticalBox.add(textField);
		textField.setBackground(SystemColor.controlHighlight);
		textField.setColumns(10);
		
		JLabel lblNewLabel_3_1 = new JLabel("Categoria:");
		lblNewLabel_3_1.setBorder(new EmptyBorder(5, 0, 0, 0));
		verticalBox.add(lblNewLabel_3_1);
		
		textField_3 = new JTextField();
		textField_3.setColumns(10);
		textField_3.setBackground(SystemColor.controlHighlight);
		verticalBox.add(textField_3);
		
		JButton btnNewButton = new JButton("Enviar");
		btnNewButton.setBounds(185, 375, 70, 23);
		getContentPane().add(btnNewButton);
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {



				dispose();
				Lista lista = new Lista();
				lista.setVisible(true);
			}
		});
	}
}

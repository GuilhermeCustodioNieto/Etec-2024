package cadastroApp.views;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;

public class UpdateScreen extends JFrame {

	private JPanel contentPane;

	public UpdateScreen() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 479);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("");
		
		lblNewLabel.setBounds(162, 11, 99, 101);
		lblNewLabel.setIcon(new ImageIcon(".\\src\\main\\java\\cadastroApp\\views\\assets\\productsIcon.png"));
		contentPane.add(lblNewLabel);
	}

}

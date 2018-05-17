package test;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JComboBox;
import javax.swing.JTextArea;
import java.awt.Font;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.util.Scanner;
import java.awt.event.ActionEvent;
import javax.swing.DropMode;
import javax.swing.JTextPane;
import javax.swing.UIManager;
import javax.swing.JEditorPane;
import javax.swing.JScrollBar;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class TEST extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					TEST frame = new TEST();
					frame.setVisible(true);
					UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public TEST() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JEditorPane editorPane = new JEditorPane();
		editorPane.addKeyListener(new KeyAdapter() {
			@Override
			public void keyPressed(KeyEvent arg0) {
				System.out.println("DEBUG");
			}
		});
		editorPane.setBounds(26, 66, 360, 139);
		contentPane.add(editorPane);
		
		Scanner in = new Scanner(System.in);
		
		in.nextLine();
		
		
		
		
	}
}

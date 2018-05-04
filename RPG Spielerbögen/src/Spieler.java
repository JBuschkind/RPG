import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.DefaultListModel;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JTabbedPane;
import javax.swing.UIManager;

import net.miginfocom.swing.MigLayout;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JList;
import javax.swing.border.LineBorder;
import java.awt.SystemColor;
import javax.swing.JTextField;

public class Spieler extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8484086595395485269L; //automatisch generiert

	private JPanel contentPane; //global

	JComboBox<String> comboBoxSpieler = new JComboBox<String>(); //global
	JLabel lblStamm = new JLabel("-"); //global
	JLabel lblKlasse = new JLabel("-"); //global
	JLabel lblBeruf = new JLabel("-"); //global
	JLabel lblruest = new JLabel("-");
	JList listWaffen = new JList();
	JList listfaehigkeiten = new JList();
	private JTextField txtNewPlayerName;
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {      //automatisch generiert
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {							//Layout Einstellung vor dem ersten Frame
					UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName()); //Layout Einstellung
					
					Spieler frame = new Spieler(); //Frame erstellen; Name egal
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Spieler() {      //automatisch generiert
		
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 584, 432);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(new BorderLayout(0, 0));
		
		JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
		contentPane.add(tabbedPane, BorderLayout.CENTER);
		
		JPanel panelSpieler = new JPanel();
		tabbedPane.addTab("   Spielerinformationen   ", null, panelSpieler, null);
		panelSpieler.setLayout(new MigLayout("", "[39.00][20.00][137.00]", "[][][][][][][][15.00][21.00]"));
		
		JLabel lblSpieler = new JLabel("Spieler:");
		panelSpieler.add(lblSpieler, "cell 0 0,alignx trailing");
		comboBoxSpieler.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {				
				SQLHelper db = VerbindungHerstellen();
				
				// Ausgewählte Spieler
				String name = (String) comboBoxSpieler.getSelectedItem(); 
				
				// Suche anhand des Namens die ID des Spielers
				ArrayList<Map<String, String>> spielerID = db.queryToMap(
						"SELECT ID FROM m_spieler WHERE Name = '" + name + "'");
			
				// Lese die Eigenschaften des Spielers aus
				ArrayList<Map<String, String>> spieler = db.queryToMap(
						
  // Die Spalten, die wir möchten
  "SELECT stamm.Stamm, klassen.Klasse, beruf.Beruf, ruest_klasse.Ruest, waffen.Waffe "
						
  // Quelltabelle
+ "FROM m_spieler "

  // Tabelle stamm an m_spieler anhängen, dem Fremdschlüssel entsprechend sortieren
+ "INNER JOIN stamm ON m_spieler.F_Stamm = stamm.ID "

  // klassen an m_spieler anhängen und sortieren
+ "INNER JOIN klassen ON m_spieler.F_Klasse = klassen.ID "

  // beruf an m_spieler anhängen und sortieren
+ "INNER JOIN beruf ON m_spieler.F_Beruf = beruf.ID "


+ "INNER JOIN ruest_klasse ON klassen.F_r�st_klasse = ruest_klasse.ID "


+ "INNER JOIN l_waffe_klasse ON klassen.ID = l_waffe_klasse.F_Klasse "


+ "INNER JOIN waffen ON l_waffe_klasse.F_Waffe = waffen.ID "

  // Bedingung: ID des Spielers entspricht der ID, des ausgewählten Spielers
+ "WHERE m_spieler.ID = " + (spielerID.get(0).get("ID")));
				
				ArrayList<Map<String, String>> faehigkeiten = db.queryToMap(
						
  "SELECT faehigkeiten.F�higkeit FROM m_spieler "
						
+ "INNER JOIN faehigkeiten ON m_spieler.F_Klasse = faehigkeiten.F_Klasse "		

+ "WHERE m_spieler.ID = " + (spielerID.get(0).get("ID")));
				
				
//				// Daten auslesen
				String stamm = spieler.get(0).get("Stamm");
				String beruf = spieler.get(0).get("Beruf");
				String klasse = spieler.get(0).get("Klasse");
				String ruest = spieler.get(0).get("ruest");
				
				DefaultListModel waffen = new DefaultListModel();
				
				for(Map<String, String> element : spieler){		
					waffen.addElement(element.get("Waffe"));
				}
				
				DefaultListModel faehigkeitenlist = new DefaultListModel();
				
				for(Map<String, String> element : faehigkeiten){		
					faehigkeitenlist.addElement(element.get("F�higkeit"));
				}
				
				// Daten anzeigen
				lblStamm.setText(stamm);
				lblBeruf.setText(beruf);
				lblKlasse.setText(klasse);
				lblruest.setText(ruest);
				listWaffen.setModel(waffen);
				listfaehigkeiten.setModel(faehigkeitenlist);
				
				// Verbindung schließen
				db.close();
			}
		});
		
		
		panelSpieler.add(comboBoxSpieler, "cell 2 0,growx");
		
		JLabel lblStamminfo = new JLabel("Stamm:");
		panelSpieler.add(lblStamminfo, "cell 0 2");
		
		panelSpieler.add(lblStamm, "cell 2 2");
		
		JLabel lblKlasseninfo = new JLabel("Klasse:");
		panelSpieler.add(lblKlasseninfo, "cell 0 3");
		
		panelSpieler.add(lblKlasse, "cell 2 3");
		
		JLabel lblBerufinfo = new JLabel("Beruf:");
		panelSpieler.add(lblBerufinfo, "cell 0 4");
		
		panelSpieler.add(lblBeruf, "cell 2 4");
		
		JLabel lblRstungsklasseinfo = new JLabel("R\u00FCstungsklasse:");
		panelSpieler.add(lblRstungsklasseinfo, "cell 0 6");
		
		panelSpieler.add(lblruest, "cell 2 6");
		
		JLabel lblWaffen = new JLabel("Waffen:");
		panelSpieler.add(lblWaffen, "cell 0 7");
		listWaffen.setBorder(new LineBorder(SystemColor.windowBorder));
		
		
		panelSpieler.add(listWaffen, "cell 2 7,grow");
		
		JLabel lblFhigkeiteninfo = new JLabel("F\u00E4higkeiten:");
		panelSpieler.add(lblFhigkeiteninfo, "cell 0 8");
		listfaehigkeiten.setBorder(new LineBorder(SystemColor.windowBorder));
		
		
		panelSpieler.add(listfaehigkeiten, "cell 2 8,grow");
		
		JPanel panel_1 = new JPanel();
		tabbedPane.addTab("   Spieler hinzuf�gen   ", null, panel_1, null);
		panel_1.setLayout(new MigLayout("", "[50.00][7.00][155.00]", "[][][22.00][][]"));
		
		JLabel lblNewPlayerNameInfo = new JLabel("Name:");
		panel_1.add(lblNewPlayerNameInfo, "cell 0 1");
		
		txtNewPlayerName = new JTextField();
		panel_1.add(txtNewPlayerName, "cell 2 1,growx");
		txtNewPlayerName.setColumns(10);
		
		JLabel lblNewPlayerStammInfo = new JLabel("Stamm:");
		panel_1.add(lblNewPlayerStammInfo, "cell 0 2");
		
		JComboBox comboNewPlayerStamm = new JComboBox();
		panel_1.add(comboNewPlayerStamm, "cell 2 2,growx");
		
		JLabel lblNewPlayerKlasseInfo = new JLabel("Klasse:");
		panel_1.add(lblNewPlayerKlasseInfo, "cell 0 3");
		
		JComboBox comboNewPlayerKlasse = new JComboBox();
		panel_1.add(comboNewPlayerKlasse, "cell 2 3,growx");
		
		JLabel lblNewPlayerBerufInfo = new JLabel("Beruf:");
		panel_1.add(lblNewPlayerBerufInfo, "cell 0 4");
		
		JComboBox comboNewPlayerBeruf = new JComboBox();
		panel_1.add(comboNewPlayerBeruf, "cell 2 4,growx");
		
		SQLHelper db = VerbindungHerstellen();
		
		ArrayList<Map<String, String>> newPlayerInfo = db.queryToMap("");
		
		db.close();
		
		JPanel panel_2 = new JPanel();
		tabbedPane.addTab("New tab", null, panel_2, null);
		
		// Alle Spielernamen aus der Datenbank in die ComboBox laden
		LadeSpieler();	
	}
	
	public void LadeSpieler() {
		SQLHelper db = VerbindungHerstellen();
		
		// Alle Spieler auslesen
		ArrayList<Map<String, String>> daten = db.queryToMap("SELECT * FROM `m_spieler`");
		
		// ComboBox leeren
		comboBoxSpieler.removeAllItems();
		
		// Alle Spieler durchgehen und die Namen hinzufügen
		//for (int i = 0; i < daten.size(); i++) {
		for (Map<String, String> element : daten) {
			String name = element.get("Name");
			comboBoxSpieler.addItem(name);
		}
		
		// Verbindung schließen
		db.close();
	}
	
	public SQLHelper VerbindungHerstellen() {
		return new SQLHelper("localhost/DB_RPG","root","");
	}
}

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

import javax.swing.table.DefaultTableModel;


/**
 * SQL helper to interact with the database
 * 
 * @author Manuel
 */
public class SQLHelper {
	
	Connection con;

	public SQLHelper() {
		this("102-012/sven"); // ruft den Konstruktor mit der URL auf
	}
	
	public SQLHelper(String url) {
		this(url, "intabi19", "hallo"); // ruft den Konstruktor mit URL, Username und Passwort auf
	}
	
	public SQLHelper(String url, String username, String password) {
		try {
			this.con = DriverManager.getConnection("jdbc:mysql://" + url, username, password);
			// Baut eine Verbindung zur Datenbank auf mit gegebener url, username und passwort
		} catch (SQLException e) {
			// gezielte Fehlerbehandlung für SQL-Fehler
			e.printStackTrace();
		}
	}
	
	/**
	 * Executes a query without storing the return values
	 * 
	 * @param sqlQuery SQL command to be executed
	 */
	public void execute(String sqlQuery) {
		try {
			//System.out.println("SQL: " + sqlQuery);
			// führt einen SQL-Befehl aus, wobei keine Werte zurückgegeben werden
			this.con.createStatement().execute(sqlQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @return table headers in a list from an existing meta data object
	 */
	// Brauchst du nicht, ist privat
	private ArrayList<String> getColumnNames(ResultSetMetaData metaData) throws SQLException {
		int columns = metaData.getColumnCount();
		
		ArrayList<String> columnTitles = new ArrayList<>();
		for (int i = 0; i < columns; i++) {
			columnTitles.add(metaData.getColumnLabel(i + 1));
		}
		
		return columnTitles;
	}

	/**
	 * Converts the database return values into a usable format
	 * 
	 * @param sqlQuery SQL command to be executed
	 * @return a list of rows that are keyed by their column name
	 */
	public ArrayList<Map<String, String>> queryToMap(String sqlQuery) {
		ArrayList<Map<String, String>> data = new ArrayList<>();
		
		//System.out.println("SQLq: " + sqlQuery);
		
		try {
			ResultSet result = this.con.createStatement().executeQuery(sqlQuery);
			ResultSetMetaData metaData = result.getMetaData();
			
			int columns = metaData.getColumnCount();
			
			ArrayList<String> columnTitles = getColumnNames(metaData);
			
			// iterate over all rows
			while (result.next()) {
				Map<String, String> row = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
				for (int i = 0; i < columns; i++) {
					// copy items from table to row
					row.put(columnTitles.get(i), result.getString(i + 1));
				}
				data.add(row);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	/**
	 * Aus dem Helper der 12. und 13. Klasse
	 */
	public DefaultTableModel getTableModel(String sqlString) {
		DefaultTableModel model = new DefaultTableModel();

		try {
			// wichtig nicht vergessen ohne diese Aussage gibts nen Fehler(Nullpointer)
			Statement stmt = this.con.createStatement();
			// schickt SQL Abfrage ab und speichert im Objekt rs
			ResultSet rs = stmt.executeQuery(sqlString);
			// liest MetaDaten aus und speichert im Objekt rsmd
			ResultSetMetaData rsmd = rs.getMetaData();
			// Breite der Tabelle
			int colCount = rsmd.getColumnCount();

			// Ein String Array hat die Länge der Breite der Tabelle
			String colData[] = new String[colCount];
			// Läuft einmal die Breite ab und fügt die Spaltennamen zum Array hinzu
			for (int i = 1; i <= colCount; i++) {
				colData[i - 1] = rsmd.getColumnLabel(i);
			}
			// setzt die Spaltennamen im DefaultTableModel
			model.setColumnIdentifiers(colData);
			
			// Ein String Array hat die Länge der Breite der Tabelle 
			String rowData[] = new String[colCount];
			//Läuft solange es noch weitere Zeilen im rs gibt
			while (rs.next()) {
				// Läuft jede Spalte ab
				for (int i = 0; i < colCount; i++) {
					//trägt Werte der spalte in den Array ein überschreibt vorherige Werte
					rowData[i] = rs.getString(i+1);
				}
				// fügt komplette Zeile dem DefaultTableModel hinzu
				model.addRow(rowData);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//gibt fertiges DefaultTableModel zurück
		return model;
	}
	
	/**
	 * Closes the connection with the database
	 */
	public void close() {
		try {
			this.con.close(); // schließt die Verbindung
		} catch (SQLException e) {
			// gezielte Fehlerbehandlung
			e.printStackTrace();
		}
	}
}

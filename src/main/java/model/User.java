package model;

public class User {
	private int User_ID;
	private String Email;
	private String Password;
	private String Nome;
	private String Cognome;
	private String Via;
	private int Civico;
	private int CAP;
	private String Citta;
	private String Provincia;
	private String Nazione;
	private String Telefono;
	private String Ruolo;

	public User(int user_ID, String email, String password, String nome, String cognome, String via,
			int civico, int cAP, String citta, String provincia, String nazione, String telefono, String ruolo) {
		User_ID = user_ID;
		Email = email;
		Password = password;
		Nome = nome;
		Cognome = cognome;
		Via = via;
		Civico = civico;
		CAP = cAP;
		Citta = citta;
		Provincia = provincia;
		Nazione = nazione;
		Telefono = telefono;
		Ruolo = ruolo;
	}

	public int getUser_ID() {
		return User_ID;
	}

	public void setUser_ID(int user_ID) {
		User_ID = user_ID;
	}
	
	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public String getCognome() {
		return Cognome;
	}

	public void setCognome(String cognome) {
		Cognome = cognome;
	}

	public String getVia() {
		return Via;
	}

	public void setVia(String via) {
		Via = via;
	}

	public int getCivico() {
		return Civico;
	}

	public void setCivico(int civico) {
		Civico = civico;
	}

	public int getCAP() {
		return CAP;
	}

	public void setCAP(int cAP) {
		CAP = cAP;
	}

	public String getCitta() {
		return Citta;
	}

	public void setCitta(String citta) {
		Citta = citta;
	}

	public String getProvincia() {
		return Provincia;
	}

	public void setProvincia(String provincia) {
		Provincia = provincia;
	}

	public String getNazione() {
		return Nazione;
	}

	public void setNazione(String nazione) {
		Nazione = nazione;
	}

	public String getTelefono() {
		return Telefono;
	}

	public void setTelefono(String telefono) {
		Telefono = telefono;
	}

	public String getRuolo() {
		return Ruolo;
	}

	public void setRuolo(String ruolo) {
		Ruolo = ruolo;
	}
	
	public boolean isRegistered() {
	    return this.getUser_ID() > 0;
	}
	
	public boolean isAmministratore() {
		return this.getRuolo().equals("Admin");
	}

}
package aplicacion;

import java.util.ArrayList;

public class Artista extends Persona{

	private String nombreArtistico;
	private String pais;
	private String ciudad;
	private int oyentes;
	private ArrayList<Premio> premios;
	private ArrayList<Cancion> canciones;
	private ArrayList<Disco> discos;
	private ArrayList<Genero> generos;
	private Representante repre;
	private ArrayList<Concierto> conciertosDados;
	private ArrayList<Concierto> conciertosProximos;
	private ArrayList<RedSocial> redesSociales;
	
	public Artista(String identificador, String nombre, String apellidos, String fechaNacimiento, String fechaInicio,
			String nombreArtistico, String pais, String ciudad, int oyentes, ArrayList<Premio> premios,
			ArrayList<Cancion> canciones, ArrayList<Disco> discos, ArrayList<Genero> generos, Representante repre,
			ArrayList<Concierto> conciertosDados, ArrayList<Concierto> conciertosProximos,
			ArrayList<RedSocial> redesSociales) {
		super(identificador, nombre, apellidos, fechaNacimiento, fechaInicio);
		this.nombreArtistico = nombreArtistico;
		this.pais = pais;
		this.ciudad = ciudad;
		this.oyentes = oyentes;
		this.premios = premios;
		this.canciones = canciones;
		this.discos = discos;
		this.generos = generos;
		this.repre = repre;
		this.conciertosDados = conciertosDados;
		this.conciertosProximos = conciertosProximos;
		this.redesSociales = redesSociales;
	}
	
	public Artista(String identificador, String nombre, String apellidos, String fechaNacimiento, String fechaInicio,
			String nombreArtistico, String pais, String ciudad, int oyentes) {
		super(identificador, nombre, apellidos, fechaNacimiento, fechaInicio);
		this.nombreArtistico = nombreArtistico;
		this.pais = pais;
		this.ciudad = ciudad;
		this.oyentes = oyentes;
		this.premios = new ArrayList<Premio>();
		this.canciones = new ArrayList<Cancion>();
		this.discos = new ArrayList<Disco>();
		this.generos = new ArrayList<Genero>();
		this.repre = new Representante();
		this.conciertosDados = new ArrayList<Concierto>();
		this.conciertosProximos = new ArrayList<Concierto>();
		this.redesSociales = new ArrayList<RedSocial>();
	}
	
	public Artista() {
		super();
		this.nombreArtistico = "";
		this.pais = "";
		this.ciudad = "";
		this.oyentes = 0;
		this.premios = new ArrayList<Premio>();
		this.canciones = new ArrayList<Cancion>();
		this.discos = new ArrayList<Disco>();
		this.generos = new ArrayList<Genero>();
		this.repre = new Representante();
		this.conciertosDados = new ArrayList<Concierto>();
		this.conciertosProximos = new ArrayList<Concierto>();
		this.redesSociales = new ArrayList<RedSocial>();
	}

	public String getNombreArtistico() {
		return nombreArtistico;
	}

	public void setNombreArtistico(String nombreArtistico) {
		this.nombreArtistico = nombreArtistico;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public int getOyentes() {
		return oyentes;
	}

	public void setOyentes(int oyentes) {
		this.oyentes = oyentes;
	}

	public ArrayList<Premio> getPremios() {
		return premios;
	}

	public void setPremios(ArrayList<Premio> premios) {
		this.premios = premios;
	}

	public ArrayList<Cancion> getCanciones() {
		return canciones;
	}

	public void setCanciones(ArrayList<Cancion> canciones) {
		this.canciones = canciones;
	}

	public ArrayList<Disco> getDiscos() {
		return discos;
	}

	public void setDiscos(ArrayList<Disco> discos) {
		this.discos = discos;
	}

	public ArrayList<Genero> getGeneros() {
		return generos;
	}

	public void setGeneros(ArrayList<Genero> generos) {
		this.generos = generos;
	}

	public Representante getRepre() {
		return repre;
	}

	public void setRepre(Representante repre) {
		this.repre = repre;
	}

	public ArrayList<Concierto> getConciertosDados() {
		return conciertosDados;
	}

	public void setConciertosDados(ArrayList<Concierto> conciertosDados) {
		this.conciertosDados = conciertosDados;
	}

	public ArrayList<Concierto> getConciertosProximos() {
		return conciertosProximos;
	}

	public void setConciertosProximos(ArrayList<Concierto> conciertosProximos) {
		this.conciertosProximos = conciertosProximos;
	}

	public ArrayList<RedSocial> getRedesSociales() {
		return redesSociales;
	}

	public void setRedesSociales(ArrayList<RedSocial> redesSociales) {
		this.redesSociales = redesSociales;
	}

	@Override
	public String toString() {
		return "Artista [nombreArtistico=" + nombreArtistico + ", pais=" + pais + ", ciudad=" + ciudad + ", oyentes="
				+ oyentes + ", premios=" + premios + ", canciones=" + canciones + ", discos=" + discos + ", generos="
				+ generos + ", repre=" + repre + ", conciertosDados=" + conciertosDados + ", conciertosProximos="
				+ conciertosProximos + ", redesSociales=" + redesSociales + ", identificador=" + identificador
				+ ", nombre=" + nombre + ", apellidos=" + apellidos + ", fechaNacimiento=" + fechaNacimiento
				+ ", fechaInicio=" + fechaInicio + "]";
	}

	public void cargarPremios () {
		
	}
		
}

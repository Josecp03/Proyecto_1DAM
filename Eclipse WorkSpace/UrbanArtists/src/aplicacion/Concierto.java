package aplicacion;

import java.util.ArrayList;

public class Concierto {

	private String identificador;
	private String titulo;
	private String fecha;
	private String pais;
	private String ciudad;
	private int duracion;
	private int aforo;
	private Artista artistaPrincipal;
	private ArrayList<Artista> colaboraciones;
	
	public Concierto(String identificador, String titulo, String fecha, String pais, String ciudad, int duracion,
			int aforo, Artista artistaPrincipal, ArrayList<Artista> colaboraciones) {
		this.identificador = identificador;
		this.titulo = titulo;
		this.fecha = fecha;
		this.pais = pais;
		this.ciudad = ciudad;
		this.duracion = duracion;
		this.aforo = aforo;
		this.artistaPrincipal = artistaPrincipal;
		this.colaboraciones = colaboraciones;
	}
	
	public Concierto(String identificador, String titulo, String fecha, String pais, String ciudad, int duracion,
			int aforo) {
		this.identificador = identificador;
		this.titulo = titulo;
		this.fecha = fecha;
		this.pais = pais;
		this.ciudad = ciudad;
		this.duracion = duracion;
		this.aforo = aforo;
		this.artistaPrincipal = new Artista();
		this.colaboraciones = new ArrayList<Artista>();
	}
	
	public Concierto() {
		this.identificador = "";
		this.titulo = "";
		this.fecha = "";
		this.pais = "";
		this.ciudad = "";
		this.duracion = 0;
		this.aforo = 0;
		this.artistaPrincipal = new Artista();
		this.colaboraciones = new ArrayList<Artista>();
	}

	public String getIdentificador() {
		return identificador;
	}

	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
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

	public int getDuracion() {
		return duracion;
	}

	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}

	public int getAforo() {
		return aforo;
	}

	public void setAforo(int aforo) {
		this.aforo = aforo;
	}

	public Artista getArtistaPrincipal() {
		return artistaPrincipal;
	}

	public void setArtistaPrincipal(Artista artistaPrincipal) {
		this.artistaPrincipal = artistaPrincipal;
	}

	public ArrayList<Artista> getColaboraciones() {
		return colaboraciones;
	}

	public void setColaboraciones(ArrayList<Artista> colaboraciones) {
		this.colaboraciones = colaboraciones;
	}

	@Override
	public String toString() {
		return "Concierto [identificador=" + identificador + ", titulo=" + titulo + ", fecha=" + fecha + ", pais="
				+ pais + ", ciudad=" + ciudad + ", duracion=" + duracion + ", aforo=" + aforo + ", artistaPrincipal="
				+ artistaPrincipal + ", colaboraciones=" + colaboraciones + "]";
	}

}

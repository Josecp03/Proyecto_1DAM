package aplicacion;

import java.util.ArrayList;

public class Disco {

	private String identificador;
	private String titulo;
	private String fechaLanzamiento;
	private int duracion;
	private int reproducciones;
	private ArrayList<Cancion> canciones;
	private ArrayList<Artista> colaboraciones;
	private Artista artistaPrincipal;
	private ArrayList<Genero> generos;
	
	public Disco(String identificador, String titulo, String fechaLanzamiento, int duracion, int reproducciones,
			ArrayList<Cancion> canciones, ArrayList<Artista> colaboraciones, Artista artistaPrincipal,
			ArrayList<Genero> generos) {
		this.identificador = identificador;
		this.titulo = titulo;
		this.fechaLanzamiento = fechaLanzamiento;
		this.duracion = duracion;
		this.reproducciones = reproducciones;
		this.canciones = canciones;
		this.colaboraciones = colaboraciones;
		this.artistaPrincipal = artistaPrincipal;
		this.generos = generos;
	}
	
	public Disco(String identificador, String titulo, String fechaLanzamiento, int duracion, int reproducciones) {
		this.identificador = identificador;
		this.titulo = titulo;
		this.fechaLanzamiento = fechaLanzamiento;
		this.duracion = duracion;
		this.reproducciones = reproducciones;
		this.canciones = new ArrayList<Cancion>();
		this.colaboraciones = new ArrayList<Artista>();
		this.artistaPrincipal = new Artista();
		this.generos = new ArrayList<Genero>();
	}
	
	public Disco() {
		this.identificador = "";
		this.titulo = "";
		this.fechaLanzamiento = "";
		this.duracion = 0;
		this.reproducciones = 0;
		this.canciones = new ArrayList<Cancion>();
		this.colaboraciones = new ArrayList<Artista>();
		this.artistaPrincipal = new Artista();
		this.generos = new ArrayList<Genero>();
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

	public String getFechaLanzamiento() {
		return fechaLanzamiento;
	}

	public void setFechaLanzamiento(String fechaLanzamiento) {
		this.fechaLanzamiento = fechaLanzamiento;
	}

	public int getDuracion() {
		return duracion;
	}

	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}

	public int getReproducciones() {
		return reproducciones;
	}

	public void setReproducciones(int reproducciones) {
		this.reproducciones = reproducciones;
	}

	public ArrayList<Cancion> getCanciones() {
		return canciones;
	}

	public void setCanciones(ArrayList<Cancion> canciones) {
		this.canciones = canciones;
	}

	public ArrayList<Artista> getColaboraciones() {
		return colaboraciones;
	}

	public void setColaboraciones(ArrayList<Artista> colaboraciones) {
		this.colaboraciones = colaboraciones;
	}

	public Artista getArtistaPrincipal() {
		return artistaPrincipal;
	}

	public void setArtistaPrincipal(Artista artistaPrincipal) {
		this.artistaPrincipal = artistaPrincipal;
	}

	public ArrayList<Genero> getGeneros() {
		return generos;
	}

	public void setGeneros(ArrayList<Genero> generos) {
		this.generos = generos;
	}

	@Override
	public String toString() {
		return "Disco [identificador=" + identificador + ", titulo=" + titulo + ", fechaLanzamiento=" + fechaLanzamiento
				+ ", duracion=" + duracion + ", reproducciones=" + reproducciones + ", canciones=" + canciones
				+ ", colaboraciones=" + colaboraciones + ", artistaPrincipal=" + artistaPrincipal + ", generos="
				+ generos + "]";
	}

}

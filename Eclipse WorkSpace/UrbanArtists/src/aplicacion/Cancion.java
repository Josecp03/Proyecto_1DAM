package aplicacion;

import java.util.ArrayList;

public class Cancion {

	private String identificador;
	private String titulo;
	private String fechaLanzamiento;
	private int duracion;
	private int reproducciones;
	private ArrayList<Artista> artistas;
	private Disco album;
	private Genero generoCancion;
	private Productor productorCancion;
	private Artista artistaPrincipal;
	
	public Cancion(String identificador, String titulo, String fechaLanzamiento, int duracion, int reproducciones,
			ArrayList<Artista> artistas, Disco album, Genero generoCancion, Productor productorCancion,
			Artista artistaPrincipal) {
		this.identificador = identificador;
		this.titulo = titulo;
		this.fechaLanzamiento = fechaLanzamiento;
		this.duracion = duracion;
		this.reproducciones = reproducciones;
		this.artistas = artistas;
		this.album = album;
		this.generoCancion = generoCancion;
		this.productorCancion = productorCancion;
		this.artistaPrincipal = artistaPrincipal;
	}
	
	public Cancion(String identificador, String titulo, String fechaLanzamiento, int duracion, int reproducciones) {
		this.identificador = identificador;
		this.titulo = titulo;
		this.fechaLanzamiento = fechaLanzamiento;
		this.duracion = duracion;
		this.reproducciones = reproducciones;
		this.artistas = new ArrayList<Artista>();
		this.album = new Disco();
		this.generoCancion = new Genero();
		this.productorCancion = new Productor();
		this.artistaPrincipal = new Artista();
	}
	
	public Cancion() {
		this.identificador = "";
		this.titulo = "";
		this.fechaLanzamiento = "";
		this.duracion = 0;
		this.reproducciones = 0;
		this.artistas = new ArrayList<Artista>();
		this.album = new Disco();
		this.generoCancion = new Genero();
		this.productorCancion = new Productor();
		this.artistaPrincipal = new Artista();
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

	public ArrayList<Artista> getArtistas() {
		return artistas;
	}

	public void setArtistas(ArrayList<Artista> artistas) {
		this.artistas = artistas;
	}

	public Disco getAlbum() {
		return album;
	}

	public void setAlbum(Disco album) {
		this.album = album;
	}

	public Genero getGeneroCancion() {
		return generoCancion;
	}

	public void setGeneroCancion(Genero generoCancion) {
		this.generoCancion = generoCancion;
	}

	public Productor getProductorCancion() {
		return productorCancion;
	}

	public void setProductorCancion(Productor productorCancion) {
		this.productorCancion = productorCancion;
	}

	public Artista getArtistaPrincipal() {
		return artistaPrincipal;
	}

	public void setArtistaPrincipal(Artista artistaPrincipal) {
		this.artistaPrincipal = artistaPrincipal;
	}

	@Override
	public String toString() {
		return "Cancion [identificador=" + identificador + ", titulo=" + titulo + ", fechaLanzamiento="
				+ fechaLanzamiento + ", duracion=" + duracion + ", reproducciones=" + reproducciones + ", artistas="
				+ artistas + ", album=" + album + ", generoCancion=" + generoCancion + ", productorCancion="
				+ productorCancion + ", artistaPrincipal=" + artistaPrincipal + "]";
	}
	
}

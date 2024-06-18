package aplicacion;

public class Genero {

	private String identificador;
	private String nombre;
	private String paisOrigen;
	
	public Genero(String identificador, String nombre, String paisOrigen) {
		this.identificador = identificador;
		this.nombre = nombre;
		this.paisOrigen = paisOrigen;
	}
	
	public Genero() {
		this.identificador = "";
		this.nombre = "";
		this.paisOrigen = "";
	}

	public String getIdentificador() {
		return identificador;
	}

	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPaisOrigen() {
		return paisOrigen;
	}

	public void setPaisOrigen(String paisOrigen) {
		this.paisOrigen = paisOrigen;
	}

	@Override
	public String toString() {
		return "Genero [identificador=" + identificador + ", nombre=" + nombre + ", paisOrigen=" + paisOrigen + "]";
	}
	
}

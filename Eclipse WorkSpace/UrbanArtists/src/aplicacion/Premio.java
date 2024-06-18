package aplicacion;

public class Premio {

	private String identificador;
	private String nombre;
	private String fechaEntrega;
	private String organizacion;
	private Artista ganador;
	
	public Premio(String identificador, String nombre, String fechaEntrega, String organizacion, Artista ganador) {
		this.identificador = identificador;
		this.nombre = nombre;
		this.fechaEntrega = fechaEntrega;
		this.organizacion = organizacion;
		this.ganador = ganador;
	}
	
	public Premio(String identificador, String nombre, String fechaEntrega, String organizacion) {
		this.identificador = identificador;
		this.nombre = nombre;
		this.fechaEntrega = fechaEntrega;
		this.organizacion = organizacion;
		this.ganador = new Artista();
	}
	
	public Premio() {
		this.identificador = "";
		this.nombre = "";
		this.fechaEntrega = "";
		this.organizacion = "";
		this.ganador = new Artista();
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

	public String getFechaEntrega() {
		return fechaEntrega;
	}

	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}

	public String getOrganizacion() {
		return organizacion;
	}

	public void setOrganizacion(String organizacion) {
		this.organizacion = organizacion;
	}

	public Artista getGanador() {
		return ganador;
	}

	public void setGanador(Artista ganador) {
		this.ganador = ganador;
	}

	@Override
	public String toString() {
		return "Premio [identificador=" + identificador + ", nombre=" + nombre + ", fechaEntrega=" + fechaEntrega
				+ ", organizacion=" + organizacion + ", ganador=" + ganador + "]";
	}
	
}

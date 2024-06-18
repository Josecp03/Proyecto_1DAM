package aplicacion;

public class RedSocial {

	private String identificador;
	private String nombre;
	private String url;
	private int seguidores;
	
	public RedSocial(String identificador, String nombre, String url, int seguidores) {
		this.identificador = identificador;
		this.nombre = nombre;
		this.url = url;
		this.seguidores = seguidores;
	}
	
	public RedSocial() {
		this.identificador = "";
		this.nombre = "";
		this.url = "";
		this.seguidores = 0;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getSeguidores() {
		return seguidores;
	}

	public void setSeguidores(int seguidores) {
		this.seguidores = seguidores;
	}

	@Override
	public String toString() {
		return "RedSocial [identificador=" + identificador + ", nombre=" + nombre + ", url=" + url + ", seguidores="
				+ seguidores + "]";
	}
	
}

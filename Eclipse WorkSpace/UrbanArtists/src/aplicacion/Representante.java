package aplicacion;

import java.util.ArrayList;

public class Representante extends Persona{

	private String nacionalidad;
	private String telefono;
	private String correoElectronico;
	private ArrayList<Artista> cantantesRepresentados;
	
	public Representante(String identificador, String nombre, String apellidos, String fechaNacimiento,
			String fechaInicio, String nacionalidad, String telefono, String correoElectronico,
			ArrayList<Artista> cantantesRepresentados) {
		super(identificador, nombre, apellidos, fechaNacimiento, fechaInicio);
		this.nacionalidad = nacionalidad;
		this.telefono = telefono;
		this.correoElectronico = correoElectronico;
		this.cantantesRepresentados = cantantesRepresentados;
	}
	
	public Representante(String identificador, String nombre, String apellidos, String fechaNacimiento,
			String fechaInicio, String nacionalidad, String telefono, String correoElectronico) {
		super(identificador, nombre, apellidos, fechaNacimiento, fechaInicio);
		this.nacionalidad = nacionalidad;
		this.telefono = telefono;
		this.correoElectronico = correoElectronico;
		this.cantantesRepresentados = new ArrayList<Artista>();
	}
	
	public Representante() {
		super();
		this.nacionalidad = "";
		this.telefono = "";
		this.correoElectronico = "";
		this.cantantesRepresentados = new ArrayList<Artista>();
	}

	public String getNacionalidad() {
		return nacionalidad;
	}

	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCorreoElectronico() {
		return correoElectronico;
	}

	public void setCorreoElectronico(String correoElectronico) {
		this.correoElectronico = correoElectronico;
	}

	public ArrayList<Artista> getCantantesRepresentados() {
		return cantantesRepresentados;
	}

	public void setCantantesRepresentados(ArrayList<Artista> cantantesRepresentados) {
		this.cantantesRepresentados = cantantesRepresentados;
	}

	@Override
	public String toString() {
		return "Representante [nacionalidad=" + nacionalidad + ", telefono=" + telefono + ", correoElectronico="
				+ correoElectronico + ", cantantesRepresentados=" + cantantesRepresentados + ", identificador="
				+ identificador + ", nombre=" + nombre + ", apellidos=" + apellidos + ", fechaNacimiento="
				+ fechaNacimiento + ", fechaInicio=" + fechaInicio + "]";
	}

}

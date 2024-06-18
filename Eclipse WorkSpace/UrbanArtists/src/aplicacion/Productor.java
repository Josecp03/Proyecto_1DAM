package aplicacion;

import java.util.ArrayList;

public class Productor extends Persona{

	private String nacionalidad;
	private String telefono;
	private String correoElectronico;
	private ArrayList<Cancion> canciones;
	
	public Productor(String identificador, String nombre, String apellidos, String fechaNacimiento, String fechaInicio,
			String nacionalidad, String telefono, String correoElectronico, ArrayList<Cancion> canciones) {
		super(identificador, nombre, apellidos, fechaNacimiento, fechaInicio);
		this.nacionalidad = nacionalidad;
		this.telefono = telefono;
		this.correoElectronico = correoElectronico;
		this.canciones = canciones;
	}
	
	public Productor(String identificador, String nombre, String apellidos, String fechaNacimiento, String fechaInicio,
			String nacionalidad, String telefono, String correoElectronico) {
		super(identificador, nombre, apellidos, fechaNacimiento, fechaInicio);
		this.nacionalidad = nacionalidad;
		this.telefono = telefono;
		this.correoElectronico = correoElectronico;
		this.canciones = new ArrayList<Cancion>();
	}
	
	public Productor() {
		super();
		this.nacionalidad = "";
		this.telefono = "";
		this.correoElectronico = "";
		this.canciones = new ArrayList<Cancion>();
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

	public ArrayList<Cancion> getCanciones() {
		return canciones;
	}

	public void setCanciones(ArrayList<Cancion> canciones) {
		this.canciones = canciones;
	}

	@Override
	public String toString() {
		return "Productor [nacionalidad=" + nacionalidad + ", telefono=" + telefono + ", correoElectronico="
				+ correoElectronico + ", canciones=" + canciones + ", identificador=" + identificador + ", nombre="
				+ nombre + ", apellidos=" + apellidos + ", fechaNacimiento=" + fechaNacimiento + ", fechaInicio="
				+ fechaInicio + "]";
	}
	
}

package aplicacion;

public abstract class Persona {

	protected String identificador;
	protected String nombre;
	protected String apellidos;
	protected String fechaNacimiento;
	protected String fechaInicio;
	
	public Persona(String identificador, String nombre, String apellidos, String fechaNacimiento, String fechaInicio) {
		this.identificador = identificador;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNacimiento = fechaNacimiento;
		this.fechaInicio = fechaInicio;
	}
	
	public Persona() {
		this.identificador = "";
		this.nombre = "";
		this.apellidos = "";
		this.fechaNacimiento = "";
		this.fechaInicio = "";
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

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	
}

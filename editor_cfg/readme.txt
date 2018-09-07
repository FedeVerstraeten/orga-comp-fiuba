Setup del editor Atom:
	Editor:
		1. En 'Preferred Line Length' utilizar 62 caracteres, así el código copiado 
			al informe Latex en A4 no recorta los excendentes y formatea bien los saltos de línea.
		2. Habilitar 'Soft Tabs'.
		3. Deshabilitar 'Soft Wrap' y 'Soft Wrap At Preferred Line Length'.
		4. En 'Tab Type' seleccionar 'Soft'.

File-Header:
	1. Dentro del directorio del paquete, copiar la carpeta 'atom_pkg_file-header' con los archivos de configuración 
		que se quieran utilizar.
	2. En la configuración del paquete, opción 'Config Directory Path', poner la ruta a la carpeta 
		que se copió en el punto anterior:
	/home/pluto/.atom/packages/file-header/atom_pkg_file-header
	3. Seleccionar la opción 'Enable Filename' para que aparezca el nombre del archivo en el 
		header auto-generado.
	4. En 'Date Time Format', suelo utilizar 'DD-MMM-YYYY h:mm:ss a'.
	5. Deshabilitar la opción 'Enable Auto Adding Header on Saving'.
	6. Setear el 'Username' y 'Real Name' así aparecen en los headers.
	
Beautifiers:
	C: instalación.
		sudo apt-get install clang-format
	Bash: instalación.
	https://github.com/bemeurer/beautysh#installation
		sudo apt-get install python-pip
		pip -V
		pip install --upgrade pip
		pip install beautysh
		
	1. Luego de instalar los formateadores, CLANG va a utilizar el archivo '.clang-format' para 
	formatear el código con la convención de Google. El mismo va a buscarse recursivamente hacia 
	directorios superiores a partir del directorio donde está el código fuente a utilizar. Recomiendo 
	dejarlo en el directorio raiz del repositorio.
	Más información: https://github.com/platformio/platformio-atom-ide/issues/126
					 http://clang.llvm.org/docs/ClangFormatStyleOptions.html
	
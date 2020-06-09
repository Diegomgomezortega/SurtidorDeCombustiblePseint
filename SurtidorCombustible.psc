Proceso MaquinaSurtidoraDeCombustible  //Proceso Principal
	//Definición de variables
	
	Definir MontoVenta como Real; //Se define como Real el monto de cada venta
	MontoVenta<-0;
	Definir Combustibles como Cadena; //En este arreglo de tipo cadena, se encuentran los combustibles a vender
	Dimension Combustibles(6); 
	//Dentro del arreglo "Combustibles", se define cada cadena particular
	Combustibles(1)<-"Nafta Super";
	Combustibles(2)<-"Nafta Premium";
	Combustibles(3)<-"Diesel Común";
	Combustibles(4)<-"Diesel Premium";
	Combustibles(5)<-"Venta Total";
	Definir Precio como Real; //En este arreglo de tipo cadena, se encuentran los precios de los combustibles a vender
	Dimension Precio(5);
	//Dentro del arreglo "Precio", se define cada valor particular
	Precio(1)<-59.49; //PrecioSuper
	Precio(2)<-66.49; //Precio Nafta Premium
	Precio(3)<-54.49; //Precio Diesel Comun
	Precio(4)<-60.49; //Precio Diesel Premium
	Definir VentaProductos como real; //Arreglo que contiene las ventas separadas por liquido y Total
	Dimension VentaProductos(6);
	//Dentro del arreglo VentaProductos se asigna un valor y se inicializa cada uno
	VentaProductos(1)<-0; //Venta Nafta Super
	VentaProductos(2)<-0; //Venta Nafta Premium
	VentaProductos(3)<-0; //Venta Diesel Común
	VentaProductos(4)<-0; //Venta Diesel Premium
	VentaProductos(5)<-0; //Venta Total
	
	Definir LitrosVendidos como Real;
	Dimension LitrosVendidos(5); //En este arreglo de tipo Real, se encuentran las cantidades vendidas de los productos
	//Dentro del arreglo LitrosVendidos se inicializa cada uno
	LitrosVendidos(1)<-0; // litros Nafta Super
	LitrosVendidos(2)<-0; // litros Nafta Premium
	LitrosVendidos(3)<-0; //litros Diesel Comun
	LitrosVendidos(4)<-0; //litros Diesel Premium
	
	Definir Opcion Como cadena;
	Definir OpcionNumero como entero;
	Definir i como entero;
	i<-1;
	
	Repetir
		//Menu Principal
		Limpiar Pantalla;
		Escribir "Bienvenido al Surtidor de Combustible. ¿Qué desea hacer?";	
		Escribir "1-Vender combustibles";
		Escribir "2-Modificar Precios de Productos";
		Escribir "8-Cierre de Ventas";
		Escribir "9-Cerrar el sistema";
		Leer Opcion;
		OpcionNumero<-OpcionValida(opcion); //Llamado al SubProceso OpcionNumero
		
		Repetir //Se descarta la variable opcionNumero que no es necesaria en este menú
			Si OpcionNumero=5 o OpcionNumero=4 o OpcionNumero=3 o OpcionNumero=6 o OpcionNumero=7 Entonces
				Escribir "Opcion invalida. Ingrese la opcion nuevamente";
				leer opcion;
				OpcionNumero<-OpcionValida(opcion);
			FinSi
		Hasta Que OpcionNumero<>5 o OpcionNumero<>4 o OpcionNumero<>3 o OpcionNumero<>6 o OpcionNumero<>7
		
		Segun OpcionNumero Hacer//Segun la opcion elegida, ingresa al menú correspondiente
			1:	Despacho(Combustibles, Precio, Opcion, OpcionNumero,i,MontoVenta,litrosVendidos,VentaProductos); //LLamado al SubProceso Despacho
				
			2:	ModificacionDePrecios(Combustibles,Precio,i,Opcion,OpcionNumero); //Llamado al SubProceso ModificaciónDePrecios
			8: 	CierreDeVentas(Combustibles, LitrosVendidos, VentaProductos); //Lamada a SubProceso Cierre de ventas
				
			9:Limpiar Pantalla;
				Escribir "Gracias por haber utilizado nuestro sistema. Hasta Luego";
				Esperar Tecla;
				
			De Otro Modo:
				
		FinSegun
	Hasta Que OpcionNumero=9;
	
	
FinProceso

SubProceso Despacho ( Combustibles, Precio, Opcion, OpcionNumero,i,MontoVenta,litrosVendidos,VentaProductos, )
	Repetir
		Limpiar Pantalla;
		Escribir "Bienvenido a Sistema de Despacho";
		Escribir " ";
		escribir "1-Nafta Super";
		Escribir "2-Nafta Premium";
		escribir "3-Diesel Común";
		Escribir "4-Diesel Premium";
		Escribir "5-Volver al Menú Principal";
		Escribir "8-Cierre de Ventas";
		
		Leer Opcion;
		OpcionNumero<-OpcionValida(opcion); //LLamada a SubProceso OpcionNumero
		Repetir
			Si OpcionNumero=9  Entonces//Se descarta la variable opcionNumero que no es necesaria en este menú
				Escribir "Opcion invalida. Ingrese la opcion nuevamente";
				leer opcion;
				OpcionNumero<-OpcionValida(opcion);
			FinSi						
		Hasta Que OpcionNumero<>9
		
		Segun OpcionNumero Hacer
			8:CierreDeVentas(Combustibles, LitrosVendidos, VentaProductos); //Lamada a SubProceso Cierre de ventas
			5: //vuelve al menu principal repitiendo el ciclo Repetir Principal
				
			De Otro Modo: //Si elije alguna otra opcion valida, entra al menú de Ventas de Productos
				Para  i<-OpcionNumero Hasta OpcionNumero Con Paso 1 Hacer //El iterador toma el valor de OpcionNumero y asi imprime y modifica los valores de los correspondientes arreglos
					Escribir Combustibles(i),": Por favor, ingrese el monto a despachar:";
					Escribir "$";
					leer MontoVenta;
					Montoventa<- MontoValido ( Montoventa ); //Se llama al SubProceso MontoDeVenta
					LitrosVendidos(i)<-MontoVenta / Precio(i); //Se calcula la cantidad de litros vendidos
					VentaProductos(5)<-Montoventa+VentaProductos(5); // Se calcula el acumulando total de ventas
					VentaProductos(i)<-Montoventa+VentaProductos(i); //Se calcula el acumulado del combustible vendido
					Escribir "Cantidad vendida: ",LitrosVendidos(i), " litros.";
					Escribir "Presione una tecla para continuar";
					Esperar Tecla;
					Limpiar Pantalla;
				FinPara
		FinSegun
		
	Hasta Que OpcionNumero=8 o OpcionNumero=5;
FinSubProceso

SubProceso ModificacionDePrecios (Combustibles,Precio,i,Opcion,OpcionNumero) //Subproceso usado para la modificación de precios
	Limpiar Pantalla;
	Escribir "Modificación de Precios";
	Escribir "Los Precios Actuales son:";
	Para i<-1 Hasta 4 Con Paso 1 Hacer //Se imprime los precios actuales de los combustibles
		Escribir "-",Combustibles(i), ": $", Precio(i);
	FinPara
	Escribir "¿Desea modificarlos?";
	Escribir"Si: Presione 1";
	Escribir"No: Presione 2";
	
	leer opcion;
	OpcionNumero<-OpcionValida(opcion);
	Si OpcionNumero<>1 y OpcionNumero<>2 Entonces //Se controla que la opcion elegida sea 1 o 2
		Repetir
			Escribir "Opcion invalida. Ingrese la opcion nuevamente";
			leer opcion;
			OpcionNumero<-OpcionValida(opcion);					
		Hasta Que OpcionNumero=1 o OpcionNumero=2
	FinSi
	
	Si OpcionNumero=1 Entonces //Se procede a realizar la modificación de los precios
		Escribir "Ingrese los nuevos precios según el formato : $00.00. Use punto  para separar la parte entera de la decimal";
		Para i<-1 Hasta 4 Con Paso 1 Hacer
			Escribir "-",Combustibles(i), ": $"; //Imprime el Nombre del Combustible
			Leer Precio(i); //Se graba en el arreglo correspondiente el precio de cada Combustible			
		FinPara
		Escribir "Carga Correcta. ";
		Escribir "Presione una tecla para continuar";
		Esperar Tecla; //Vuelve al menú
	SiNo //Se vuelve al menu principal
		Escribir "Presione Una tecla para volver al menú principal";
		Esperar Tecla;
	FinSi
	
FinSubProceso

SubProceso CierreDeVentas (Combustibles, LitrosVendidos, VentaProductos)
	//SubProceso  de Calculo de cierre de Ventas
	Definir i Como Entero;
	Limpiar pantalla;	
	Escribir "Cierre de ventas";
	Escribir "Para cerrar las ventas y visualizar el total, presione una tecla";
	Esperar Tecla;
	//Se visualiza los datos de cada arreglo
	Para i<-1 Hasta 4 Con Paso 1 Hacer
		Escribir "-",Combustibles(i);
		Escribir "-",LitrosVendidos(i)," Litros = $", VentaProductos(i);
	FinPara
	//Se visualiza la venta total y el valor en Pesos a rendir
	Escribir "-",Combustibles(5), "= $", VentaProductos(5);
	Escribir "Para continuar, presione una tecla cualquiera";
	Esperar Tecla;
FinSubProceso

SubProceso  Montoventa<- MontoValido ( Montoventa ) //Subproceso para ingresar monto correcto
	Mientras Montoventa<1 Hacer//Mientras el monto sea menor a $1, se repetirá el ciclo.
		Escribir "La venta no puede ser $0 o menos";
		Escribir "Por favor, ingrese el monto a despachar:";
		leer MontoVenta;
	FinMientras
	
FinSubProceso

SubProceso OpcionNumero<-OpcionValida(opcion) //Subproceso para lograr que el usuario ingrese una opcion valida del menú en el que se encuentra
	Definir OpcionNumero como entero; //Se define OpcionNumero como entero: Es el valor que retornará para seleccionar en el Menu
	Repetir
		
		Mientras Longitud(Opcion)>1 Hacer //Si la cadena opcion tiene mas de un caracter, directamente descarta esa opcion y pide que vuelva a ingresar otra
			Escribir "Opcion invalida. Ingrese la opcion nuevamente";
			leer opcion;			
		FinMientras
		
		Si Opcion='1' o Opcion='2' o Opcion='3' o Opcion='4' o Opcion='5' o Opcion='8' o Opcion='9' Entonces //Si la opcion tiene un solo caracter, se analiza si es una valida
			OpcionNumero<-ConvertirANumero(Opcion); //Si es valida, se convierte la variable Opcion de tipo cadena en OpcionNumero de tipo entero
		SiNo //Si no lo es, lo descarta y pide que vuelva a ingresar otra
			
			Escribir "Opcion invalida. Ingrese la opcion nuevamente";
			leer opcion; //Si es valida, se convierte la variable Opcion de tipo cadena en OpcionNumero de tipo entero. Si no, vuelve a Repetir el ciclo
		FinSi
		
	Hasta Que Opcion='1' o Opcion='2' o Opcion='3' o Opcion='4'o Opcion='5' o Opcion='8' o Opcion='9'
	OpcionNumero<-ConvertirANumero(Opcion); //Si es valida, se convierte la variable Opcion de tipo cadena en OpcionNumero de tipo entero
FinSubProceso

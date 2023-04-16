create database guarderia ;
use guarderia ;

create table niños
(matricula int primary key,
nombre varchar(30),
fecha_nacimiento date,
fecha_ingreso date,
fecha_baja date,
alergias varchar(30),
Foreign Key (alergias) references ingredientes(ingredientes));

create table autorizacion
(dni varchar(9) primary key,
nombre varchar(30),
numero_telefono int,
relacion varchar(30),
matricula_niño int,
foreign key (matricula_niño) references niños(matricula));


create table pagos 
(dni varchar(9) primary key,
nombre varchar(30),
numero_telefono int,
numero_tarjeta int,
autorizar ENUM('si','no'),
matricula_niño int,
foreign key (matricula_niño) references niños(matricula));

create table menú
(numero_menu int primary key,
nombre_plato varchar(30),
ingredientescomida varchar(30),
precio float,
Foreign Key (ingredientescomida) references ingredientes(ingredientes));



create table ingredientes
(ingredientes varchar(30) primary key);



CREATE TABLE ConsumoComidas (
  numero_matricula_nino INT,
  numero_menu_consumido INT,
  fecha_consumo DATE,
  numero_dias_consumidos INT,
  PRIMARY KEY (numero_matricula_nino, numero_menu_consumido, fecha_consumo),
  FOREIGN KEY (numero_matricula_nino) REFERENCES niños(matricula),
  FOREIGN KEY (numero_menu_consumido) REFERENCES menú(numero_menu)
);


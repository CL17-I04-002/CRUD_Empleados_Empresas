create database if not exists directenglish;
use directenglish;

create table if not exists empresa(
	id_empresa int primary key auto_increment,
    nombre_empresa varchar(50) not null,
    direccion_empresa varchar(100) not null,
    telefono_empresa varchar(50) not null
)engine=InnoDB;

create table if not exists empleado(
	id_empleado int primary key auto_increment,
    id_empresa int,
    nombre_empleado varchar(50) not null,
    apellido_empleado varchar(50) not null,
    direccion_empleado varchar(100) not null,
    telefono_empleado varchar(50) not null,
    foreign key(id_empresa) references empresa(id_empresa) ON DELETE CASCADE
)engine=InnoDB;

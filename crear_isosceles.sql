

CREATE DATABASE  if NOT exists isosceles;
USE isosceles;

CREATE TABLE if NOT exists isosceles.tipo_id (
		id_tipo INT NOT NULL AUTO_INCREMENT,
		tipo_id	VARCHAR (30) NOT NULL,
        PRIMARY KEY (id_tipo)
);

CREATE TABLE if NOT exists isosceles.pais (
		id_pais	INT NOT NULL AUTO_INCREMENT,
		pais	VARCHAR (40) NOT NULL,
        PRIMARY KEY(id_pais)
);
	
    CREATE TABLE if NOT exists isosceles.region (
		id_region	INT NOT NULL AUTO_INCREMENT,
		region	VARCHAR(30) NOT NULL,
        PRIMARY KEY (id_region)
);

CREATE TABLE if NOT exists isosceles.tipo_pro(
		id_tipo  INT NOT NULL AUTO_INCREMENT,
        nomb_cuenta VARCHAR (50),
        PRIMARY KEY (id_tipo)
);

CREATE TABLE if NOT exists isosceles.tipo_cuenta(
		id_tipo_cuenta INT NOT NULL AUTO_INCREMENT,
        nomb_cuenta VARCHAR (50),
        PRIMARY KEY (id_tipo_cuenta)
);

CREATE TABLE if NOT exists isosceles.entidad_emisora(
		id_entidad INT NOT NULL AUTO_INCREMENT,
        nomb_entidad VARCHAR (50) NOT NULL,
        PRIMARY KEY (id_entidad)
);

	CREATE TABLE if NOT exists isosceles.tarjeta(
		id_tarjeta INT NOT NULL AUTO_INCREMENT,
        nomb_tarjeta VARCHAR (50) NOT NULL,
        PRIMARY KEY (id_tarjeta)
);

	CREATE TABLE if NOT exists isosceles.tipo_tarjeta(
		id_tipo_tarjeta INT NOT NULL AUTO_INCREMENT,
        tipo_tarjeta VARCHAR (50) NOT NULL,
        PRIMARY KEY (id_tipo_tarjeta)
);

CREATE TABLE if NOT exists isosceles.producto (
		id_producto INT NOT NULL AUTO_INCREMENT,
        id_tipo	INT NOT NULL,
        id_descrprop INT NOT NULL,
        stock INT,
        precio decimal(9,2),
        PRIMARY KEY (id_producto)
);

CREATE TABLE if NOT exists isosceles.pro_descrip (
		id_descrprop INT NOT NULL AUTO_INCREMENT,
        id_producto  INT NOT NULL,
        descprod VARCHAR  (200),
        PRIMARY KEY (id_descrprop)
);

CREATE TABLE if NOT exists isosceles.usuario (
		id_usuario	INT NOT NULL AUTO_INCREMENT,
		id_personal		INT,
		id_tusuario		INT,
        id_domi	INT,
        id_contacto	INT,
        id_e_contacto  	int,
        usuario VARCHAR  (50) NOT NULL,
        contraseña	VARCHAR(35) NOT NULL,
		nombre			VARCHAR(30),
		apellido		VARCHAR(40),
        fecha_nac	DATE,
        PRIMARY KEY (id_usuario)
);

CREATE TABLE if NOT exists isosceles.info_personal (
		id_personal INT NOT NULL AUTO_INCREMENT,
        id_tipo INT NOT NULL,
        id_usuario	INT NOT NULL,
		num_personal	VARCHAR(30),
        PRIMARY KEY (id_personal)
);

 CREATE TABLE if NOT exists isosceles.domicilios (
		id_domi  INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT NOT NULL,
        id_pais  INT NOT  NULL,
        id_region	INT NOT NULL,
        domicilio	VARCHAR(50) NOT NULL,
        PRIMARY KEY (id_domi)
);

 CREATE TABLE if NOT exists isosceles.tipo_usuario (
		id_tusuario INT NOT NULL AUTO_INCREMENT,
        id_usuario  INT,
        categoria VARCHAR (50) NOT NULL,
        PRIMARY KEY (id_tusuario)
);

CREATE TABLE if NOT exists isosceles.deposito(
		id_deposito INT NOT NULL AUTO_INCREMENT,
        id_producto INT NOT NULL,
        id_domi INT NOT NULL,
        stock INT NOT NULL,
        PRIMARY KEY (id_deposito)
        -- FOREIGN KEY (id_producto) REFERENCES producto (id_producto),
		-- FOREIGN KEY (id_domi) REFERENCES domicilios (id_domi)
);
 
CREATE TABLE if NOT exists isosceles.info_finan_usuario(
		id_finan INT NOT NULL AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        id_entidad INT NOT NULL,
        id_tipo_cuenta INT NOT NULL,
        num_cuenta VARCHAR (30),
        alias VARCHAR (50),
        PRIMARY KEY (id_finan)
        -- FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
        -- FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad),
        -- FOREIGN KEY (id_tipo_cuenta) REFERENCES tipo_cuenta (id_tipo_cuenta)
);

	CREATE TABLE if NOT exists isosceles.info_finan_tarjetas_usuario(
		id_info_tarjeta INT NOT NULL AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        id_entidad INT NOT NULL,
        id_tipo_tarjeta INT NOT NULL,
        id_tarjeta INT NOT NULL,
        num_tarjeta VARCHAR (16),
        PRIMARY KEY (id_info_tarjeta)
        -- FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
        -- FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad),
        -- FOREIGN KEY (id_tipo_tarjeta) REFERENCES tipo_tarjeta (id_tipo_tarjeta),
        -- FOREIGN KEY (id_tarjeta) REFERENCES tarjeta (id_tarjeta)
);
	
    CREATE TABLE if NOT exists isosceles.finan_unificada_usuario(
		id_inf_glob_usuario INT NOT NULL AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        id_finan INT NOT NULL,
        id_info_tarjeta INT NOT NULL,
        PRIMARY KEY (id_inf_glob_usuario)
        -- FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
        -- FOREIGN KEY (id_finan) REFERENCES info_finan_usuario (id_finan),
        -- FOREIGN KEY (id_info_tarjeta) REFERENCES info_finan_tarjetas_usuario (id_info_tarjeta)
);

 CREATE TABLE if NOT exists isosceles.transaccion(
		id_trans INT NOT NULL AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        id_producto INT NOT NULL,
        fecha DATEtime NOT NULL,
        cantidad  INT NOT NULL,
        monto decimal (9,2),
        PRIMARY KEY (id_trans)
        -- FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
        -- FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);

 CREATE TABLE if NOT exists isosceles.contacto_tel(
		id_contacto INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT,
        num_tel VARCHAR(30),
        PRIMARY KEY (id_contacto)
);

CREATE TABLE if NOT exists isosceles.email_contacto(
		id_e_contacto INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT,
        email VARCHAR (30),
        PRIMARY KEY (id_e_contacto)
);

						-- DECLARACION DE LAS FK DE TODAS LAS TABLAS

ALTER TABLE isosceles.usuario
	ADD CONSTRAINT `fk_personal` FOREIGN KEY (id_personal) REFERENCES info_personal (id_personal),
	ADD CONSTRAINT `fk_tipousuario` FOREIGN KEY (id_tusuario) REFERENCES tipo_usuario (id_tusuario),
	ADD CONSTRAINT `fk_domi` FOREIGN KEY (id_domi) REFERENCES domicilios (id_domi),
	ADD CONSTRAINT `fk_e_contacto` FOREIGN KEY (id_e_contacto) REFERENCES email_contacto (id_e_contacto),
	ADD CONSTRAINT `fk_contacto` FOREIGN KEY (id_contacto) REFERENCES contacto_tel (id_contacto);
    
ALTER TABLE isosceles.producto
	ADD CONSTRAINT `fk_tipoproducto` FOREIGN KEY (id_tipo) REFERENCES tipo_pro (id_tipo);
 
ALTER TABLE isosceles.pro_descrip 
    ADD CONSTRAINT `fk_producto` FOREIGN KEY (id_producto) REFERENCES producto (id_producto);
    
ALTER TABLE isosceles.info_personal    
    ADD CONSTRAINT `fk_tipo` FOREIGN KEY (id_tipo) REFERENCES tipo_id (id_tipo),
	ADD CONSTRAINT `fk_usuariotipo` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);

ALTER TABLE isosceles.domicilios
	ADD CONSTRAINT `fk_domiusuarios` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	ADD CONSTRAINT `fk_pais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais),
	ADD CONSTRAINT `fk_region`  FOREIGN KEY (id_region) REFERENCES region (id_region);
    
ALTER TABLE isosceles.domicilios
	ADD CONSTRAINT `fk_domousua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	ADD  CONSTRAINT `fk_dompais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais),
	ADD CONSTRAINT `fk_domregion` FOREIGN KEY (id_region) REFERENCES region (id_region);
    
ALTER TABLE isosceles.tipo_usuario
	ADD CONSTRAINT `fk_tipousua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario); 
    
ALTER TABLE isosceles.deposito
	 ADD CONSTRAINT `fk_proendepo` FOREIGN KEY (id_producto) REFERENCES producto (id_producto),
	 ADD CONSTRAINT `fk_domidepo` FOREIGN KEY (id_domi) REFERENCES domicilios (id_domi);
     
ALTER TABLE isosceles.info_finan_usuario
     ADD CONSTRAINT `fk_finausuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	 ADD CONSTRAINT `fk_finanemisor` FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad),
	 ADD CONSTRAINT `fk_finantipo` FOREIGN KEY (id_tipo_cuenta) REFERENCES tipo_cuenta (id_tipo_cuenta);
     
ALTER TABLE isosceles.info_finan_tarjetas_usuario
     ADD CONSTRAINT `fk_tarjeusua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	 ADD CONSTRAINT `fk_tarjemi` FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad),
	 ADD CONSTRAINT `fk_tarjetipo` FOREIGN KEY (id_tipo_tarjeta) REFERENCES tipo_tarjeta (id_tipo_tarjeta),
	 ADD CONSTRAINT `fk_tarjeta` FOREIGN KEY (id_tarjeta) REFERENCES tarjeta (id_tarjeta);
    
ALTER TABLE isosceles.finan_unificada_usuario    
	ADD CONSTRAINT `fk_unifinance` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	ADD CONSTRAINT `fk_finan`  FOREIGN KEY (id_finan) REFERENCES info_finan_usuario (id_finan),
    ADD CONSTRAINT `fk_inftarjeta` FOREIGN KEY (id_info_tarjeta) REFERENCES info_finan_tarjetas_usuario (id_info_tarjeta);    
    
ALTER TABLE isosceles.transaccion
	ADD CONSTRAINT `fk_usuatransac` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    ADD CONSTRAINT `fk_productransac` FOREIGN KEY (id_producto) REFERENCES producto (id_producto);



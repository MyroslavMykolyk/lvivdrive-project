USE lvivdrive;

CREATE TABLE role (
  id INT NOT NULL AUTO_INCREMENT,  
  name ENUM('client', 'manager', 'administrator'),
  PRIMARY KEY (id));

CREATE TABLE user (
  id INT NOT NULL AUTO_INCREMENT,
  role_id INT NOT NULL,
  login VARCHAR(30) NOT NULL,
  password VARCHAR(30) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  passport_number VARCHAR(9) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES role (id));

CREATE TABLE car_class (
  id INT NOT NULL AUTO_INCREMENT,  
  name ENUM('Econom', 'Standart', 'Comfort', 'Business'),
  PRIMARY KEY (id));

CREATE TABLE car_model (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(60),
  PRIMARY KEY (id));

CREATE TABLE car (
  id INT NOT NULL AUTO_INCREMENT,
  car_class_id INT NOT NULL,
  car_model_id INT NOT NULL,
  color VARCHAR(30) NOT NULL,
  model_year VARCHAR (4) NOT NULL,
  vin_code VARCHAR(17) NOT NULL,
  registration_number VARCHAR(8) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (car_class_id) REFERENCES car_class (id),
  FOREIGN KEY (car_model_id) REFERENCES car_model (id));

CREATE TABLE status (
  id INT NOT NULL AUTO_INCREMENT,  
  name VARCHAR(30) NOT NULL,
  comment VARCHAR(200),
  PRIMARY KEY (id));

CREATE TABLE car_order (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  car_id INT NOT NULL,
  status_id INT NOT NULL,
  bill INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  includes_driver BIT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES user (id),
  FOREIGN KEY (car_id) REFERENCES car (id),
  FOREIGN KEY (status_id) REFERENCES status (id));

CREATE TABLE damage_bill (
  order_id INT AUTO_INCREMENT,
  damage_bill INT,
  PRIMARY KEY (order_id));

ALTER TABLE damage_bill ADD CONSTRAINT order_damage_bill FOREIGN KEY(order_id) REFERENCES car_order(id);
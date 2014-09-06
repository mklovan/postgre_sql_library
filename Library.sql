DROP TABLE IF EXISTS author CASCADE;
CREATE TABLE author 
(
	id_author serial PRIMARY KEY, 
	surname char(50), 
	name char(50), 
	second_name char(50) NULL
);

DROP TABLE IF EXISTS series CASCADE;
CREATE TABLE series 
(
	id_series serial PRIMARY KEY, 
 	name char(50)
);

DROP TABLE IF EXISTS category CASCADE;
CREATE TABLE category 
(
	id_category serial PRIMARY KEY, 
	name char(50)
);

DROP TABLE IF EXISTS publishing_house CASCADE;
CREATE TABLE publishing_house 
(
	id_publishing_house serial PRIMARY KEY, 
	name char(50)
);

DROP TABLE IF EXISTS "user" CASCADE;
CREATE TABLE "user"
(
	id_user serial PRIMARY KEY, 
	surname char(50), 
	name char(50), 
	second_name char(50) NULL, 
	registration_date date, 
	quit_date date NULL
);

DROP TABLE IF EXISTS book_name CASCADE;
CREATE TABLE book_name 
(
	id_book_name serial PRIMARY KEY, 
	name char(50), 
	series_id integer REFERENCES series
);

DROP TABLE IF EXISTS book CASCADE;
CREATE TABLE book 
(
	author_id integer REFERENCES author, 
	book_name_id integer REFERENCES book_name, 
	PRIMARY KEY (author_id, book_name_id)
);

DROP TABLE IF EXISTS book_exemplar CASCADE;
CREATE TABLE book_exemplar 
(
    id_book_exemplar serial PRIMARY KEY,
	book_name_id integer REFERENCES book_name, 
	publishing_house_id integer REFERENCES publishing_house, 
	edition_year integer, 
	cost money, 
	can_take_out boolean 
);

DROP TABLE IF EXISTS book_name_category CASCADE;
CREATE TABLE book_name_category 
(
	category_id integer REFERENCES category, 
	book_name_id integer REFERENCES book_name,
	PRIMARY KEY (category_id, book_name_id)
);

DROP TABLE IF EXISTS user_book CASCADE;
CREATE TABLE user_book
(
	user_id integer REFERENCES "user", 
	id_book_exemplar integer REFERENCES book_exemplar (id_book_exemplar), 
	issue_date date, 
	return_date date, 
	actual_return_date date NULL, 
	PRIMARY KEY (user_id, id_book_exemplar)
);

INSERT INTO author (surname,name,second_name)
	 VALUES ('Dostoevsky', 'Fedor', 'Myhalovych');

INSERT INTO author (surname, name, second_name) 
	 VALUES ('Tolstoy', 'Lev', 'Nykolaevych');

INSERT INTO author (surname, name)
	 VALUES ('Sapkovsky', 'Andjey');

INSERT INTO author (surname, name)
	 VALUES ('Rouling', 'Joan');

INSERT INTO author (surname,name,second_name)
	 VALUES ('Pushkyn', 'Aleksandr', 'Sergeyovych');

INSERT INTO series (name)
    VALUES ('War and Peace');

INSERT INTO series (name)
    VALUES ('Harry Potter');

INSERT INTO series (name)
    VALUES ('The Witcher'); 

INSERT INTO book_name (name)
	VALUES ('Prestuplenye y nakazanye');

INSERT INTO book_name (name, series_id)
 	VALUES ('War and Peace1', '1');

INSERT INTO book_name (name, series_id)
	VALUES ('War and Peace2', '1');

INSERT INTO book_name (name, series_id)
	VALUES ('War and Peace3', '1');

INSERT INTO book_name (name, series_id)
	VALUES ('War and Peace4', '1');

INSERT INTO book_name (name, series_id)
	VALUES ('Vedmak:Last wish', '3');

INSERT INTO book_name (name, series_id)
	VALUES ('Vedmak:Sword of Destiny', '3');

INSERT INTO book_name (name, series_id)
	VALUES ('Vedmak:Blood of Elves', '3');

INSERT INTO book_name (name, series_id)
    VALUES ('Vedmak:Time of Contempt', '3');

INSERT INTO book_name (name, series_id)
    VALUES ('Vedmak:Baptism of Fire', '3');

INSERT INTO book_name (name, series_id)
    VALUES ('Vedmak:The Swallow"s Tower', '3');

INSERT INTO book_name (name, series_id)
    VALUES ('Vedmak:Lady of the Lake', '3');

INSERT INTO book_name (name, series_id)
    VALUES ('Vedmak:Season of Storms', '3');

INSERT INTO book_name (name)
    VALUES ('Evgeny Onegyn');

INSERT INTO book_name (name, series_id)
    VALUES ('Harry Potter and the Philosopher"s Stone', '2');

INSERT INTO book_name (name, series_id)
    VALUES ('Harry Potter and the Chamber of Secrets', '2');

INSERT INTO book_name (name, series_id)
    VALUES ('Harry Potter and the Prisoner of Azkaban', '2');

INSERT INTO book_name (name, series_id)
    VALUES ('Harry Potter and the Goblet of Fire', '2');

INSERT INTO book_name (name, series_id)
    VALUES ('Harry Potter and the Order of the Phoenix', '2');

INSERT INTO book_name (name, series_id)
    VALUES ('Harry Potter and the Half-Blood Prince', '2');

INSERT INTO book_name (name, series_id)
    VALUES ('Harry Potter and the Deathly Hallows', '2');

INSERT INTO category (name)
    VALUES ('Historycal'); 

INSERT INTO category (name)
    VALUES ('Drama');  

INSERT INTO category (name)
    VALUES ('Adventure');  

INSERT INTO category (name)
    VALUES ('Fantasy');  

INSERT INTO category (name)
    VALUES ('Manual');  

INSERT INTO category (name)
    VALUES ('Crime fiction');  

INSERT INTO publishing_house (name)
   VALUES ('Harkov');  

INSERT INTO publishing_house (name)
   VALUES ('Ababagalamaga'); 

INSERT INTO publishing_house (name)
   VALUES ('Wilyams'); 

INSERT INTO publishing_house (name)
   VALUES ('Aris-press'); 

INSERT INTO publishing_house (name)
   VALUES ('ERA'); 

INSERT INTO publishing_house (name)
   VALUES ('Who is Who'); 

INSERT INTO "user" (surname, name, second_name, registration_date)
   VALUES ('Klovan','Marharyta', 'Vasylyvna', '2010-09-12');

INSERT INTO "user" (surname, name, second_name, registration_date)
   VALUES ('Klovan','Vyacheslav', 'Uryovych', '2011-02-25');  

INSERT INTO "user" (surname, name, second_name, registration_date)
   VALUES ('Vorchun','Nastya', 'Sergeyvna', '2011-09-23');

INSERT INTO "user" (surname, name, second_name, registration_date)
   VALUES ('Bazarnaya','Inna', 'Vasylyvna', '2012-12-12');

INSERT INTO "user" (surname, name, second_name, registration_date)
   VALUES ('Kotelenets','Vasyly', 'Vasylyovych', '2001-03-25');

INSERT INTO "user" (surname, name, second_name, registration_date)
   VALUES ('Kotelenets','Elena', 'Vasylyvna', '2000-06-30');

INSERT INTO "user" (surname, name, second_name, registration_date, quit_date)
   VALUES ('Buyadzhy','Ylia', 'Andreevna', '2009-02-28', '2014-07-04');

INSERT INTO "user" (surname, name, second_name, registration_date)
   VALUES ('Bogunow','Sergey', 'Sergeyovych', '2014-02-14');

INSERT INTO "user" (surname, name, second_name, registration_date)
   VALUES ('Trynder','Yury', 'Olegovych', '2013-09-29');

INSERT INTO "user" (surname, name, registration_date, quit_date)
   VALUES ('Qwerty','Sebastyan', '2000-12-29', '2013-01-23');

INSERT INTO "user" (surname, name, second_name, registration_date)
   VALUES ('Baraque','Obama', 'Hussein','2009-01-20');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('6', '1');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('1', '2');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('1', '3');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('1', '4');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('1', '5');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('2', '2');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('2', '3');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('2', '4');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('2', '5');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '6');

 INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '7');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '8');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '9');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '10');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '11');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '12');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '13');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '14');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('2', '15');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '6');

 INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '7');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '8');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '9');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '10');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '11');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '12');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '13');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '14');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '16');

 INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '17');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '18');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '19');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '20');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('3', '21');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '16');

 INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '17');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '18');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '19');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '20');

INSERT INTO book_name_category (category_id, book_name_id)
    VALUES ('5', '21');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('16', '2', '2000', '10', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('17', '2', '2001', '12', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('18', '2', '2002', '13', 'true') ;

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('19', '2', '2004', '14', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('20', '2', '2005', '15', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('21', '2', '2006', '16', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('15', '6', '1990', '2', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('15', '5', '1998', '4', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('15', '6', '1975', '0,5', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('16', '3', '2012', '20', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('17', '3', '2012', '20', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('18', '3', '2012', '20', 'true') ;

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('19', '3', '2012', '20', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('20', '3', '2012', '20', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('21', '3', '2012', '20', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('6', '1', '1992', '7', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('7', '1', '1993', '6', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('8', '1', '1995', '6', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('9', '1', '1996', '7', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('10', '1', '1997', '9', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('11', '1', '1998', '9', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('12', '1', '1999', '9', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('13', '1', '2000', '9', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('14', '1', '2013', '9', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('6', '4', '1992', '7', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('7', '4', '1993', '6', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('8', '4', '1995', '6', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('9', '4', '1996', '7', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('10', '4', '1997', '9', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('11', '4', '1998', '9', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('12', '4', '1999', '9', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('13', '4', '2000', '9', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('14', '4', '2013', '9', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('2', '5', '1900', '4', 'false');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('3', '5', '1900', '4', 'false');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('4', '5', '1900', '4', 'false');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('5', '5', '1900', '4', 'false');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('2', '1', '1980', '2', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('3', '1', '1980', '2', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('4', '1', '1980', '2', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('5', '1', '1980', '2', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('1', '1', '1890', '1', 'false');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('1', '3', '1990', '2', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('1', '5', '1997', '1', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('1', '6', '1991', '3', 'true');

INSERT INTO book_exemplar (book_name_id, publishing_house_id, edition_year, cost, can_take_out)
    VALUES ('15', '1', '1997', '7', 'true');     


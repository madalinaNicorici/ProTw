drop table `logs`;
drop table `keys`;
drop table rooms;
drop table users_quiz_status;
drop table quizzes;
drop table questions;
drop table users_status;
drop table game_levels;
drop table users_profile;

create table users_profile
(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  surname  VARCHAR(30) NOT NULL,
  username VARCHAR(30) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL,
  user_password VARCHAR(100) NOT NULL,
  status varchar(10) DEFAULT 'active',
  is_admin tinyint(4) DEFAULT 0,
  is_log tinyint(4) DEFAULT 0
);

create table game_levels
(
  level_id INT PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR(30),
  min_score INT
);

create table users_status
(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  points INT DEFAULT 0,
  level_id INT DEFAULT 1,
  CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users_profile(user_id),
  CONSTRAINT fk_level FOREIGN KEY(level_id) REFERENCES game_levels(level_id)
);


create table questions
(
  question_id INT PRIMARY KEY AUTO_INCREMENT,
  q_body VARCHAR(500),
  answer_r VARCHAR(200),
  answer_w1 VARCHAR(200),
  answer_w2 VARCHAR(200),
  answer_w3 VARCHAR(200),
  level_id INT,
  hint VARCHAR(500),
  source varchar(200) DEFAULT NULL,
  points INT DEFAULT 10,
  CONSTRAINT fk_level_q FOREIGN KEY(level_id) REFERENCES game_levels(level_id)
);

create table quizzes
(
  quiz_id INT PRIMARY KEY AUTO_INCREMENT,
  level_id INT,
  questions_list VARCHAR(500),
  CONSTRAINT fk_level_quiz FOREIGN KEY(level_id) REFERENCES game_levels(level_id)
);

create table users_quiz_status
(
  user_id INT, 
  quiz_id INT,
  result INT,
  PRIMARY KEY(user_id,quiz_id),
  CONSTRAINT fk_users FOREIGN KEY(user_id) REFERENCES users_profile(user_id),
  CONSTRAINT fk_quizz FOREIGN KEY(quiz_id) REFERENCES quizzes(quiz_id)
);

create table rooms 
(
	room_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30),
	room_password VARCHAR(30),
	player1 INT NOT NULL,
	player2 INT,
	player3 INT,
	player4 INT
);


CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, '123456', 0, 0, 0, NULL, 0);


insert into game_levels values (NULL, 'HTML + CSS', 0);
insert into game_levels values (NULL, 'PHP + JAVASCRIPT', 500);
insert into game_levels values (NULL, 'HTTP + COOKIE', 1000);
insert into game_levels values (NULL, 'REST + AJAX', 2000);
insert into game_levels values (NULL, 'MASHUP + SECURITY', 4000);

insert into quizzes(quiz_id,level_id) values(1,1);
insert into quizzes(quiz_id,level_id) values(2,1);
insert into quizzes(quiz_id,level_id) values(3,2);
insert into quizzes(quiz_id,level_id) values(4,2);
insert into quizzes(quiz_id,level_id) values(5,3);
insert into quizzes(quiz_id,level_id) values(6,4);

DELIMITER ;

CREATE OR REPLACE TRIGGER insert_user
AFTER INSERT ON users_profile
FOR EACH ROW
  INSERT INTO users_status(user_id) VALUES(NEW.user_id);
 
CREATE INDEX fast_score ON users_status (points, level_id);
CREATE INDEX fast_user ON users_profile (username, user_password);
  
 
INSERT INTO users_profile VALUES
	(1, 'Chaney', 'Moran', 'Lacota_Mckenzie', 'nec.mauris.blandit@Proin.net', 'AIf96GEm0PP', 'active', 0, 0),
	(2, 'Dustin', 'Clemons', 'Yuri_Price', 'eget@nuncsedpede.edu', 'KXj54HAr1AT', 'active', 1, 0),
	(3, 'Idona', 'Beck', 'Shelly_Daugherty', 'Aliquam.rutrum.lorem@nuncinterdumfeugiat.com', 'BAs91TAc8GY', 'active', 1, 0),
	(4, 'Sasha', 'Berry', 'Rowan_Tate', 'massa@faucibusorciluctus.org', 'VGo66EJm4AT', 'active', 0, 0),
	(5, 'Hamilton', 'Mcmahon', 'Vera_Holman', 'Donec.dignissim@non.net', 'TKe08MWk1PB', 'active', 0, 0),
	(6, 'Marah', 'Kidd', 'Amena_Hood', 'facilisi@necanteMaecenas.net', 'LOd41SDn2ZV', 'active', 0, 0),
	(7, 'Inez', 'Mason', 'Noel_Mitchell', 'lorem.eget@ante.com', 'WNj91USl6WA', 'active', 0, 0),
	(8, 'Isaiah', 'Lowe', 'Lareina_Ayala', 'ornare.placerat@euligulaAenean.org', 'IVn95XSz6ED', 'active', 0, 0),
	(9, 'Jolene', 'Payne', 'Naomi_Marshall', 'non.hendrerit@amet.org', 'PBu13IJt0FM', 'active', 0, 0),
	(10, 'Chaney', 'Joyce', 'Adrian_Lancaster', 'tellus.Aenean@lobortisquam.co', 'ICv41ZTg8IT', 'active', 0, 0),
	(11, 'Beatrice', 'Calhoun', 'Evan_Hunter', 'metus@urna.net', 'VYo99MLw6GU', 'active', 0, 0),
	(12, 'Zorita', 'Sykes', 'Hilel_Vazquez', 'Mauris.eu@tellusSuspendissesed.ca', 'WXz37WVw5TK', 'active', 0, 0),
	(13, 'Lucy', 'Brady', 'Aladdin_Harrington', 'Nulla.facilisis@parturientmontes.com', 'UVa77IOg9KH', 'active', 0, 0),
	(14, 'Leroy', 'Hewitt', 'Katell_Wilcox', 'pharetra.ut.pharetra@necquam.net', 'NZs06MZh5PN', 'active', 0, 0),
	(15, 'Cassidy', 'Burns', 'Ray_Solis', 'cursus@CurabiturmassaVestibulum.com', 'TSb86NXm4XL', 'active', 0, 0),
	(16, 'Marvin', 'Gay', 'Imogene_Gonzales', 'Sed.auctor@sodalespurus.com', 'RAv15UOj7MW', 'active', 0, 0),
	(17, 'Dustin', 'Cameron', 'Jerome_Franklin', 'Nunc@AeneanmassaInteger.edu', 'UIs53MUe5GP', 'active', 0, 0),
	(18, 'Tanek', 'Whitfield', 'Neve_Bowman', 'fringilla.cursus.purus@consectetueradipiscing.co', 'WHb75HDx2SH', 'active', 0, 0),
	(19, 'Susan', 'Atkins', 'Camille_Smith', 'neque.et.nunc@arcu.com', 'IYh92EOr0BZ', 'active', 0, 0),
	(20, 'Iona', 'Pickett', 'Justin_Morse', 'erat.nonummy@suscipitest.net', 'CIh31NUw8VX', 'active', 0, 0),
	(21, 'Maggie', 'Rodgers', 'Eleanor_Bailey', 'orci.adipiscing.non@atvelitPellentesque.edu', 'PGi22UOl1UE', 'active', 0, 0),
	(22, 'Lillian', 'Oneill', 'Carolyn_Nolan', 'dolor.sit@risusDuisa.edu', 'RSh44BWn3UU', 'active', 0, 0),
	(23, 'Rinah', 'Holmes', 'Michael_Roman', 'eu@egestas.edu', 'QJt88FPf8RQ', 'active', 0, 0),
	(24, 'Judith', 'Vargas', 'Kirk_Morales', 'Donec@Phasellus.ca', 'JOf51QIz4GY', 'active', 0, 0),
	(25, 'Nissim', 'Jennings', 'Blaine_Hutchinson', 'Cras.vehicula@cursus.co', 'DCe22NTc6OI', 'active', 0, 0),
	(26, 'Nell', 'Powell', 'Raphael_Middleton', 'Suspendisse.sed.dolor@Aliquamornare.net', 'HRd77DTg6ZU', 'active', 0, 0),
	(27, 'Gloria', 'Dickson', 'Chanda_Pratt', 'lacus.Quisque.imperdiet@posuerecubilia.org', 'GXz40PWg3YH', 'active', 0, 0),
	(28, 'Priscilla', 'Kim', 'Rowan_Livingston', 'ac@odiovelest.org', 'RIe09GYe1IP', 'active', 0, 0),
	(29, 'Isadora', 'Higgins', 'Dominic_Nichols', 'vulputate.lacus.Cras@nonummy.edu', 'ZHn05JEu1MJ', 'active', 0, 0),
	(30, 'Veda', 'Haley', 'Jade_Gillespie', 'Proin.non@elementumsem.edu', 'OWo26CVm3BY', 'active', 0, 0),
	(31, 'Josiah', 'Spence', 'Kibo_Weaver', 'risus.a@Aliquamgravidamauris.co', 'ZXy89UCx3AG', 'active', 0, 0),
	(32, 'Jerry', 'Chase', 'Fredericka_Hendrix', 'turpis.In@Maurismolestie.edu', 'ZEd78ZUm5SL', 'active', 0, 0),
	(33, 'Amber', 'Weiss', 'Rowan_Shields', 'odio.vel.est@Nullamvelit.net', 'VIa78NGr2ON', 'active', 0, 0),
	(34, 'Damon', 'Hutchinson', 'Griffith_Murray', 'arcu.eu.odio@liberoMorbi.net', 'COb34YLl2BJ', 'active', 0, 0),
	(35, 'Martina', 'Hawkins', 'Hedley_Haney', 'ligula.Aenean.gravida@commodotincidunt.org', 'XZz38YAw7BR', 'active', 0, 0),
	(36, 'Eleanor', 'Cox', 'Tiger_Chase', 'nibh@sedsapien.edu', 'NQd05OKj2QT', 'active', 0, 0),
	(37, 'Herrod', 'Knapp', 'Yeo_Dunn', 'massa.Quisque@Nuncquisarcu.com', 'RJb41KFp6BZ', 'active', 0, 0),
	(38, 'Gannon', 'Morin', 'Philip_Harris', 'augue@a.net', 'UBl80SPa4UR', 'active', 0, 0),
	(39, 'Mechelle', 'Beach', 'Wade_Fox', 'at.velit@molestieorcitincidunt.com', 'SDg77QIi8NB', 'active', 0, 0),
	(40, 'Odysseus', 'Tyson', 'Brianna_Kinney', 'urna.convallis@tellusSuspendissesed.ca', 'FPr18GUx5GA', 'active', 0, 0);
	
	
    INSERT  INTO questions VALUES( 1, 'What does HTML stand for?', 'Hyper Text Markup Language', 'Hyperlinks and Text Markup Language', 'Home Tool Markup Language','Heading Text Markup Language', 1, 'HTML is a markup language for describing web documents.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 2, 'Choose the correct HTML element for the largest heading:', '<h1>', '<heading>', '<head>', '<h6>', 1, 'HTML headings are defined with the <h1> to <h6> tags', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 3, 'What is the correct HTML element for inserting a line break?', '<br>', '<break>', '<lb>', '<ol>', 1, 'Use <br> if you want a line break (a new line) without starting a new paragraph', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 4, 'What is the correct HTML for adding a background color?', '<body style="background-color:yellow;">', '<background>yellow</background>', '<body bg="yellow">', '<body background="yellow">', 1, 'The background-color property defines the background color for an HTML element.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 5, 'Choose the correct HTML element to define important text:', '<strong>', '<b>', '<important>', '<i>', 1, 'The HTML ... element defines strong text, with added semantic "strong" importance.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 6, 'Choose the correct HTML element to define emphasized text:', '<em>', '<i>', '<italic>', '<b>', 1, 'The HTML <i> element defines italic text, without any extra importance and the HTML ...  element defines emphasized text, with added semantic importance.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 7, 'What is the correct HTML for creating a hyperlink?', '<a href="http://www.w3schools.com">W3Schools</a>', '<a>http://www.w3schools.com</a>', '<a name="http://www.w3schools.com">W3Schools.com</a>', '<a url="http://www.w3schools.com">W3Schools.com</a>
    ', 1, 'In HTML, links are defined with the <a> tag and the href attribute specifies the destination address.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 8, 'Which character is used to indicate an end tag?', '/', '*', '<', '^', 1, 'HTML elements are written with a start tag, with an end tag, with the content in between: <tagname>content</tagname>', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 9, 'How can you open a link in a new tab/browser window?', '<a href="url" target="_blank">', '<a href="url" target="new">', '<a href="url" new>', '<a hreaf="new" target="uri">', 1, 'The target attribute specifies where to open the linked document.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 10, 'Which of these elements are all <table> elements?', '<table><tr><td>', '<thead><body><tr>', '<table><tr><tt>', '<table><head><tfoot>', 1, 'Tables are defined with the <table> tag. Tables are divided into table rows with the <tr> tag.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 11, 'How can you make a numbered list?', '<ol>', '<dl>', '<list>', '<ul>', 1, 'An unordered list starts with the <ul> tag.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 12, 'How can you make a bulleted list?', '<ul>', '<list>', '<dl>', '<ol>', 1, 'An unordered list starts with the <ul> tag.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 13, 'What is the correct HTML for making a checkbox?', '<input type="checkbox">', '<check>', '<input type="check">', '<checkbox>', 1, 'The Input Checkbox object represents an HTML <input> element with checkbox attribute.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 14, 'What is the correct HTML for making a text input field?', '<input type="text">', '<input type="textfield">', '<textinput type="text">', '<textfield>', 1, '<input type="password"> defines a password field', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 15, 'What is the correct HTML for making a drop-down list?', '<select>', '<input type="list">', '<list>', '<input type="dropdown">', 1, 'The <option> tags inside the <select> element define the available options in the list.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 16, 'What is the correct HTML for making a text area?', '<textarea>', '<input type="textbox">', '<input type="textarea">', '<input type="text">', 1, 'The ... tag defines a multi-line text input control.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 17, 'What is the correct HTML for inserting an image?', '<img src="image.gif" alt="MyImage">', '<img alt="MyImage">image.gif</img>', '<img href="image.gif" alt="MyImage">', '<image src="image.gif" alt="MyImage">', 1, 'In HTML, images are defined with the <img> tag. The <img> tag is empty, it contains attributes only, and does not have a closing tag.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 18, 'What is the correct HTML for inserting a background image?', '<body style="background-image:url(background.gif)">', '<body bg="background.gif">', '<background img="background.gif">', '<background bg="background.gif">', 1, 'he <body> background attribute is not supported in HTML5.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 19, 'Which HTML element defines the title of a document?', '<title>', '<meta>', '<head>', '<body>', 1, 'The <head> element is a container for metadata. The following tags describe metadata: <title>, <style>, <meta>, <link>, <script>, and <base>.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    INSERT  INTO questions VALUES( 20, 'Which HTML attribute specifies an alternate text for an image, if the image cannot be displayed?', 'alt', 'src', 'longdesc', 'title', 1, 'The src attribute specifies the URL of the image', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10);
    /*--Intrebari CSS: */
    INSERT  INTO questions VALUES(21,'What does CSS stand for?','Cascading Style Sheets','Creative Style Sheets','Colorful Style Sheets','Computer Style Sheets',1,'Cascading Style Sheets','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10);
    INSERT  INTO questions VALUES(22,'What is the correct HTML for referring to an external style sheet?','<link rel="stylesheet" type="text/css" href="mystyle.css">','<stylesheet>mystyle.css</stylesheet>','<style src="mystyle.css">','<link rel="text/css">',1,'<link rel=...>','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(23,'Where in an HTML document is the correct place to refer to an external style sheet?','In the <head> section','At the end of the document', 'In the <body> section', 'At the beginning of the document',1,'To use an external style sheet, add a link to it in the <head> section of the HTML page','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(24,'Which HTML tag is used to define an internal style sheet?','<style>','<script>','<css>','<stylesheet>',1,'Nt with <script>','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(25,'Which HTML attribute is used to define inline styles?','style','class','font','styles',1,'Not class','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(26,'Which is the correct CSS syntax?','body {color: black;}','{body;color:black;}','body:color=black;',' {body:color=black;}',1,'body ...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(27,'How do you insert a comment in a CSS file?','/* this is a comment */',''' this is a comment','// this is a comment //','// this is a comment',1,'Not with //','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(28,'Which property is used to change the background color?','background-color','color','bgcolor','background',1,'background ...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(29,'How do you add a background color for all <h1> elements?',' h1 {background-color:#FFFFFF;}','h1.all {background-color:#FFFFFF;}','all.h1 {background-color:#FFFFFF;}','*.h1 {background-color:#FFFFFF;}',1,'h1...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(30,'Which CSS property is used to change the text color of an element?','color','text-color',' fgcolor','element-color',1,'Not fgcolor','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(31,'Which CSS property controls the text size?','font-size','font-style','text-size','text-style',1,'Not text-size','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(32,'What is the correct CSS syntax for making all the <p> elements bold?',' p {font-weight:bold;}','<p style="font-size:bold;">','<p style="text-size:bold;">','p {text-size:bold;}',1,'p ...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(33,'How do you display hyperlinks without an underline?','a {text-decoration:none;}','a {underline:none;}','a {decoration:no-underline;}',' {text-decoration:no-underline;}',1,'a ...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(34,'How do you make each word in a text start with a capital letter?','text-transform:capitalize','text-transform:uppercase','You can''t do that with CSS','text-transform:upper',1,'Not with uppercase','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(35,'Which property is used to change the font of an element?','Both font-family and font can be used','font-family','font','font-style',1,'Not only font','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(36,'How do you make the text bold?','font-weight:bold;','style:bold;','font:bold;','font-style:bold',1,'Not with style','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(37,'How do you display a border like this:The top border = 10 pixels, The bottom border = 5 pixels, The left border = 20 pixels, The right border = 1pixel?','border-width:10px 1px 5px 20px;','border-width:10px 20px 5px 1px;','border-width:5px 20px 10px 1px;','border-width:10px 5px 20px 1px;',1,'TOP RIGHT BOTTOM LEFT','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(38,'Which property is used to change the left margin of an element?' , 'margin-left', 'padding-left', 'indent', 'allign-left', 1, 'Not with padding-left','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(39,'How do you make a list that lists its items with squares?','list-style-type: square;','list-type: square;','list: square;','list-style: square',1,'list-style...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(40,'How do you select an element with id "demo"?','#demo','*demo','demo','.demo',1,'Not with *demo','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(41,'How do you select elements with class name "test"?','.test','test','*test',' #test',1,'Not with .test','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(42,'How do you select all p elements inside a div element?','div p','div + p','div.p','p.div',1,'div ...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(43,'How do you group selectors?','Separate each selector with a comma','Separate each selector with a space','Separate each selector with a plus sign','Separate each selector with a minus sign',1,'Not with space','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);
    INSERT  INTO questions VALUES(44,'What is the default value of the position property?','static','relative','fixed','absolute',1,'Not relative','http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS',10);   /*-- Level 2
    --Intrebari HTML5:*/
    INSERT  INTO questions VALUES( 45, 'What is the previous version of HTML, prior to HTML5?', 'HTML 4.01', 'HTML 4.9', 'HTML 4', 'HTML 4.1', 1, 'The last version for HTML4 is HTML 4.01', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 46, 'Which doctype is correct for HTML5?', '<!DOCTYPE html>', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5.0//EN" "http://www.w3.org/TR/html5/strict.dtd">', '<!DOCTYPE HTML5>', '<!DOCTYPE HTML>', 1, 'The DOCTYPE declaration for HTML5 is identical to the DOCTYPE declaration for HTML !','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 47, 'Which HTML5 element is used to specify a footer for a document or section?', '<footer>', '<bottom>', '<section>', '<head>', 1, 'The <f.....> element specifies a footer for a document or section.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 48, 'Which element is no longer supported in HTML5?', '<font>', '<menu>', '<ins>', '<q>', 1, '<acronym>, <applet>, <basefont>, <big>, <center>, <dir>, <font>, <frame>, <frameset>, <noframes>, <strike>, <tt> :not supported in HTML5','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 49, 'Which element is no longer supported in HTML5?', '<acronym>', '<base>', '<cite>', '<abbr>', 1, '<acronym>, <applet>, <basefont>, <big>, <center>, <dir>, <font>, <frame>, <frameset>, <noframes>, <strike>, <tt> :not supported in HTML5','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 50, 'In HTML5, onblur and onfocus are:', 'Event attributes', 'HTML elements', 'HTML attributes', 'Style attributes', 1, 'Onblur and onfocus are event .....','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 51, 'What is the correct HTML5 element for playing video files?', '<video>', '<media>', '<movie>', '<audio>', 1, 'Before HTML5, there was no standard for showing videos on a web page and now is the <v....> element','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 52, 'What is the correct HTML5 element for playing audio files?', '<audio>', '<mp3>', '<sound>', '<video>', 1, 'Before HTML5, there was no standard for playing audio files on a web page and now is the <a....> element','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 53, 'Which attribute for <script> elements is no longer required in HTML5?', '<type>', '<href>', '<rel>', '<src>', 1, 'Not <src>','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 54, 'In HTML5, which method is used to get the current location of a user?', 'getCurrentPosition()', 'getUserPosition()', 'getPosition()', 'getCurrent()', 1, 'getCurrent...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 55, 'The new HTML5 global attribute, "contenteditable" is used to:', 'Specify whether the content of an element should be editable or not', 'Specifies a context menu for an element. The menu appears when a user right-clicks on the element', 'Return the position of the first found occurrence of content inside a string', 'Update content from the server', 1, 'Specifies...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 56, 'In HTML5, contextmenu and spellcheck are:', 'HTML attributes', 'Style attributes', 'HTML elements', 'Event attributes', 1, 'HTML ...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 57, 'Graphics defined by SVG is in which format?', 'XML', 'HTML', 'CSS', 'PHP', 1, 'SVG defines the graphics in XML format','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 58, 'The <canvas> element in HTML5 is used to:', 'draw graphics', 'display database records', 'manipulate data in MySQL', 'create draggable elements', 1, 'The <canvas> element is only a container for graphics.You must use a script to actually draw the graphics.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 59, 'Which built-in HTML5 object is used to draw on the canvas?', 'getContext', 'getContent', 'getGraphics', 'getCanvas', 1, 'The getContext() method returns an object that provides methods and properties for drawing on the canvas.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 60, 'In HTML5, which attribute is used to specify that an input field must be filled out?', 'required', 'formvalidate', 'validate', 'placeholder', 1, 'A Required Field is a field that must be filled in with value before submission of a form. Required field sometimes known as Mandatory field or Compulsory field.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 61, 'Which input type defines a slider control?', 'range', 'slider', 'controls', 'search', 1, 'With the range input element, you can create sliding controls for your site users.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 62, 'Which input type defines a week and year control (no time zone)?', 'week', 'date', 'year', 'month', 1, 'The <input type="week"> allows the user to select a week and year (no time zone)','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 63, 'Which HTML5 element is used to display a scalar measurement within a known range?', '<meter>', '<measure>', '<range>', '<gauge>', 1, 'The <meter> tag defines a scalar measurement within a known range, or a fractional value. This is also known as a gauge.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 64, 'Which HTML5 element defines navigation links?', '<nav>', '<navig>', '<navigation>', '<navigate>', 1, 'The <nav> element is intended for large blocks of navigation links. However, not all links in a document should be inside a <nav> element!','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 65, 'In HTML5, what does the <aside> element define?', 'Content aside from the page content', 'A navigation list to be shown at the left side of the page', 'The ASCII character-set; to send information between computers on the Internet', 'something else....', 1, 'The <aside> tag defines some content aside from the content it is placed in. The aside content should be related to the surrounding content.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 66, 'Which HTML5 element is used to specify a header for a document or section?', '<header>', '<head>', '<section>', '<top>', 1, 'The <header> element specifies a header for a document or section. The <header> element should be used as a container for introductory content. You can have several <header> elements in one document.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);
    INSERT  INTO questions VALUES( 67, 'Which HTML5 element defines an article?', '<article>', '<content>', '<section>', '<header>', 1, 'The <article> element specifies independent, self-contained content. An article should make sense on its own, and it should be possible to read it independently from the rest of the web site.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20);

    /*--Intrebari PHP:*/
    INSERT  INTO questions VALUES( 68, 'What does PHP stand for?', 'PHP: Hypertext Preprocessor', 'Private Home Page', 'Personal Hypertext Processor', 'Personal Home Page', 2, 'PHP is an acronym for "PHP: Hypertext Preprocessor", PHP is a widely-used, open source scripting language, PHP scripts are executed on the server, PHP is free to download and use','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 69, 'PHP server scripts are surrounded by delimiters, which?', '<?php...?>', '<script>...</script>', '<&>...</&>', '<?php>...</?>', 2, 'A PHP script can be placed anywhere in the document. A PHP script starts with <?php and ends with ?>.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 70, 'How do you write "Hello World" in PHP', 'echo "Hello World";', 'Document.Write("Hello World");', '"Hello World";', '/''Hello World/', 2, 'The echo() function outputs one or more strings. The echo() function is not actually a function, so you are not required to use parentheses with it. However, if you want to pass more than one parameter to echo(), using parentheses will generate a parse error. The echo() function is slightly faster than print().','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 71, 'All variables in PHP start with which symbol?', '$', '!', '&', '*', 2, 'A variable starts with the $ sign, followed by the name of the variable. A variable name must start with a letter or the underscore character.','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 72, 'What is the correct way to end a PHP statement?', ';', '</php>', 'New line', '.', 2, 'PHP statements end with a semicolon (;).','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 73, 'The PHP syntax is most similar to:', 'Perl and C', 'JavaScript', 'VBScript', 'C', 2, 'C and ...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 74, 'How do you get information from a form that is submitted using the "get" method?', '$_GET[];', 'Request.QueryString;', 'Request.Form;', '/%%_GET[];', 2, 'Not with Request...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 75, 'What is the correct way to include the file "time.inc" ?', '<?php include "time.inc"; ?>', '<?php include:"time.inc"; ?>', '<?php include file="time.inc"; ?>', '<!-- include file="time.inc" -->', 2, '<?php include...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 76, 'What is the correct way to create a function in PHP?', 'function myFunction()', 'new_function myFunction()', 'create myFunction()', 'create function myFunction()', 2, 'Not with create','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 77, 'What is the correct way to open the file "time.txt" as readable?', 'fopen("time.txt","r");', 'open("time.txt","read");', 'fopen("time.txt","r+");', 'open("time.txt");', 2, 'fopen(....)','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 78, 'Which superglobal variable holds information about headers, paths, and script locations?', '$_SERVER', '$_SESSION', '$_GLOBALS', '%_GET', 2, '$_S....','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 79, 'What is the correct way to add 1 to the $count variable?', '$count++;', '$count =+1', '++count', 'count++;', 2, '$count...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 80, 'What is a correct way to add a comment in PHP?', '/*...*/', '*\...\*', '<!--...-->', '<comment>...</comment>', 2, 'Not with <! or *\\','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 81, 'Which one of these variables has an illegal name?', '$my-Var', '$myVar', '$my_Var', '$my_var', 2, 'myVar is corect','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 82, 'How do you create an array in PHP?', '$cars = array("Volvo", "BMW", "Toyota");', '$cars = "Volvo", "BMW", "Toyota";', '$cars = array["Volvo", "BMW", "Toyota"];', '$cars = ("Volvo", "BMW", "Toyota");', 2, '$cars = array...','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 83, 'Which operator is used to check if two values are equal and of same data type?', '===', '!=', '=', '==', 2, '===','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    /*--Intrebari JavaScript*/
    INSERT  INTO questions VALUES( 84, 'Inside which HTML element do we put the JavaScript?', '<script>', '<javascript>', '<scripting>', '<js>', 2, '','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 85, 'What is the correct JavaScript syntax to change the content of the HTML element below?', 'document.getElementById("demo").innerHTML = "Hello World!";', 'document.getElement("p").innerHTML = "Hello World!";', 'document.getElementByName("p").innerHTML = "Hello World!";', '#demo.innerHTML = "Hello World!";', 2, '','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 86, 'Where is the correct place to insert a JavaScript?', 'Both the <head> section and the <body> section are correct', 'The <head> section', 'The <body> section', 'Both the <head> section and the <body> section', 2, '','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 87, 'What is the correct syntax for referring to an external script called "xxx.js"?', '<script src="xxx.js">', '<script href="xxx.js">', '<script name="xxx.js">', '<script name=="xxx.js">', 2, '','http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 88, 'How do you write "Hello World" in an alert box?', 'alert("Hello World");', 'sgBox("Hello World");', 'alertBox("Hello World");', 'msg("Hello World");', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 89, 'How do you create a function in JavaScript?', 'function myFunction()', 'function:myFunction()', 'function=myFunction()', 'function.myFunction()', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 90, 'How do you call a function named "myFunction"?', 'myFunction()', 'call myFunction()', 'call function myFunction()', 'function myFunction()', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 91, 'How to write an IF statement in JavaScript?', 'if (i == 5)', 'if i = 5 then', 'if i = 5', 'if i == 5 then', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 92, 'How to write an IF statement for executing some code if "i" is NOT equal to 5?', 'if (i != 5)', 'if i =! 5 then', 'if i <> 5', 'if (i <> 5)', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 93, 'How does a WHILE loop start?', 'while (i <= 10)', 'while (i <= 10; i++)', 'while i = 1 to 10', 'while (i < 10)', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 94, 'How does a FOR loop start?', 'for (i = 0; i <= 5; i++)', 'for i = 1 to 5', 'for (i <= 5; i++)', 'for (i = 0; i <= 5)', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 95, 'How can you add a comment in a JavaScript?', '//This is a comment', '"This is a comment', '<!--This is a comment-->' ,'/*This is a comment', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 96, 'How to insert a comment that has more than one line?', '/*This comment has more than one line*/', '<!--This comment has more than one line-->', '//This comment has more than one line//', '//This comment has more than one line', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 97, 'What is the correct way to write a JavaScript array?', 'var colors = (1:"red", 2:"green", 3:"blue")', 'var colors = 1 = ("red"), 2 = ("green"), 3 = ("blue")', 'var colors = ["red", "green", "blue"]', 'var colors = "red", "green", "blue"', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 98, 'How do you round the number 7.25, to the nearest integer?', 'Math.round(7.25)', 'round(7.25)', 'Math.rnd(7.25)', 'rnd(7.25)', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 99, 'How do you find the number with the highest value of x and y?', 'Math.max(x, y)', 'top(x, y)', 'Math.ceil(x, y)', 'ceil(x, y)', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 100, 'What is the correct JavaScript syntax for opening a new window called "w2" ?', 'w2 = window.open("http://www.w3schools.com");', 'w2 = window.new("http://www.w3schools.com");', 'w2 = window.open.new("http://www.w3schools.com");', 'w2 = window.new.open("http://www.w3schools.com");', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 101, 'How can you detect the client''s browser name?', 'navigator.appName', 'client.navName', 'browser.name', 'nav.name', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 102, 'Which event occurs when the user clicks on an HTML element?', 'onclick', 'onmouseclick', 'onmouseover', 'onchange', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 103, 'How do you declare a JavaScript variable?', 'var carName;', 'var_carName;', 'v carName;', 'variable carName;', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    INSERT  INTO questions VALUES( 104, 'Which operator is used to assign a value to a variable?', '=', '*', 'x', '-', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20);
    /*-- Level 3
    -- Intrebari HTTP*/
    INSERT  INTO questions VALUES( 105, 'Multiple object can be sent over a TCP connection between client and server in ', 'persistent HTTP', 'nonpersistent HTTP', 'persistent HTTP and nonpersistent HTTP', 'none of the mentioned', 3, '', 'http://www.sanfoundry.com/computer-networks-questions-answers-http-ftp/', 30);
    INSERT  INTO questions VALUES( 106, 'HTTP is ________ protocol.', 'application layer', 'transport layer', 'network layer', 'none of the mentioned', 3, '', 'http://www.sanfoundry.com/computer-networks-questions-answers-http-ftp/', 30);
    INSERT  INTO questions VALUES( 107, 'In the network HTTP resources are located by ', 'uniform resource identifier', 'unique resource locator', 'unique resource identifier', 'none of the mentioned', 3, '', 'http://www.sanfoundry.com/computer-networks-questions-answers-http-ftp/', 30);
    INSERT  INTO questions VALUES( 108, 'In HTTP pipelining ', 'multiple HTTP requests are sent on a single TCP connection without waiting for the corresponding responses', 'multiple HTTP requests can not be sent on a single TCP connection', 'multiple HTTP requests are sent in a queue on a single TCP connection', 'none of the mentioned', 3, '', 'http://www.sanfoundry.com/computer-networks-questions-answers-http-ftp/', 30);
    INSERT  INTO questions VALUES( 109, 'HTTP client requests by establishing a __________ connection to a particular port on the server.', 'transmission control protocol', 'user datagram protocol', 'broader gateway protocol', 'none of the mentioned', 3, '', 'http://www.sanfoundry.com/computer-networks-questions-answers-http-ftp/', 30);
    INSERT  INTO questions VALUES( 110, 'The HTTP ____ contains metadata, like encoding information and HTTP methods in some cases.', 'header', 'URL', 'Body', 'Http Codes', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 111, '_____ is the most popular way of establishing an encrypted HTTP connection.', 'HTTPS', 'http://', 'HTTs', 'www', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 112, 'Hypertext Transfer Protocol is the protocol that allows for sending ___________ back and forth on the web.', 'text or documents', 'none', 'URL only', 'used for authentication', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 113, 'HTTP error messages, also called ______________ are response codes given by Web-servers and help identify the cause of the problem.', 'HTTP status codes', 'HTTP recovery codes', 'HTTP fix', 'HTTPs', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 114, 'With HTTP you can send __________,as long as both the client and the server know how to handle the data content.', 'any type of data', 'http Bolton send url', 'only text', 'audio', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 115, 'Hypertext Transfer Protocol (HTTP) is ____________ protocol.', 'connectionless', 'connection oriented', ' none', 'routing', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 116, '_______ HTTP code means the HTTP method used is not supported for this resource.', '405', '100', '401', '404', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 117, 'HTTP code ____ indicates that the required resource could not be found.', '404', '101', '400', '401', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 118, 'HTTP ___ code is used when processing fails due to unanticipated circumstances on the server side, which causes the server to error out.', '500', '401', '404', '505', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 119, 'HTTP ____ was the first documented version of HTTP.', 'V 0.9', 'V1', 'V 0.8', 'V 1.1', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 120, '_____ HTTP code means that the data does not pass validation, or is in the wrong format.', '400', '101', '404' ,'100', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 121, 'HTTP have two different roles that is server and client. In general, the ____ always start the conversation and the ____replies.', 'client, server', 'Server, client', 'none', 'URL', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 122, 'In http ______ method is used to retrieve information from the given server using a given URL. Requests using ____ should only retrieve data.', 'GET , GET', 'GET , post', 'post, post', 'none', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 123, 'The HTTP client and server exchange information about resources identified by ', 'URLs', 'HTML', 'hyper-text', 'SNTP', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 124, 'The Hypertext Transfer Protocol (HTTP) is an _____________ protocol.', 'application-level', 'layer-2', 'layer-3', 'physical', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    INSERT  INTO questions VALUES( 125, '_______ HTTP code means the client has requested the server to switch protocols and server is acknowledging it.', '101', '100', '404', '401', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30);
    -- Intrebari COOKIES
    INSERT  INTO questions VALUES( 126,'Where do Internet cookies come from?','a Web site''s server','the Internet''s central hub','outer space','from Google',3,'Internet cookies are produced by a central server for a Web site and uploaded onto a user''s computer when he or she first enters a site.','http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm',30);
    INSERT  INTO questions VALUES( 127,'Cookies store state information. What is that?','information about a user''s preferences','information about the size of your computer''s hard drive','top secrets that are surreptitiously stored on one user''s computer then moved to another','information about your personal lifestyle',3,'State information is details about your computer and preferences','http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm',30);
    INSERT  INTO questions VALUES( 128,'Other information that a cookie may store about a user doesn''t include:','preferences attached to other cookies','items in your online shopping cart','how often you visit a Web site','user''s preferences',3,'Cookies can''t look at other cookies','http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm',30);
    INSERT  INTO questions VALUES( 129,'If you want to erase your cookies, what folder should you access on your PC?','Temporary Internet Files','Web Activity folder','Drivers folder','Downloads Folder',3,'To erase cookies, you''ll have to go into your Temporary Internet Files folder.','http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm',30);
    INSERT  INTO questions VALUES( 130,'What''s "targeting" as far as Internet cookies are concerned?','focused marketing','the process of accessing a user''s cookie','finding a s physical location','the storing procces',3,'Targeting is essentially ___ marketing to Internet users based on information found in their cookies.','http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm',30);
    INSERT  INTO questions VALUES( 131,'DoubleClick is a company that produces cookies that:','can track users across the Internet','contain a user''s personal information','smell like real, fresh-baked cookies','are malware',3,'DoubleClick produces cookies that can track users across the Internet, not just on one site.','http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm',30);
    INSERT  INTO questions VALUES( 132,'The small, 1x1 pixel cookies implanted in banner ads are called:','Web bugs','devil cookies','Web scum','malware cookie',3,'Web bugs are tiny files hidden in banner ads that upload cookies onto a user''s machine when he or she clicks a banner ad.','http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm',30);
    INSERT  INTO questions VALUES( 133,'Cookies are written in what kind of text?','name-value pairs','ASCII','DOS','UTF8',3,'Cookies are written in name-value pairs. The name may be as simple as "UserID," and the value is a string of numbers and characters, the actual ID tag for the user''s computer.','http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm',30);
    /*-- Level 4
    -- Intrebari RESTful*/
    INSERT  INTO questions VALUES(134,'Which of the following is correct about web services?','Both of the above.','A web service is a collection of open protocols and standards used for exchanging data between applications or systems.','Software applications written in various programming languages and running on various platforms can use web services to exchange data among them over computer networks like the Internet.','None of the above.',4,'A web service is a collection of open protocols and standards used for exchanging data between applications or systems. Software applications written in various programming languages and running on various platforms can use web services to exchange data over computer networks like the Internet in a manner similar to inter-process communication on a single computer.','http://cronyweb.com/tutorials/restful/restful_online_quiz.html',40);
    INSERT  INTO questions VALUES(135,'Which of the following component of HTTP request contains metadata for the HTTP Request message as key-value pairs?','Request Header','VERB','URI','HTTP Version',4,'Request Header ? Contains metadata for the HTTP Request message as key-value pairs. For example, client ( or browser) type, format supported by client, format of message body, cache settings etc.','http://www.tutorialspoint.com/restful/restful_mock_test.htm',40);
    INSERT  INTO questions VALUES(136,'Which of the following is advantage of RESTful web service being stateless?','All of the above.','Web services can treat each method request independently.','Web services need not to maintain client''s previous interactions. It simplifies application design.','As HTTP is itself a statelessness protocol, RESTful Web services work seamlessly with HTTP protocol.',4,'','http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=26&max=50',40);
    INSERT  INTO questions VALUES(137,'Which of the following HTTP method should be used to get list the supported operations in RESTful web service?','OPTIONS','GET','HEAD','PUT',4,'OPTIONS opearations should be used to get list the supported operations in RESTful web service.','http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=26&max=50',40);
    INSERT  INTO questions VALUES(138,'Which of the following directive of Cache Control Header of HTTP response can set the time limit of caching?','max-age','Public','Private','no-cache/no-store',4,'max-age directive indicates that the caching is valid up to max-age in seconds. After this, client has to make another request.','http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=26&max=50',40);
    INSERT  INTO questions VALUES(139,'Which of the following HTTP Status code means NOT MODIFIED, used to reduce network bandwidth usage in case of conditional GET requests?','304','200','201','204',4,'HTTP Status Code 304 means NOT MODIFIED, used to reduce network bandwidth usage in case of conditional GET requests.','http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=51&max=75',40);
    INSERT  INTO questions VALUES(140,'Which of the following annotation of JAX RS API is used to annotate a method used to fetch resource?','@GET','@Path','@PUT','@POST',4,'HTTP Get request, used to fetch resource.','http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=51&max=75',40);
    INSERT  INTO questions VALUES(141,'Which of the following annotation of JAX RS API states the HTTP Response generated by web service?','@Produces','@DELETE','@HEAD','@Consumes',4,'@Produces ? States the HTTP Response generated by web service, for example APPLICATION/XML, TEXT/HTML, APPLICATION/JSON etc','http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=51&max=75',40);
    /*-- Intrebari AJAX*/
    INSERT  INTO questions VALUES( 142, 'What is the name of the DLL that contains Ajax control tool kit?', 'Ajaxcontroltoolkit.dll', 'Ajaxtoolkit.dll', 'Ajaxcontrol.dll', 'control.dll', 4, '', 'http://career.guru99.com/ajax-quiz/', 40);
    INSERT  INTO questions VALUES( 143, 'Which property is used to control the duration of Ajax request.', 'AsyncPostBackTimeout', 'AsyncTimeout', 'Timeout', 'PostBackTimeout', 4, '', 'http://career.guru99.com/ajax-quiz/', 40);
    INSERT  INTO questions VALUES( 144, 'Which property is used to check whether AJAX request has been completed.', 'readyState', 'ready', 'open', 'onreadyState', 4, '', 'http://career.guru99.com/ajax-quiz/', 40);
    INSERT  INTO questions VALUES( 145, 'How can you test the Ajax code?', 'JSUnit', 'JSU', 'AjaxJSU', 'JSUnitAjax', 4, '', 'http://career.guru99.com/ajax-quiz/', 40);
    INSERT  INTO questions VALUES( 146, 'How can we cancel the XMLHttpRequest in AJAX?', 'Abort()', 'cancel()', 'remove()', 'none', 4, '', 'http://career.guru99.com/ajax-quiz/', 40);
    INSERT  INTO questions VALUES( 147, 'What is the name of object used for AJAX request?', 'Request', 'XMLHTTPRequest', 'xmlRequest', 'HttpRequest', 4, '', 'http://career.guru99.com/ajax-quiz/', 40);
    INSERT  INTO questions VALUES( 148, 'Which manager are use for pre-requisite Update Panel in Ajax.', 'Script Manager', 'Javascript Manager and Ajax Manager', 'Javascript Manager', 'Ajax Manager', 4, '', 'http://career.guru99.com/ajax-quiz/', 40);
    INSERT  INTO questions VALUES( 149, 'Ajax is a…', 'Technology', 'Programing Language', 'Programing Language and OOPs concepts', 'OOPs concepts', 4, '', 'http://career.guru99.com/ajax-quiz/', 40);
    /*-- Level 5
    -- Intrebari SECURITY*/
    INSERT  INTO questions VALUES( 150, 'A session-based system authenticates a user to a Web site to provide access to restricted resources. To increase security in this scenario, an authentication token should meet which of the following requirements?', 'It should always use a non-persistent cookie.', 'It should identify returning users to the site.', 'It should be public information.', 'It should always use a persistent cookie.', 5, '', 'https://websecurity.firebaseapp.com/', 50);
    INSERT  INTO questions VALUES( 151, 'Which of the following is the best way to protect a Web application from unvalidated redirects and forwards?', 'Validate the referrer header.', 'Use extended validation certificates.', 'Use the escaping technique.', 'Disallow requests to unauthorized file types.', 5, '', 'https://websecurity.firebaseapp.com/' ,50);
    INSERT  INTO questions VALUES( 152, 'Which mitigation technique helps you tell the parser that a specific character is a literal and not a control character?', 'Escaping', 'Table indirection', 'Allow list', 'Block list', 5, '', 'https://websecurity.firebaseapp.com/', 50);
    INSERT  INTO questions VALUES( 153, 'Which of the following is most vulnerable to injection attacks?', 'Regular expressions', 'Server configuration files', 'Registry keys', 'Session IDs', 5, '', 'https://websecurity.firebaseapp.com/', 50);
    INSERT  INTO questions VALUES( 154, 'Which of the following vulnerabilities is most likely to occur due to an insecure direct object reference attack?', 'Accessing a resource without authorization.', 'Executing commands on the server.', 'Impersonating any user on the system.', 'Modifying SQL data pointed to by the query.', 5, '', 'https://websecurity.firebaseapp.com/', 50);
    INSERT  INTO questions VALUES( 155, 'Which of the following actions should you take to test the security of your Web application?', 'Use your browser to forge unauthorized requests.', 'Set the secure flag on session ID cookies.', 'Use policy mechanisms.', 'Use a simple and positive model at every layer.', 5, '', 'https://websecurity.firebaseapp.com/', 50);
    INSERT  INTO questions VALUES( 156, 'Which of the following procedures are involved in the hardening process?', 'Disable unnecessary features.', 'Resubmit POST parameters during redirection.', 'Update the environment with changes only when needed.', 'Repeat the process at random intervals.', 5, '', 'https://websecurity.firebaseapp.com/', 50);
    INSERT  INTO questions VALUES( 157, 'Which of the following factors helps you secure keys?', 'Complexity', 'Escaping', 'Session-based indirection', 'Encryption', 5, '', 'https://websecurity.firebaseapp.com/', 50);
    INSERT  INTO questions VALUES( 158, 'A user is able to pass malicious input that invokes control codes in your Web application. Which vulnerability is most likely to occur in your Web application?', 'Injection', 'Insufficient transport layer protection', 'Insecure direct object references', 'Failure to restrict URL access', 5, '', 'https://websecurity.firebaseapp.com/', 50);
    INSERT  INTO questions VALUES( 159, 'Which of the following is the best way to reevaluate your environment and address new threats?', 'Add or remove network segments.', 'Use the white-list validation of allowed input technique.', 'Use your browser to forge unauthorized requests.', 'Use custom cryptographic algorithms.', 5, '', 'https://websecurity.firebaseapp.com/', 50);
    INSERT  INTO questions VALUES( 160, 'Which of the following is most likely to result from unvalidated redirects and forwards?', 'Bypassed authorization checks', 'Brute force attack', 'Network sniffing', 'Man-in-the-middle attack', 5, '', 'https://websecurity.firebaseapp.com/', 50);

	
   INSERT INTO rooms(name,room_password,player1,player2) VALUES('Room1','',1,41);
	    
DELIMITER //
CREATE OR REPLACE PROCEDURE add_answer(IN p_user_id INT, IN p_quiz_id INT, IN p_result INT)
BEGIN
      DECLARE v_count INT;
      DECLARE v_answer_r VARCHAR(200);
      DECLARE v_point INT DEFAULT(10);
      DECLARE v_result INT;
      SET v_count=0;
      select count(*) into v_count from users_quiz_status where user_id = p_user_id and quiz_id = p_quiz_id;
      if(v_count = 0) then
        insert into users_quiz_status(user_id,quiz_id) values(p_user_id, p_quiz_id);
      end if;
      select level_id into v_point from quizzes where quiz_id = p_quiz_id;
      SET v_point = v_point * 10;
      call update_level(p_user_id, p_result, v_point, p_quiz_id);
    END//
    
DELIMITER //	
CREATE OR REPLACE PROCEDURE update_level(IN p_user_id INT, IN p_result INT, IN v_point INT, IN p_quiz_id INT)
BEGIN
	DECLARE v_result INT;
	DECLARE c_level INT;
	DECLARE c_points INT;
	DECLARE level_points INT;
	DECLARE next_lev_points INT;
		
	select result into v_result from users_quiz_status WHERE user_id = p_user_id and quiz_id = p_quiz_id;
	if(v_result is not null) then
          UPDATE users_quiz_status SET result = result + p_result * v_point WHERE user_id = p_user_id and quiz_id = p_quiz_id;
          UPDATE users_status SET points = points + p_result * v_point WHERE user_id = p_user_id;
        else
          UPDATE users_quiz_status SET result = p_result * v_point WHERE user_id = p_user_id and quiz_id = p_quiz_id;
          
          UPDATE users_status SET points = points + p_result * v_point WHERE user_id = p_user_id;
        end if;
   select level_id into c_level from users_status where user_id = p_user_id;
   select min_score into level_points from game_levels where level_id = c_level + 1;
   select min_score into next_lev_points from game_levels where level_id = c_level + 2;
   select points into c_points from users_status where user_id = p_user_id;
   if (c_points >= level_points) then
    	UPDATE users_status SET level_id = level_id + 1 WHERE user_id = p_user_id;
    	if (c_points >= next_lev_points) then
    		UPDATE users_status SET level_id = level_id + 1 WHERE user_id = p_user_id;
   	end if;
   end if;
END//
	  

DELIMITER //

CREATE OR REPLACE FUNCTION return_quiz_id(p_user_id INT) returns INT DETERMINISTIC
    BEGIN 
    	DECLARE v_level_id, v_start, v_end, v_quiz_id INT;
      select level_id into v_level_id from users_status where user_id = p_user_id;
      select quiz_id into v_start from quizzes where level_id  = v_level_id order by quiz_id limit 1;
      select quiz_id into v_end from quizzes where level_id  = v_level_id order by quiz_id DESC limit 1;
      select (floor(rand()*(v_end)) + v_start) into v_quiz_id from dual;
		return v_quiz_id;
    END //

    
    
DROP PROCEDURE IF EXISTS populate_quiz;

DELIMITER //

CREATE OR REPLACE PROCEDURE populate_quiz()
BEGIN
  		DECLARE done INT DEFAULT FALSE;
  		DECLARE question_list VARCHAR(500);
   	DECLARE v_start,v_end,v_check INT;
   	DECLARE q_id,l_id INT;
   	DECLARE  v_question_id INT;
   	DECLARE  v_ok TINYINT;
  		DECLARE  v_count_existent_question INT;
   	DECLARE  i INT ;
   	DECLARE  existent_question VARCHAR(500);
   	DECLARE cc CURSOR FOR select quiz_id,level_id from quizzes;
   	
   	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  		OPEN cc;
		
  		
  		for_loop: LOOP	
  			
  			FETCH cc into q_id,l_id;
			IF done THEN
      		LEAVE for_loop;
      	end if;
	    	if l_id = 6 then
	        		SET v_start = 1;
	        		select count(*) into v_end from questions;
	    	else
	     			select question_id into v_start from questions where level_id = l_id order by question_id LIMIT 1;
	      		select question_id into v_end from questions where level_id = l_id order by question_id DESC LIMIT 1;
	    			SET i = 0;
		    		label1 : LOOP
		    		SET i = i + 1;
		    		IF i < 11 THEN
		    			SET v_check = 1;
		    			
		    			select (floor(rand()*(v_end - v_start) + v_start)) into v_question_id from dual;
		    			if i = 1 then
		    				SET question_list = v_question_id;
		    				SET question_list = concat(question_list, ",");
		    				update quizzes set questions_list = question_list where quiz_id = q_id; 
		    			else
		    				while v_check > 0 do
			    				select find_in_set(v_question_id,question_list) into v_check;
			    				if v_check <> 0 then
			    					select (floor(rand()*(v_end - v_start) + v_start)) into v_question_id from dual;
			    				else
								 	SET question_list = concat(question_list, v_question_id);
								 	SET question_list = concat(question_list, ",");
								 	update quizzes set questions_list = question_list where quiz_id = q_id; 
						 		end if;
		    				end while;
		    			end if;	
		    		ELSE 
		    			LEAVE label1;
		    		END IF;
		    		END LOOP label1;
	    	end if;
    	
  		end loop for_loop;	
  		close cc;
  		
  END//
call populate_quiz;
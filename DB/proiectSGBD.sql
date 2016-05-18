set serveroutput on;
DROP INDEX fast_score;
DROP INDEX fast_user;
drop trigger insert_user;
drop table users_status cascade constraints;
drop table users_quiz_status cascade constraints;
drop table users_profile cascade constraints;
drop table quizzes cascade constraints;
drop table game_levels cascade constraints;
drop table questions cascade constraints;


create table users_profile
(
  user_id INT PRIMARY KEY,
  name VARCHAR2(30) NOT NULL,
  surname  VARCHAR2(30) NOT NULL,
  username VARCHAR2(30) NOT NULL,
  email VARCHAR2(100) NOT NULL,
  user_password VARCHAR2(100) NOT NULL
);
/
create table game_levels
(
  level_id INT PRIMARY KEY,
  description VARCHAR2(30),
  min_score INT
);
/
create table users_status
(
  user_id INT PRIMARY KEY,
  points INT DEFAULT 0,
  level_id INT DEFAULT 1,
  CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users_profile(user_id),
  CONSTRAINT fk_level FOREIGN KEY(level_id) REFERENCES game_levels(level_id)
);
/

create table questions
(
  question_id INT PRIMARY KEY,
  q_body VARCHAR2(500),
  answer_r VARCHAR2(200),
  answer_w1 VARCHAR2(200),
  answer_w2 VARCHAR2(200),
  answer_w3 VARCHAR2(200),
  level_id INT,
  hint VARCHAR2(500),
  points INT DEFAULT 10,
  CONSTRAINT fk_level_q FOREIGN KEY(level_id) REFERENCES game_levels(level_id)
);
/
CREATE OR REPLACE TYPE q_list AS TABLE OF INT;
/
create table quizzes
(
  quiz_id INT PRIMARY KEY,
  level_id INT,
  questions_list q_list,
  CONSTRAINT fk_level_quiz FOREIGN KEY(level_id) REFERENCES game_levels(level_id)
)NESTED TABLE questions_list STORE AS list_q;
/
create table users_quiz_status
(
  user_id INT, 
  quiz_id INT,
  result INT,
  PRIMARY KEY(user_id,quiz_id),
  CONSTRAINT fk_users FOREIGN KEY(user_id) REFERENCES users_profile(user_id),
  CONSTRAINT fk_quizz FOREIGN KEY(quiz_id) REFERENCES quizzes(quiz_id)
);
/

insert into game_levels values (1, 'HTML + CSS', 0);
insert into game_levels values (2, 'PHP + JAVASCRIPT', 500);
insert into game_levels values (3, 'HTTP + COOKIE', 1000);
insert into game_levels values (4, 'REST + AJAX', 2000);
insert into game_levels values (5, 'MASHUP + SECURITY', 4000);
/

insert into quizzes(quiz_id,level_id) values(1,1);
insert into quizzes(quiz_id,level_id) values(2,1);
insert into quizzes(quiz_id,level_id) values(3,2);
insert into quizzes(quiz_id,level_id) values(4,2);
insert into quizzes(quiz_id,level_id) values(5,3);
insert into quizzes(quiz_id,level_id) values(6,4);
/


CREATE OR REPLACE TRIGGER insert_user
AFTER INSERT ON users_profile
FOR EACH ROW
BEGIN
  INSERT INTO users_status(user_id) VALUES(:NEW.user_id);
END;
/

CREATE INDEX fast_score ON users_status (points, level_id);
CREATE INDEX fast_user ON users_profile (username, user_password);

declare
  v_i NUMBER;
begin
  for v_i in 1..10000 loop
    insert into users_profile values(v_i, 'user'||v_i, 'kid'||v_i, 'username'||v_i, 'tux'||v_i||'@tuxi.com', 'MD5'||v_i);
  end loop;
end;
/

CREATE OR REPLACE PACKAGE quiz_pack AS
  PROCEDURE populate_quiz;
  PROCEDURE populate_question;
END quiz_pack;

/
CREATE OR REPLACE PACKAGE BODY quiz_pack AS


  PROCEDURE populate_quiz AS
    question_list q_list;
    v_start INT;
    v_end INT;
    v_check INT;
    v_question_id INT;
    v_ok BOOLEAN;
    v_count_existent_question INT;
    i INT;
    existent_question q_list;
  BEGIN
  for v_linie in (select quiz_id,level_id from quizzes) loop
    question_list := q_list();
    question_list.extend(10);
    
    if(v_linie.level_id = 6) then
        v_start := 1;
        select count(*) into v_end from questions;
    else
      select question_id into v_start from (select * from questions where level_id = v_linie.level_id order by question_id) where rownum = 1;
      select question_id into v_end from (select * from questions where level_id = v_linie.level_id order by question_id DESC) where rownum = 1;
    end if;
    for i in 1..10 loop
      --select questions_list into existent_question from quizzez where quiz_id = v_linie.quiz_id;
      question_list(i):= dbms_random.value(v_start, v_end);
      loop
        select count(*) into v_check FROM quizzes t1, TABLE(t1.questions_list) t2 where t1.quiz_id = v_linie.quiz_id and column_value = question_list(i); 
        if(v_check<>0) then
          question_list(i):= dbms_random.value(v_start, v_end);
        else
          update quizzes set questions_list = question_list where quiz_id = v_linie.quiz_id;  
        end if;
        exit when v_check=0;   
      end loop;
    end loop;  
    update quizzes set questions_list = question_list where quiz_id = v_linie.quiz_id;  
  end loop;
  END populate_quiz;


   PROCEDURE populate_question AS 

    BEGIN
    
    INSERT  INTO questions VALUES( 1, 'What does HTML stand for?', 'Hyper Text Markup Language', 'Hyperlinks and Text Markup Language', 'Home Tool Markup Language','Heading Text Markup Language', 1, 'HTML is a markup language for describing web documents.', 10);
    INSERT  INTO questions VALUES( 2, 'Choose the correct HTML element for the largest heading:', '<h1>', '<heading>', '<head>', '<h6>', 1, 'HTML headings are defined with the <h1> to <h6> tags', 10);
    INSERT  INTO questions VALUES( 3, 'What is the correct HTML element for inserting a line break?', '<br>', '<break>', '<lb>', '<ol>', 1, 'Use <br> if you want a line break (a new line) without starting a new paragraph', 10);
    INSERT  INTO questions VALUES( 4, 'What is the correct HTML for adding a background color?', '<body style="background-color:yellow;">', '<background>yellow</background>', '<body bg="yellow">', '<body background="yellow">', 1, 'The background-color property defines the background color for an HTML element.', 10);
    INSERT  INTO questions VALUES( 5, 'Choose the correct HTML element to define important text:', '<strong>', '<b>', '<important>', '<i>', 1, 'The HTML ... element defines strong text, with added semantic "strong" importance.', 10);
    INSERT  INTO questions VALUES( 6, 'Choose the correct HTML element to define emphasized text:', '<em>', '<i>', '<italic>', '<b>', 1, 'The HTML <i> element defines italic text, without any extra importance and the HTML ...  element defines emphasized text, with added semantic importance.', 10);
    INSERT  INTO questions VALUES( 7, 'What is the correct HTML for creating a hyperlink?', '<a href="http://www.w3schools.com">W3Schools</a>', '<a>http://www.w3schools.com</a>', '<a name="http://www.w3schools.com">W3Schools.com</a>', '<a url="http://www.w3schools.com">W3Schools.com</a>
    ', 1, 'In HTML, links are defined with the <a> tag and the href attribute specifies the destination address.', 10);
    INSERT  INTO questions VALUES( 8, 'Which character is used to indicate an end tag?', '/', '*', '<', '^', 1, 'HTML elements are written with a start tag, with an end tag, with the content in between: <tagname>content</tagname>', 10);
    INSERT  INTO questions VALUES( 9, 'How can you open a link in a new tab/browser window?', '<a href="url" target="_blank">', '<a href="url" target="new">', '<a href="url" new>', '<a hreaf="new" target="uri">', 1, 'The target attribute specifies where to open the linked document.', 10);
    INSERT  INTO questions VALUES( 10, 'Which of these elements are all <table> elements?', '<table><tr><td>', '<thead><body><tr>', '<table><tr><tt>', '<table><head><tfoot>', 1, 'Tables are defined with the <table> tag. Tables are divided into table rows with the <tr> tag.', 10);
    INSERT  INTO questions VALUES( 11, 'How can you make a numbered list?', '<ol>', '<dl>', '<list>', '<ul>', 1, 'An unordered list starts with the <ul> tag.', 10);
    INSERT  INTO questions VALUES( 12, 'How can you make a bulleted list?', '<ul>', '<list>', '<dl>', '<ol>', 1, 'An unordered list starts with the <ul> tag.', 10);
    INSERT  INTO questions VALUES( 13, 'What is the correct HTML for making a checkbox?', '<input type="checkbox">', '<check>', '<input type="check">', '<checkbox>', 1, 'The Input Checkbox object represents an HTML <input> element with checkbox attribute.', 10);
    INSERT  INTO questions VALUES( 14, 'What is the correct HTML for making a text input field?', '<input type="text">', '<input type="textfield">', '<textinput type="text">', '<textfield>', 1, '<input type="password"> defines a password field', 10);
    INSERT  INTO questions VALUES( 15, 'What is the correct HTML for making a drop-down list?', '<select>', '<input type="list">', '<list>', '<input type="dropdown">', 1, 'The <option> tags inside the <select> element define the available options in the list.', 10);
    INSERT  INTO questions VALUES( 16, 'What is the correct HTML for making a text area?', '<textarea>', '<input type="textbox">', '<input type="textarea">', '<input type="text">', 1, 'The ... tag defines a multi-line text input control.', 10);
    INSERT  INTO questions VALUES( 17, 'What is the correct HTML for inserting an image?', '<img src="image.gif" alt="MyImage">', '<img alt="MyImage">image.gif</img>', '<img href="image.gif" alt="MyImage">', '<image src="image.gif" alt="MyImage">', 1, 'In HTML, images are defined with the <img> tag. The <img> tag is empty, it contains attributes only, and does not have a closing tag.', 10);
    INSERT  INTO questions VALUES( 18, 'What is the correct HTML for inserting a background image?', '<body style="background-image:url(background.gif)">', '<body bg="background.gif">', '<background img="background.gif">', '<background bg="background.gif">', 1, 'he <body> background attribute is not supported in HTML5.', 10);
    INSERT  INTO questions VALUES( 19, 'Which HTML element defines the title of a document?', '<title>', '<meta>', '<head>', '<body>', 1, 'The <head> element is a container for metadata. The following tags describe metadata: <title>, <style>, <meta>, <link>, <script>, and <base>.', 10);
    INSERT  INTO questions VALUES( 20, 'Which HTML attribute specifies an alternate text for an image, if the image cannot be displayed?', 'alt', 'src', 'longdesc', 'title', 1, 'The src attribute specifies the URL of the image', 10);
    --Intrebari CSS: 
    INSERT  INTO questions VALUES(21,'What does CSS stand for?','Cascading Style Sheets','Creative Style Sheets','Colorful Style Sheets','Computer Style Sheets',1,'',10);
    INSERT  INTO questions VALUES(22,'What is the correct HTML for referring to an external style sheet?','<link rel="stylesheet" type="text/css" href="mystyle.css">','<stylesheet>mystyle.css</stylesheet>','<style src="mystyle.css">','<link rel="text/css">',1,'',10);
    INSERT  INTO questions VALUES(23,'Where in an HTML document is the correct place to refer to an external style sheet?','In the <head> section','At the end of the document', 'In the <body> section', 'At the beginning of the document',1,'',10);
    INSERT  INTO questions VALUES(24,'Which HTML tag is used to define an internal style sheet?','<style>','<script>','<css>','<stylesheet>',1,'',10);
    INSERT  INTO questions VALUES(25,'Which HTML attribute is used to define inline styles?','style','class','font','styles',1,'',10);
    INSERT  INTO questions VALUES(26,'Which is the correct CSS syntax?','body {color: black;}','{body;color:black;}','body:color=black;',' {body:color=black;}',1,'',10);
    INSERT  INTO questions VALUES(27,'How do you insert a comment in a CSS file?','/* this is a comment */',''' this is a comment','// this is a comment //','// this is a comment',1,'',10);
    INSERT  INTO questions VALUES(28,'Which property is used to change the background color?','background-color','color','bgcolor','background',1,'',10);
    INSERT  INTO questions VALUES(29,'How do you add a background color for all <h1> elements?',' h1 {background-color:#FFFFFF;}','h1.all {background-color:#FFFFFF;}','all.h1 {background-color:#FFFFFF;}','*.h1 {background-color:#FFFFFF;}',1,'',10);
    INSERT  INTO questions VALUES(30,'Which CSS property is used to change the text color of an element?','color','text-color',' fgcolor','element-color',1,'',10);
    INSERT  INTO questions VALUES(31,'Which CSS property controls the text size?','font-size','font-style','text-size','text-style',1,'',10);
    INSERT  INTO questions VALUES(32,'What is the correct CSS syntax for making all the <p> elements bold?',' p {font-weight:bold;}','<p style="font-size:bold;">','<p style="text-size:bold;">','',1,'',10);
    INSERT  INTO questions VALUES(33,'How do you display hyperlinks without an underline?','a {text-decoration:none;}','a {underline:none;}','a {decoration:no-underline;}',' {text-decoration:no-underline;}',1,'',10);
    INSERT  INTO questions VALUES(34,'How do you make each word in a text start with a capital letter?','text-transform:capitalize','text-transform:uppercase','You can''t do that with CSS','text-transform:upper',1,'',10);
    INSERT  INTO questions VALUES(35,'Which property is used to change the font of an element?','Both font-family and font can be used','font-family','font','font-style',1,'',10);
    INSERT  INTO questions VALUES(36,'How do you make the text bold?','font-weight:bold;','style:bold;','font:bold;','font-style:bold',1,'',10);
    INSERT  INTO questions VALUES(37,'How do you display a border like this:The top border = 10 pixels, The bottom border = 5 pixels, The left border = 20 pixels, The right border = 1pixel?','border-width:10px 1px 5px 20px;','border-width:10px 20px 5px 1px;','border-width:5px 20px 10px 1px;','border-width:10px 5px 20px 1px;',1,'',10);
    INSERT  INTO questions VALUES(38,'Which property is used to change the left margin of an element?' , 'margin-left', 'padding-left', 'indent', 'allign-left', 1, '',10);
    INSERT  INTO questions VALUES(39,'How do you make a list that lists its items with squares?','list-style-type: square;','list-type: square;','list: square;','list-style: square',1,'',10);
    INSERT  INTO questions VALUES(40,'How do you select an element with id "demo"?','#demo','*demo','demo','.demo',1,'',10);
    INSERT  INTO questions VALUES(41,'How do you select elements with class name "test"?','.test','test','*test',' #test',1,'',10);
    INSERT  INTO questions VALUES(42,'How do you select all p elements inside a div element?','div p','div + p','div.p','p.div',1,'',10);
    INSERT  INTO questions VALUES(43,'How do you group selectors?','Separate each selector with a comma','Separate each selector with a space','Separate each selector with a plus sign','Separate each selector with a minus sign',1,'',10);
    INSERT  INTO questions VALUES(44,'What is the default value of the position property?','static','relative','fixed','absolute',1,'',10);
    -- Level 2
    --Intrebari HTML5:
    INSERT  INTO questions VALUES( 45, 'What is the previous version of HTML, prior to HTML5?', 'HTML 4.01', 'HTML 4.9', 'HTML 4', 'HTML 4.1', 1, 'The last version for HTML4 is HTML 4.01', 20);
    INSERT  INTO questions VALUES( 46, 'Which doctype is correct for HTML5?', '<!DOCTYPE html>', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5.0//EN" "http://www.w3.org/TR/html5/strict.dtd">', '<!DOCTYPE HTML5>', '<!DOCTYPE HTML>', 1, 'The DOCTYPE declaration for HTML5 is identical to the DOCTYPE declaration for HTML !', 20);
    INSERT  INTO questions VALUES( 47, 'Which HTML5 element is used to specify a footer for a document or section?', '<footer>', '<bottom>', '<section>', '<head>', 1, 'The <f.....> element specifies a footer for a document or section.', 20);
    INSERT  INTO questions VALUES( 48, 'Which element is no longer supported in HTML5?', '<font>', '<menu>', '<ins>', '<q>', 1, '<acronym>, <applet>, <basefont>, <big>, <center>, <dir>, <font>, <frame>, <frameset>, <noframes>, <strike>, <tt> :not supported in HTML5', 20);
    INSERT  INTO questions VALUES( 49, 'Which element is no longer supported in HTML5?', '<acronym>', '<base>', '<cite>', '<abbr>', 1, '<acronym>, <applet>, <basefont>, <big>, <center>, <dir>, <font>, <frame>, <frameset>, <noframes>, <strike>, <tt> :not supported in HTML5', 20);
    INSERT  INTO questions VALUES( 50, 'In HTML5, onblur and onfocus are:', 'Event attributes', 'HTML elements', 'HTML attributes', 'Style attributes', 1, 'Onblur and onfocus are event .....', 20);
    INSERT  INTO questions VALUES( 51, 'What is the correct HTML5 element for playing video files?', '<video>', '<media>', '<movie>', '<audio>', 1, 'Before HTML5, there was no standard for showing videos on a web page and now is the <v....> element', 20);
    INSERT  INTO questions VALUES( 52, 'What is the correct HTML5 element for playing audio files?', '<audio>', '<mp3>', '<sound>', '<video>', 1, 'Before HTML5, there was no standard for playing audio files on a web page and now is the <a....> element', 20);
    INSERT  INTO questions VALUES( 53, 'Which attribute for <script> elements is no longer required in HTML5?', '<type>', '<href>', '<rel>', '<src>', 1, '', 20);
    INSERT  INTO questions VALUES( 54, 'In HTML5, which method is used to get the current location of a user?', 'getCurrentPosition()', 'getUserPosition()', 'getPosition()', 'getCurrent()', 1, '', 20);
    INSERT  INTO questions VALUES( 55, 'The new HTML5 global attribute, "contenteditable" is used to:', 'Specify whether the content of an element should be editable or not', 'Specifies a context menu for an element. The menu appears when a user right-clicks on the element', 'Return the position of the first found occurrence of content inside a string', 'Update content from the server', 1, '', 20);
    INSERT  INTO questions VALUES( 56, 'In HTML5, contextmenu and spellcheck are:', 'HTML attributes', 'Style attributes', 'HTML elements', 'Event attributes', 1, '', 20);
    INSERT  INTO questions VALUES( 57, 'Graphics defined by SVG is in which format?', 'XML', 'HTML', 'CSS', 'PHP', 1, '', 20);
    INSERT  INTO questions VALUES( 58, 'The <canvas> element in HTML5 is used to:', 'draw graphics', 'display database records', 'manipulate data in MySQL', 'create draggable elements', 1, '', 20);
    INSERT  INTO questions VALUES( 59, 'Which built-in HTML5 object is used to draw on the canvas?', 'getContext', 'getContent', 'getGraphics', 'getCanvas', 1, '', 20);
    INSERT  INTO questions VALUES( 60, 'In HTML5, which attribute is used to specify that an input field must be filled out?', 'required', 'formvalidate', 'validate', 'placeholder', 1, '', 20);
    INSERT  INTO questions VALUES( 61, 'Which input type defines a slider control?', 'range', 'slider', 'controls', 'search', 1, '', 20);
    INSERT  INTO questions VALUES( 62, 'Which input type defines a week and year control (no time zone)?', 'week', 'date', 'year', 'month', 1, '', 20);
    INSERT  INTO questions VALUES( 63, 'Which HTML5 element is used to display a scalar measurement within a known range?', '<meter>', '<measure>', '<range>', '<gauge>', 1, '', 20);
    INSERT  INTO questions VALUES( 64, 'Which HTML5 element defines navigation links?', '<nav>', '<navig>', '<navigation>', '<navigate>', 1, '', 20);
    INSERT  INTO questions VALUES( 65, 'In HTML5, what does the <aside> element define?', 'Content aside from the page content', 'A navigation list to be shown at the left side of the page', 'The ASCII character-set; to send information between computers on the Internet', 'something else....', 1, '', 20);
    INSERT  INTO questions VALUES( 66, 'Which HTML5 element is used to specify a header for a document or section?', '<header>', '<head>', '<section>', '<top>', 1, '', 20);
    INSERT  INTO questions VALUES( 67, 'Which HTML5 element defines an article?', '<article>', '<content>', '<section>', '<header>', 1, '', 20);
    --Intrebari PHP:
    INSERT  INTO questions VALUES( 68, 'What does PHP stand for?', 'PHP: Hypertext Preprocessor', 'Private Home Page', 'Personal Hypertext Processor', 'Personal Home Page', 2, '', 20);
    INSERT  INTO questions VALUES( 69, 'PHP server scripts are surrounded by delimiters, which?', '<?php...?>', '<script>...</script>', '<&>...</&>', '<?php>...</?>', 2, '', 20);
    INSERT  INTO questions VALUES( 70, 'How do you write "Hello World" in PHP', 'echo "Hello World";', 'Document.Write("Hello World");', '"Hello World";', '/''Hello World/', 2, '', 20);
    INSERT  INTO questions VALUES( 71, 'All variables in PHP start with which symbol?', '$', '!', '&', '*', 2, '', 20);
    INSERT  INTO questions VALUES( 72, 'What is the correct way to end a PHP statement?', ';', '</php>', 'New line', '.', 2, '', 20);
    INSERT  INTO questions VALUES( 73, 'The PHP syntax is most similar to:', 'Perl and C', 'JavaScript', 'VBScript', 'C', 2, '', 20);
    INSERT  INTO questions VALUES( 74, 'How do you get information from a form that is submitted using the "get" method?', '''$_GET[];', 'Request.QueryString;', 'Request.Form;', '/%%_GET[];', 2, '', 20);
    INSERT  INTO questions VALUES( 75, 'What is the correct way to include the file "time.inc" ?', '<?php include "time.inc"; ?>', '<?php include:"time.inc"; ?>', '<?php include file="time.inc"; ?>', '<!-- include file="time.inc" -->', 2, '', 20);
    INSERT  INTO questions VALUES( 76, 'What is the correct way to create a function in PHP?', 'function myFunction()', 'new_function myFunction()', 'create myFunction()', 'create function myFunction()', 2, '', 20);
    INSERT  INTO questions VALUES( 77, 'What is the correct way to open the file "time.txt" as readable?', 'fopen("time.txt","r");', 'open("time.txt","read");', 'fopen("time.txt","r+");', 'open("time.txt");', 2, '', 20);
    INSERT  INTO questions VALUES( 78, 'Which superglobal variable holds information about headers, paths, and script locations?', '$_SERVER', '$_SESSION', '$_GLOBALS', '%_GET', 2, '', 20);
    INSERT  INTO questions VALUES( 79, 'What is the correct way to add 1 to the $count variable?', '$count++;', '$count =+1', '++count', 'count++;', 2, '', 20);
    INSERT  INTO questions VALUES( 80, 'What is a correct way to add a comment in PHP?', '/*...*/', '*\...\*', '<!--...-->', '<comment>...</comment>', 2, '', 20);
    INSERT  INTO questions VALUES( 81, 'Which one of these variables has an illegal name?', '$my-Var', '$myVar', '$my_Var', '$my_var', 2, '', 20);
    INSERT  INTO questions VALUES( 82, 'How do you create an array in PHP?', '$cars = array("Volvo", "BMW", "Toyota");', '$cars = "Volvo", "BMW", "Toyota";', '$cars = array["Volvo", "BMW", "Toyota"];', '$cars = ("Volvo", "BMW", "Toyota");', 2, '', 20);
    INSERT  INTO questions VALUES( 83, 'Which operator is used to check if two values are equal and of same data type?', '===', '!=', '=', '==', 2, '', 20);
    --Intrebari JavaScript
    INSERT  INTO questions VALUES( 84, 'Inside which HTML element do we put the JavaScript?', '<script>', '<javascript>', '<scripting>', '<js>', 2, '', 20);
    INSERT  INTO questions VALUES( 85, 'What is the correct JavaScript syntax to change the content of the HTML element below?', 'document.getElementById("demo").innerHTML = "Hello World!";', 'document.getElement("p").innerHTML = "Hello World!";', 'document.getElementByName("p").innerHTML = "Hello World!";', '#demo.innerHTML = "Hello World!";', 2, '', 20);
    INSERT  INTO questions VALUES( 86, 'Where is the correct place to insert a JavaScript?', 'Both the <head> section and the <body> section are correct', 'The <head> section', 'The <body> section', 'Both the <head> section and the <body> section', 2, '', 20);
    INSERT  INTO questions VALUES( 87, 'What is the correct syntax for referring to an external script called "xxx.js"?', '<script src="xxx.js">', '<script href="xxx.js">', '<script name="xxx.js">', '<script name=="xxx.js">', 2, '', 20);
    INSERT  INTO questions VALUES( 88, 'How do you write "Hello World" in an alert box?', 'alert("Hello World");', 'sgBox("Hello World");', 'alertBox("Hello World");', 'msg("Hello World");', 2, '', 20);
    INSERT  INTO questions VALUES( 89, 'How do you create a function in JavaScript?', 'function myFunction()', 'function:myFunction()', 'function=myFunction()', 'function.myFunction()', 2, '', 20);
    INSERT  INTO questions VALUES( 90, 'How do you call a function named "myFunction"?', 'myFunction()', 'call myFunction()', 'call function myFunction()', 'function myFunction()', 2, '', 20);
    INSERT  INTO questions VALUES( 91, 'How to write an IF statement in JavaScript?', 'if (i == 5)', 'if i = 5 then', 'if i = 5', 'if i == 5 then', 2, '', 20);
    INSERT  INTO questions VALUES( 92, 'How to write an IF statement for executing some code if "i" is NOT equal to 5?', 'if (i != 5)', 'if i =! 5 then', 'if i <> 5', 'if (i <> 5)', 2, '', 20);
    INSERT  INTO questions VALUES( 93, 'How does a WHILE loop start?', 'while (i <= 10)', 'while (i <= 10; i++)', 'while i = 1 to 10', 'while (i < 10)', 2, '', 20);
    INSERT  INTO questions VALUES( 94, 'How does a FOR loop start?', 'for (i = 0; i <= 5; i++)', 'for i = 1 to 5', 'for (i <= 5; i++)', 'for (i = 0; i <= 5)', 2, '', 20);
    INSERT  INTO questions VALUES( 95, 'How can you add a comment in a JavaScript?', '//This is a comment', '"This is a comment', '<!--This is a comment-->' ,'/*This is a comment', 2, '', 20);
    INSERT  INTO questions VALUES( 96, 'How to insert a comment that has more than one line?', '/*This comment has more than one line*/', '<!--This comment has more than one line-->', '//This comment has more than one line//', '//This comment has more than one line', 2, '', 20);
    INSERT  INTO questions VALUES( 97, 'What is the correct way to write a JavaScript array?', 'var colors = (1:"red", 2:"green", 3:"blue")', 'var colors = 1 = ("red"), 2 = ("green"), 3 = ("blue")', 'var colors = ["red", "green", "blue"]', 'var colors = "red", "green", "blue"', 2, '', 20);
    INSERT  INTO questions VALUES( 98, 'How do you round the number 7.25, to the nearest integer?', 'Math.round(7.25)', 'round(7.25)', 'Math.rnd(7.25)', 'rnd(7.25)', 2, '', 20);
    INSERT  INTO questions VALUES( 99, 'How do you find the number with the highest value of x and y?', 'Math.max(x, y)', 'top(x, y)', 'Math.ceil(x, y)', 'ceil(x, y)', 2, '', 20);
    INSERT  INTO questions VALUES( 100, 'What is the correct JavaScript syntax for opening a new window called "w2" ?', 'w2 = window.open("http://www.w3schools.com");', 'w2 = window.new("http://www.w3schools.com");', 'w2 = window.open.new("http://www.w3schools.com");', 'w2 = window.new.open("http://www.w3schools.com");', 2, '', 20);
    INSERT  INTO questions VALUES( 101, 'How can you detect the client''s browser name?', 'navigator.appName', 'client.navName', 'browser.name', 'nav.name', 2, '', 20);
    INSERT  INTO questions VALUES( 102, 'Which event occurs when the user clicks on an HTML element?', 'onclick', 'onmouseclick', 'onmouseover', 'onchange', 2, '', 20);
    INSERT  INTO questions VALUES( 103, 'How do you declare a JavaScript variable?', 'var carName;', 'var_carName;', 'v carName;', 'variable carName;', 2, '', 20);
    INSERT  INTO questions VALUES( 104, 'Which operator is used to assign a value to a variable?', '=', '*', 'x', '-', 2, '', 20);
    -- Level 3
    -- Intrebari HTTP
    INSERT  INTO questions VALUES( 105, 'Multiple object can be sent over a TCP connection between client and server in ', 'persistent HTTP', 'nonpersistent HTTP', 'persistent HTTP and nonpersistent HTTP', 'none of the mentioned', 3, '', 30);
    INSERT  INTO questions VALUES( 106, 'HTTP is ________ protocol.', 'application layer', 'transport layer', 'network layer', 'none of the mentioned', 3, '', 30);
    INSERT  INTO questions VALUES( 107, 'In the network HTTP resources are located by ', 'uniform resource identifier', 'unique resource locator', 'unique resource identifier', 'none of the mentioned', 3, '', 30);
    INSERT  INTO questions VALUES( 108, 'In HTTP pipelining ', 'multiple HTTP requests are sent on a single TCP connection without waiting for the corresponding responses', 'multiple HTTP requests can not be sent on a single TCP connection', 'multiple HTTP requests are sent in a queue on a single TCP connection', 'none of the mentioned', 3, '', 30);
    INSERT  INTO questions VALUES( 109, 'HTTP client requests by establishing a __________ connection to a particular port on the server.', 'transmission control protocol', 'user datagram protocol', 'broader gateway protocol', 'none of the mentioned', 3, '', 30);
    INSERT  INTO questions VALUES( 110, 'The HTTP ____ contains metadata, like encoding information and HTTP methods in some cases.', 'header', 'URL', 'Body', 'Http Codes', 3, '', 30);
    INSERT  INTO questions VALUES( 111, '_____ is the most popular way of establishing an encrypted HTTP connection.', 'HTTPS', 'http://', 'HTTs', 'www', 3, '', 30);
    INSERT  INTO questions VALUES( 112, 'Hypertext Transfer Protocol is the protocol that allows for sending ___________ back and forth on the web.', 'text or documents', 'none', 'URL only', 'used for authentication', 3, '', 30);
    INSERT  INTO questions VALUES( 113, 'HTTP error messages, also called ______________ are response codes given by Web-servers and help identify the cause of the problem.', 'HTTP status codes', 'HTTP recovery codes', 'HTTP fix', 'HTTPs', 3, '', 30);
    INSERT  INTO questions VALUES( 114, 'With HTTP you can send __________,as long as both the client and the server know how to handle the data content.', 'any type of data', 'http Bolton send url', 'only text', 'audio', 3, '', 30);
    INSERT  INTO questions VALUES( 115, 'Hypertext Transfer Protocol (HTTP) is ____________ protocol.', 'connectionless', 'connection oriented', ' none', 'routing', 3, '', 30);
    INSERT  INTO questions VALUES( 116, '_______ HTTP code means the HTTP method used is not supported for this resource.', '405', '100', '401', '404', 3, '', 30);
    INSERT  INTO questions VALUES( 117, 'HTTP code ____ indicates that the required resource could not be found.', '404', '101', '400', '401', 3, '', 30);
    INSERT  INTO questions VALUES( 118, 'HTTP ___ code is used when processing fails due to unanticipated circumstances on the server side, which causes the server to error out.', '500', '401', '404', '505', 3, '', 30);
    INSERT  INTO questions VALUES( 119, 'HTTP ____ was the first documented version of HTTP.', 'V 0.9', 'V1', 'V 0.8', 'V 1.1', 3, '', 30);
    INSERT  INTO questions VALUES( 120, '_____ HTTP code means that the data does not pass validation, or is in the wrong format.', '400', '101', '404' ,'100', 3, '', 30);
    INSERT  INTO questions VALUES( 121, 'HTTP have two different roles that is server and client. In general, the ____ always start the conversation and the ____replies.', 'client, server', 'Server, client', 'none', 'URL', 3, '', 30);
    INSERT  INTO questions VALUES( 122, 'In http ______ method is used to retrieve information from the given server using a given URL. Requests using ____ should only retrieve data.', 'GET , GET', 'GET , post', 'post, post', 'none', 3, '', 10);
    INSERT  INTO questions VALUES( 123, 'The HTTP client and server exchange information about resources identified by ', 'URLs', 'HTML', 'hyper-text', 'SNTP', 3, '', 30);
    INSERT  INTO questions VALUES( 124, 'The Hypertext Transfer Protocol (HTTP) is an _____________ protocol.', 'application-level', 'layer-2', 'layer-3', 'physical', 3, '', 30);
    INSERT  INTO questions VALUES( 125, '_______ HTTP code means the client has requested the server to switch protocols and server is acknowledging it.', '101', '100', '404', '401', 3, '', 30);
    -- Intrebari COOKIES
    INSERT  INTO questions VALUES( 126,'Where do Internet cookies come from?','a Web site''s server','the Internet''s central hub','outer space','from Google',3,'Internet cookies are produced by a central server for a Web site and uploaded onto a user''s computer when he or she first enters a site.',30);
    INSERT  INTO questions VALUES( 127,'Cookies store state information. What is that?','information about a user''s preferences','information about the size of your computer''s hard drive','top secrets that are surreptitiously stored on one user''s computer then moved to another','information about your personal lifestyle',3,'State information is details about your computer and preferences',30);
    INSERT  INTO questions VALUES( 128,'Other information that a cookie may store about a user doesn''t include:','preferences attached to other cookies','items in your online shopping cart','how often you visit a Web site','user''s preferences',3,'Cookies can''t look at other cookies',30);
    INSERT  INTO questions VALUES( 129,'If you want to erase your cookies, what folder should you access on your PC?','Temporary Internet Files','Web Activity folder','Drivers folder','Downloads Folder',3,'To erase cookies, you''ll have to go into your Temporary Internet Files folder.',30);
    INSERT  INTO questions VALUES( 130,'What''s "targeting" as far as Internet cookies are concerned?','focused marketing','the process of accessing a user''s cookie','finding a s physical location','the storing procces',3,'Targeting is essentially ___ marketing to Internet users based on information found in their cookies.',30);
    INSERT  INTO questions VALUES( 131,'DoubleClick is a company that produces cookies that:','can track users across the Internet','contain a user''s personal information','smell like real, fresh-baked cookies','are malware',3,'DoubleClick produces cookies that can track users across the Internet, not just on one site.',30);
    INSERT  INTO questions VALUES( 132,'The small, 1x1 pixel cookies implanted in banner ads are called:','Web bugs','devil cookies','Web scum','malware cookie',3,'Web bugs are tiny files hidden in banner ads that upload cookies onto a user''s machine when he or she clicks a banner ad.',30);
    INSERT  INTO questions VALUES( 133,'Cookies are written in what kind of text?','name-value pairs','ASCII','DOS','UTF8',3,'Cookies are written in name-value pairs. The name may be as simple as "UserID," and the value is a string of numbers and characters, the actual ID tag for the user''s computer.',30);
    -- Level 4
    -- Intrebari RESTful
    INSERT  INTO questions VALUES(134,'Which of the following is correct about web services?','Both of the above.','A web service is a collection of open protocols and standards used for exchanging data between applications or systems.','Software applications written in various programming languages and running on various platforms can use web services to exchange data among them over computer networks like the Internet.','None of the above.',4,'A web service is a collection of open protocols and standards used for exchanging data between applications or systems. Software applications written in various programming languages and running on various platforms can use web services to exchange data over computer networks like the Internet in a manner similar to inter-process communication on a single computer.',40);
    INSERT  INTO questions VALUES(135,'Which of the following component of HTTP request contains metadata for the HTTP Request message as key-value pairs?','Request Header','VERB','URI','HTTP Version',4,'Request Header ? Contains metadata for the HTTP Request message as key-value pairs. For example, client ( or browser) type, format supported by client, format of message body, cache settings etc.',40);
    INSERT  INTO questions VALUES(136,'Which of the following is advantage of RESTful web service being stateless?','All of the above.','Web services can treat each method request independently.','Web services need not to maintain client''s previous interactions. It simplifies application design.','As HTTP is itself a statelessness protocol, RESTful Web services work seamlessly with HTTP protocol.',4,'',40);
    INSERT  INTO questions VALUES(137,'Which of the following HTTP method should be used to get list the supported operations in RESTful web service?','OPTIONS','GET','HEAD','PUT',4,'OPTIONS opearations should be used to get list the supported operations in RESTful web service.',40);
    INSERT  INTO questions VALUES(138,'Which of the following directive of Cache Control Header of HTTP response can set the time limit of caching?','max-age','Public','Private','no-cache/no-store',4,'max-age directive indicates that the caching is valid up to max-age in seconds. After this, client has to make another request.',40);
    INSERT  INTO questions VALUES(139,'Which of the following HTTP Status code means NOT MODIFIED, used to reduce network bandwidth usage in case of conditional GET requests?','304','200','201','204',4,'HTTP Status Code 304 means NOT MODIFIED, used to reduce network bandwidth usage in case of conditional GET requests.',40);
    INSERT  INTO questions VALUES(140,'Which of the following annotation of JAX RS API is used to annotate a method used to fetch resource?','@GET','@Path','@PUT','@POST',4,'HTTP Get request, used to fetch resource.',40);
    INSERT  INTO questions VALUES(141,'Which of the following annotation of JAX RS API states the HTTP Response generated by web service?','@Produces','@DELETE','@HEAD','@Consumes',4,'@Produces ? States the HTTP Response generated by web service, for example APPLICATION/XML, TEXT/HTML, APPLICATION/JSON etc',40);
    -- Intrebari AJAX
    INSERT  INTO questions VALUES( 142, 'What is the name of the DLL that contains Ajax control tool kit?', 'Ajaxcontroltoolkit.dll', 'Ajaxtoolkit.dll', 'Ajaxcontrol.dll', 'control.dll', 4, '', 40);
    INSERT  INTO questions VALUES( 143, 'Which property is used to control the duration of Ajax request.', 'AsyncPostBackTimeout', 'AsyncTimeout', 'Timeout', 'PostBackTimeout', 4, '', 40);
    INSERT  INTO questions VALUES( 144, 'Which property is used to check whether AJAX request has been completed.', 'readyState', 'ready', 'open', 'onreadyState', 4, '', 40);
    INSERT  INTO questions VALUES( 145, 'How can you test the Ajax code?', 'JSUnit', 'JSU', 'AjaxJSU', 'JSUnitAjax', 4, '', 40);
    INSERT  INTO questions VALUES( 146, 'How can we cancel the XMLHttpRequest in AJAX?', 'Abort()', 'cancel()', 'remove()', 'none', 4, '', 40);
    INSERT  INTO questions VALUES( 147, 'What is the name of object used for AJAX request?', 'Request', 'XMLHTTPRequest', 'xmlRequest', 'HttpRequest', 4, '', 40);
    INSERT  INTO questions VALUES( 148, 'Which manager are use for pre-requisite Update Panel in Ajax.', 'Script Manager', 'Javascript Manager and Ajax Manager', 'Javascript Manager', 'Ajax Manager', 4, '', 40);
    INSERT  INTO questions VALUES( 149, 'Ajax is a…', 'Technology', 'Programing Language', 'Programing Language and OOPs concepts', 'OOPs concepts', 4, '', 40);
    -- Level 5
    -- Intrebari SECURITY
    INSERT  INTO questions VALUES( 150, 'A session-based system authenticates a user to a Web site to provide access to restricted resources. To increase security in this scenario, an authentication token should meet which of the following requirements?', 'It should always use a non-persistent cookie.', 'It should identify returning users to the site.', 'It should be public information.', 'It should always use a persistent cookie.', 5, '', 50);
    INSERT  INTO questions VALUES( 151, 'Which of the following is the best way to protect a Web application from unvalidated redirects and forwards?', 'Validate the referrer header.', 'Use extended validation certificates.', 'Use the escaping technique.', 'Disallow requests to unauthorized file types.', 5, '', 50);
    INSERT  INTO questions VALUES( 152, 'Which mitigation technique helps you tell the parser that a specific character is a literal and not a control character?', 'Escaping', 'Table indirection', 'Allow list', 'Block list', 5, '', 50);
    INSERT  INTO questions VALUES( 153, 'Which of the following is most vulnerable to injection attacks?', 'Regular expressions', 'Server configuration files', 'Registry keys', 'Session IDs', 5, '', 50);
    INSERT  INTO questions VALUES( 154, 'Which of the following vulnerabilities is most likely to occur due to an insecure direct object reference attack?', 'Accessing a resource without authorization.', 'Executing commands on the server.', 'Impersonating any user on the system.', 'Modifying SQL data pointed to by the query.', 5, '', 50);
    INSERT  INTO questions VALUES( 155, 'Which of the following actions should you take to test the security of your Web application?', 'Use your browser to forge unauthorized requests.', 'Set the secure flag on session ID cookies.', 'Use policy mechanisms.', 'Use a simple and positive model at every layer.', 5, '', 50);
    INSERT  INTO questions VALUES( 156, 'Which of the following procedures are involved in the hardening process?', 'Disable unnecessary features.', 'Resubmit POST parameters during redirection.', 'Update the environment with changes only when needed.', 'Repeat the process at random intervals.', 5, '', 50);
    INSERT  INTO questions VALUES( 157, 'Which of the following factors helps you secure keys?', 'Complexity', 'Escaping', 'Session-based indirection', 'Encryption', 5, '', 50);
    INSERT  INTO questions VALUES( 158, 'A user is able to pass malicious input that invokes control codes in your Web application. Which vulnerability is most likely to occur in your Web application?', 'Injection', 'Insufficient transport layer protection', 'Insecure direct object references', 'Failure to restrict URL access', 5, '', 50);
    INSERT  INTO questions VALUES( 159, 'Which of the following is the best way to reevaluate your environment and address new threats?', 'Add or remove network segments.', 'Use the white-list validation of allowed input technique.', 'Use your browser to forge unauthorized requests.', 'Use custom cryptographic algorithms.', 5, '', 50);
    INSERT  INTO questions VALUES( 160, 'Which of the following is most likely to result from unvalidated redirects and forwards?', 'Bypassed authorization checks', 'Brute force attack', 'Network sniffing', 'Man-in-the-middle attack', 5, '', 50);
    
    END populate_question;
    
END quiz_pack;
/
BEGIN
  quiz_pack.populate_question;
  quiz_pack.populate_quiz;
END;
/
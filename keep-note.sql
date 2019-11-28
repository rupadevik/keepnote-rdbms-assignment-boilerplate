CREATE TABLE Note (
    note_id INT PRIMARY KEY,
    note_title VARCHAR(20),
    note_content VARCHAR(20),
    note_status VARCHAR(20),
    note_creation_date DATETIME
);
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(20),
    category_descr VARCHAR(20),
    category_creation_date DATETIME,
    category_creator VARCHAR(20)
);
CREATE TABLE Reminder (
    reminder_id INT PRIMARY KEY,
    reminder_name VARCHAR(20),
    reminder_descr VARCHAR(20),
    reminder_type VARCHAR(20),
    reminder_creation_date DATETIME,
    reminder_creator VARCHAR(20)
);
CREATE TABLE User (
    user_id VARCHAR(20) PRIMARY KEY,
    user_name VARCHAR(20),
    user_added_date DATE,
    user_password VARCHAR(20),
    user_mobile INT
);
CREATE TABLE UserNote (
    usernote_id INT PRIMARY KEY,
    user_id VARCHAR(20),
    note_id INT,
    FOREIGN KEY (user_id)
        REFERENCES User (user_id),
    FOREIGN KEY (note_id)
        REFERENCES Note (note_id)
);
CREATE TABLE NoteReminder (
    notereminder_id INT PRIMARY KEY,
    note_id INT,
    reminder_id INT,
    FOREIGN KEY (note_id)
        REFERENCES Note (note_id),
    FOREIGN KEY (reminder_id)
        REFERENCES Reminder (reminder_id)
);
CREATE TABLE NoteCategory (
    notecategory_id INT PRIMARY KEY,
    note_id INT,
    category_id INT,
    FOREIGN KEY (note_id)
        REFERENCES Note (note_id),
    FOREIGN KEY (category_id)
        REFERENCES Category (category_id)
);

insert into Note(note_id ,
    note_title ,
    note_content ,
    note_status ,
    note_creation_date ) values (1,'cute','cute photos','awsome','2015-6-3');
insert into Note(note_id ,
    note_title ,
    note_content ,
    note_status ,
    note_creation_date ) values (2,'pretty','pretty photos','good','2017-6-8');

insert into Category (
    category_id ,
    category_name ,
    category_descr ,
    category_creation_date ,
    category_creator) values (1,'books','science','2018-9-8','Rupa');
insert into Category (
    category_id ,
    category_name ,
    category_descr ,
    category_creation_date ,
    category_creator) values (2,'cooking','recipe','2012-9-16','vani') ;  
insert into Reminder (
    reminder_id ,
    reminder_name ,
    reminder_descr ,
    reminder_type ,
    reminder_creation_date ,
    reminder_creator) values (1,'morning','wakeup','single','2013-9-5','RupaK');
insert into Reminder (
    reminder_id ,
    reminder_name ,
    reminder_descr ,
    reminder_type ,
    reminder_creation_date ,
    reminder_creator) values (2,'evening','signup','snooze','2018-9-5','vaniK');
insert into User (
    user_id ,
    user_name ,
    user_added_date ,
    user_password,
    user_mobile)values (1,'padma','2020-9-5','Itsme',74168087);
insert into User (
    user_id ,
    user_name ,
    user_added_date ,
    user_password,
    user_mobile)values (2,'hari','2019-9-5','Itsmehari',74168022);    
insert into UserNote (
    usernote_id ,
    user_id ,
    note_id) values (111,1,2);
insert into UserNote (
    usernote_id ,
    user_id ,
    note_id) values (222,1,2);
insert into NoteReminder (
    notereminder_id ,
    note_id ,
    reminder_id) values (333,1,2);
insert into NoteReminder (
    notereminder_id ,
    note_id ,
    reminder_id) values (444,2,2);    
insert into NoteCategory (
    notecategory_id ,
    note_id ,
    category_id) values (555,2,1);
insert into NoteCategory (
    notecategory_id ,
    note_id ,
    category_id) values (666,1,1);
    
select * from User where user_id=2 AND user_password='Itsmehari';

select * from Note where note_creation_date='2015-06-03';

select * from Category where category_creation_date>'2012-09-16';

select note_id from UserNote where user_id=1;

update Note set note_status='super',note_title='beauty', note_content='beauty photos' where note_id=2;

select * from Note n join UserNote un on un.note_id=n.note_id where un.user_id=1;

select * from Note n join NoteCategory nc on nc.note_id=n.note_id where nc.category_id=1;

select * from Reminder r join NoteReminder nr on nr.reminder_id=r.reminder_id where nr.note_id=2;

select * from Reminder where reminder_id=1;

insert into Note(note_id,note_title,note_content,note_status,note_creation_date)values (5,'fashion','fashion photos','gorgeous','2010-06-20');
  
insert into UserNote(usernote_id ,user_id, note_id) values (444,2,5);

insert into Note(note_id,note_title,note_content,note_status,note_creation_date)values (6,'ugly','ugly photos','bad','2019-02-23');

insert into NoteCategory(notecategory_id,note_id,category_id) values (777,1,1);

insert into Reminder(reminder_id,reminder_name,reminder_descr,reminder_type,reminder_creation_date,reminder_creator) values (3,'night','sleep','alone','2015-9-5','Ruuuu');

insert into NoteReminder(notereminder_id,note_id,reminder_id) values (222,2,2);
    
delete from UserNote where note_id=1;

delete from NoteReminder where note_id=1;

delete from NoteCategory where note_id=1;

delete from Note where note_id=1;

delete from NoteCategory where note_id=2;

delete from NoteReminder where note_id=2;

delete from UserNote where note_id=2;

delete from Note where note_id=2;

DELIMITER //
create trigger del_note before delete on Note FOR EACH ROW Begin delete from UserNote where note_id=old.note_id; delete from NoteReminder where note_id=old.note_id; delete from NoteCategory where note_id=old.note_id; END; //
DELIMITER ;
delete from Note where note_id=3;
DELIMITER //
create trigger del_user before delete on User FOR EACH ROW Begin delete from UserNote where note_id=old.user_id; delete from NoteReminder where note_id=old.user_id; delete from NoteCategory where note_id=old.user_id; END; //
DELIMITER ;
delete from User where user_id="1";
















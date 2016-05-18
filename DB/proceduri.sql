CREATE OR REPLACE PACKAGE user_pack AS
  PROCEDURE show_user_info (p_user_id IN users_profile.user_id%TYPE,
      p_name OUT users_profile.name%TYPE, p_surname OUT users_profile.surname%TYPE, p_username OUT users_profile.username%TYPE,
      p_email OUT users_profile.email%TYPE, p_points OUT users_status.points%TYPE, p_level OUT users_status.level_id%TYPE);
  PROCEDURE sign_in(p_name users_profile.name%type, p_surname users_profile.surname%type, p_username users_profile.username%type, p_email users_profile.email%type, p_user_password users_profile.user_password%type);
  PROCEDURE delete_user (p_user_id IN INT);
  PROCEDURE log_in(p_username IN VARCHAR, p_password IN VARCHAR, p_user_id IN OUT INT);
  PROCEDURE update_user(p_user_id IN INT, p_name IN VARCHAR, p_surname IN VARCHAR, p_username IN VARCHAR, p_email IN VARCHAR, p_user_password IN VARCHAR);
END user_pack;

/
CREATE OR REPLACE PACKAGE BODY user_pack IS

    PROCEDURE show_user_info(p_user_id IN users_profile.user_id%TYPE,
      p_name OUT users_profile.name%TYPE, p_surname OUT users_profile.surname%TYPE, p_username OUT users_profile.username%TYPE,
      p_email OUT users_profile.email%TYPE, p_points OUT users_status.points%TYPE, p_level OUT users_status.level_id%TYPE) AS
    BEGIN
      SELECT up.name, up.surname, up.username, up.email, us.points, us.level_id INTO p_name, p_surname, p_username, p_email, p_points, p_level
      FROM users_profile up JOIN users_status us ON us.user_id = up.user_id
        WHERE up.user_id = p_user_id;  
    END;
    
    
    PROCEDURE sign_in(p_name users_profile.name%type, p_surname users_profile.surname%type, p_username users_profile.username%type, p_email users_profile.email%type, p_user_password users_profile.user_password%type)
    AS
      v_count_username INT := 0;
      v_count_profile INT :=0;
      v_last_id users_profile.user_id%type;
      v_user_id users_profile.user_id%type;
      invalid_name EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_name, -20100);
      invalid_surname EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_surname, -20101);
      invalid_username EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_username, -20102);
      invalid_email EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_email, -20104);
      invalid_password EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_username, -20103);
    BEGIN
      
      SELECT user_id INTO v_last_id FROM( SELECT user_id FROM users_profile ORDER BY  user_id DESC) WHERE ROWNUM=1; 
      v_user_id := v_last_id + 1;
      
      SELECT count(*) INTO v_count_username FROM users_profile where username = p_username;
      SELECT count(*) INTO v_count_profile FROM users_profile WHERE name=p_name AND surname = p_surname AND username = p_username AND email=p_email AND user_password=p_user_password;
      if(v_count_profile > 0) then
        raise_application_error(-20106,'Profile already exists! Try to login.');
      elsif(v_count_username > 0) then
        raise_application_error(-20105,'Username already exists!');
      elsif not regexp_like(p_name, '^[a-zA-Z-]+$') then
        raise invalid_name;
      elsif not regexp_like(p_surname, '^[a-zA-Z-]+$') then
        raise invalid_surname;
      elsif instr(p_username,';') > 0 OR length(p_username) > 30 OR length(p_username) < 4  THEN 
        raise invalid_username;
      elsif not regexp_like(p_email,'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$') then
        raise invalid_email;
      elsif length(p_user_password) < 6 OR instr(p_user_password,';') > 0 THEN
        raise invalid_password;
      else
        INSERT INTO users_profile VALUES(v_user_id, p_name, p_surname, p_username, p_email, p_user_password);
      end if;
    EXCEPTION  
      WHEN invalid_name THEN
          raise_application_error(-20100,'Invalid characters in name! It should contain only letters and -.');
      WHEN invalid_surname THEN
          raise_application_error(-20101,'Invalid characters in surname! It should contain only letters and -.');
      WHEN invalid_username THEN
          raise_application_error(-20102, 'Invalid username! It should not contain ; and it shoult be between 4-30 characters.');
      WHEN invalid_password THEN
          raise_application_error(-20103,'Invalid password! It should not contain ; and it shoult not be shorter then 6 characters.');
      WHEN invalid_email THEN
          raise_application_error(-20104,'Invalid email!');
    END sign_in;
    
    
    PROCEDURE delete_user (p_user_id IN INT) AS
      v_count INT;
      invalid_user_id EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_user_id, -20107);
    BEGIN
       SELECT COUNT(user_id) INTO v_count FROM users_profile WHERE user_id=p_user_id;
       IF v_count=0 THEN 
          raise invalid_user_id;
          -- DBMS_OUTPUT.PUT_LINE('User_id inexistent!!!');
        ELSE
            DELETE FROM users_status WHERE user_id=p_user_id ;
            DELETE FROM users_profile WHERE user_id=p_user_id ;
        END IF;
    EXCEPTION
       WHEN invalid_user_id THEN
          raise_application_error(-20107,'Invalid user_id! Try again!');
    END;
    
    
    PROCEDURE log_in(p_username IN VARCHAR, p_password IN VARCHAR, p_user_id IN OUT INT) AS
      v_count NUMBER;
      v_countp NUMBER;
      invalid_username EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_username, -20105);
      invalid_user_password EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_user_password, -20106);
    BEGIN
       SELECT COUNT(username)INTO v_count FROM users_profile WHERE username=p_username;
       SELECT COUNT(user_password)INTO v_countp FROM users_profile WHERE user_password=p_password AND username=p_username;
       p_user_id := 0;
       IF v_count=0 THEN
          raise invalid_username;
       ELSIF v_countp=0 THEN
          raise invalid_user_password;
       ELSE
          SELECT user_id INTO p_user_id FROM users_profile WHERE username=p_username AND user_password=p_password;
       END IF;
    EXCEPTION  
      WHEN invalid_username THEN
          raise_application_error(-20105,'Invalid username! Try again!');
      WHEN invalid_user_password THEN
          raise_application_error(-20106,'Invalid user_password! Try again!');
    END;
    
    
    PROCEDURE update_user(p_user_id IN INT, p_name IN VARCHAR, p_surname IN VARCHAR, p_username IN VARCHAR, p_email IN VARCHAR, p_user_password IN VARCHAR) AS
      v_count INT;
      invalid_user_id EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_user_id, -20108);
      invalid_name EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_name, -20109);
      invalid_surname EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_surname, -20110);
      invalid_username EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_username, -20111);
      invalid_email EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_email, -20112);
      invalid_password EXCEPTION;
      PRAGMA EXCEPTION_INIT(invalid_password, -20113);
    BEGIN
       SELECT COUNT(user_id) INTO v_count FROM users_profile WHERE user_id=p_user_id;
       IF (v_count = 0) THEN 
          raise invalid_user_id;
          -- DBMS_OUTPUT.PUT_LINE('User_id inexistent!!!');
       ELSE
          IF (p_name IS NOT NULL ) THEN
            IF not regexp_like(p_name, '^[a-zA-Z-]+$') then
                    raise invalid_name;
            ELSE
                     UPDATE users_profile SET name = p_name WHERE user_id=p_user_id;
            END IF;
          END IF;
          
          IF (p_surname IS NOT NULL ) THEN
              IF not regexp_like(p_surname, '^[a-zA-Z-]+$') then
                  raise invalid_surname;
              ELSE
                  UPDATE users_profile SET surname = p_surname WHERE user_id=p_user_id;
              END IF;
          END IF;
          
          IF (p_username IS NOT NULL) THEN
              IF instr(p_username,';') > 0 OR length(p_username) > 30 OR length(p_username) < 4  THEN 
                   raise invalid_username;
              ELSE
                   UPDATE users_profile SET username = p_username WHERE user_id=p_user_id;
              END IF;
          END IF;
          
          IF (p_email IS NOT NULL) THEN
             IF not regexp_like(p_email,'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$') then
                   raise invalid_email;
             ELSE
               UPDATE users_profile SET email = p_email WHERE user_id=p_user_id;
             END IF;
          END IF;
          
          IF (p_user_password IS NOT NULL) THEN
            IF length(p_user_password) < 6 OR instr(p_user_password,';') > 0 THEN
                  raise invalid_password;
            ELSE
              UPDATE users_profile SET user_password = p_user_password WHERE user_id=p_user_id;
            END IF;
          END IF;
      END IF;
      EXCEPTION
         WHEN invalid_user_id THEN
            raise_application_error(-20108,'Invalid user_id! Try again!');
         WHEN invalid_name THEN
            raise_application_error(-20109,'Invalid characters in name! It should contain only letters and -.');
        WHEN invalid_surname THEN
            raise_application_error(-20110,'Invalid characters in surname! It should contain only letters and -.');
        WHEN invalid_username THEN
            raise_application_error(-20111, 'Invalid username! It should not contain ; and it shoult be between 4-30 characters.');
        WHEN invalid_email THEN
            raise_application_error(-20112,'Invalid email!');
        WHEN invalid_password THEN
            raise_application_error(-20113,'Invalid password! It should not contain ; and it shoult not be shorter then 6 characters.');
      END;
END user_pack;

/
declare
  v_name users_profile.name%TYPE;
  v_surname users_profile.surname%TYPE;
  v_username users_profile.username%TYPE;
  v_email users_profile.email%TYPE;
  v_points users_status.points%TYPE;
  v_level users_status.level_id%TYPE;
begin
  user_pack.show_user_info('2345', v_name, v_surname, v_username, v_email, v_points, v_level);
end;


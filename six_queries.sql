-- 6 Queries --

--1.) Select all of the availble GROUP_TABLE
SELECT * FROM GROUP_TABLE

-- 2.) Select all of the users who's emails are within the @mail.fresnostate.edu domain
SELECT * FROM USERS WHERE Email LIKE '%@mail.fresnostate.edu' ORDER BY Email;

--3.) Select all of the passwords that cotain 123 and created before 2022-10-05
SELECT * FROM USER_PASSWORD where UserPassword LIKE '%123%' and Date_Created < 20221005

--4.) Using the count function, count how many permissions the administrator group has.
SELECT COUNT(*) AS NumberOfAdmins FROM USERS WHERE GroupID = 'G1' GROUP BY GroupID;

--5.) Select users first name, last name, email, password, and date when the password was created
SELECT USERS.F_name, USERS.L_name, USER_PASSWORD.UserPassword, USER_PASSWORD.Date_Created
FROM USERS, USER_PASSWORD
WHERE USERS.UserPassID = USER_PASSWORD.UserPassID;

--6.) Select users first name, last name, group, permissions and who granted permissions
SELECT USERS.F_name, USERS.L_name, GROUP_TABLE.Group_Name, PERMISSION.permission, GROUP_PERMISSIONS.WhoGrantedPermission
FROM USERS, GROUP_TABLE, GROUP_PERMISSIONS, PERMISSION
WHERE USERS.GroupID = GROUP_TABLE.GroupID AND GROUP_TABLE.GroupID = GROUP_PERMISSIONS.GroupID AND GROUP_PERMISSIONS.Perm_ID = PERMISSION.Perm_ID
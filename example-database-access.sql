-- Example webview users
CREATE USER IF NOT EXISTS 'webuser1'@'%' IDENTIFIED BY 'webuser1';
GRANT SELECT ON mydatabase.* TO 'webuser1'@'%';

CREATE USER IF NOT EXISTS 'webuser2'@'%' IDENTIFIED BY 'webuser2';
GRANT SELECT ON mydatabase.* TO 'webuser2'@'%';

-- Example contributor user
CREATE USER IF NOT EXISTS 'contributor'@'%' IDENTIFIED BY 'password';
GRANT INSERT, UPDATE, DELETE ON mydatabase.* TO 'contributor'@'%';

DROP DATABASE IF EXISTS Game;
CREATE DATABASE Game;
USE Game;

CREATE TABLE Player (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Password TEXT NOT NULL,
    Name TEXT NOT NULL,
    Points INTEGER DEFAULT 0
) ENGINE=InnoDB;

CREATE TABLE Games (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Date DATETIME DEFAULT NOW()
) ENGINE=InnoDB;

CREATE TABLE PlayerGames (
    Player INTEGER NOT NULL,
    Games INTEGER NOT NULL,
    PointsGame INTEGER DEFAULT 0,
    FOREIGN KEY (Player) REFERENCES Player(Id),
    FOREIGN KEY (Games) REFERENCES Games(Id)
) ENGINE=InnoDB;

INSERT INTO Player (Name, Password, Points) VALUES ('Marta', 'eetac1', 0);
INSERT INTO Player (Name, Password, Points) VALUES ('Niina', 'eetac2', 0);
INSERT INTO Player (Name, Password, Points) VALUES ('Nojus', 'eetac3', 0);

INSERT INTO Games (Date) VALUES (NOW());

INSERT INTO PlayerGames (Player, Games, PointsGame) VALUES (1, 1, 50);
INSERT INTO PlayerGames (Player, Games, PointsGame) VALUES (2, 1, 70);


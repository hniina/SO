CREATE DATABASE Championship;
USE Championship;


CREATE TABLE Player (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);


CREATE TABLE Game (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    City VARCHAR(50) NOT NULL
);

CREATE TABLE Participation (
    PlayerId INT,
    GameId INT,
    Position INT,
    FOREIGN KEY (PlayerId) REFERENCES Player(Id),
    FOREIGN KEY (GameId) REFERENCES Game(Id)
);


INSERT INTO Player (Name) VALUES ('Juan');
INSERT INTO Player (Name) VALUES ('Maria');
INSERT INTO Player (Name) VALUES ('Carlos');
INSERT INTO Player (Name) VALUES ('Ana');
INSERT INTO Player (Name) VALUES ('Luis');

INSERT INTO Game (City) VALUES ('Barcelona');
INSERT INTO Game (City) VALUES ('Madrid');
INSERT INTO Game (City) VALUES ('Valencia');


INSERT INTO Participation (PlayerId, GameId, Position) VALUES (1, 1, 1);  
INSERT INTO Participation (PlayerId, GameId, Position) VALUES (2, 1, 2);  
INSERT INTO Participation (PlayerId, GameId, Position) VALUES (1, 2, 1);
INSERT INTO Participation (PlayerId, GameId, Position) VALUES (3, 2, 2);  
INSERT INTO Participation (PlayerId, GameId, Position) VALUES (2, 3, 1);  
INSERT INTO Participation (PlayerId, GameId, Position) VALUES (4, 3, 2);  

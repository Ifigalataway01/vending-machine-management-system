CREATE TABLE Emballage (
    RefEm INT PRIMARY KEY AUTO_INCREMENT,
    TypeEm VARCHAR(64) NOT NULL,
    VolEm DECIMAL(5, 3) NOT NULL CHECK(VolEm > 0.0)
);

CREATE TABLE Boisson (
    RefB INT PRIMARY KEY AUTO_INCREMENT,
    NomB VARCHAR(128) NOT NULL,
    TypeB CHAR(2) NOT NULL CHECK(TypeB IN ("JU", "CI", "EA")),
    RefEm INT NOT NULL,
    ImgB VARCHAR(128),
    PrixB DECIMAL(7, 3) NOT NULL DEFAULT 0 CHECK(PrixB >= 0),
    FOREIGN KEY (RefEm) REFERENCES Emballage(RefEm)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE VendingMachine (
    RefVM INT PRIMARY KEY AUTO_INCREMENT,
    AdrVM VARCHAR(128) NOT NULL,
    NbrRangVM INT NOT NULL CHECK(NbrRangVM > 1),
    CapRangVM INT NOT NULL CHECK(CapRangVM > 1),
    DateMM DATE NOT NULL DEFAULT NOW(),
    HS BOOLEAN DEFAULT FALSE
);

CREATE TABLE BoissonMachine (
    RefVM INT NOT NULL,
    NumR INT NOT NULL,
    RefB INT NOT NULL,
    QteDispo INT NOT NULL DEFAULT 0 CHECK(QteDispo >= 0),
    PrixVente DECIMAL(7, 3) NOT NULL CHECK(PrixVente >= 0),
    PRIMARY KEY (RefVM, NumR),
    FOREIGN KEY (RefVM) REFERENCES VendingMachine(RefVM)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (RefB) REFERENCES Boisson(RefB)
        ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Emballage VALUES 
(1, 'Canette 24cl', 0.24),
(2, 'Canette 33cl', 0.33),
(3, 'Canette 25cl', 0.25),
(4, 'Carton 20cl', 0.20),
(5, 'Carton 25cl', 0.25),
(6, 'Bouteille 0.5l', 0.5),
(7, 'Bouteille 25cl', 0.25),
(8, 'Bouteille 30cl', 0.3);

INSERT INTO Boisson VALUES 
(1, 'Bnino Fraise et Banane', 'JU', 4, 'bnino-jus.jpg', 1.322),
(2, 'Boga Cidre boîte', 'CI', 1, 'boga-cidre.jpg', 1.170),
(3, 'Boga Light boîte', 'CI', 2, 'boga-light.jpg', 1.550),
(4, 'Boga Lime boîte', 'CI', 1, 'boga-lime.jpg', 1.170),
(5, 'Delio Fraise', 'EA', 7, 'delio-fraise.jpg', 0.930),
(6, 'Delio Poire', 'EA', 7, 'delio-poire.jpg', 0.930),
(7, 'Delio Pomme', 'EA', 7, 'delio-pomme.jpg', 0.930),
(8, 'Florida boîte', 'CI', 2, 'florida-boite.jpg', 1.730),
(9, 'Marwa Eau 0.5l', 'EA', 6, 'marwa-eau.jpg', 0.380),
(10, 'Oh! Jus', 'JU', 5, 'oh-jus.jpg', 1.190),
(11, 'Punch Cidre 25cl', 'CI', 7, 'punch-cidre.png', 1.420),
(12, 'Punch Orange 25cl', 'CI', 7, 'punch-orange.jpg', 1.420),
(13, 'Sabrine Pétillante Agrumes 33cl', 'EA', 2, 'sabrine-agrumes.jpg', 1.220),
(14, 'Sabrine Pétillante Pêche 33cl', 'EA', 2, 'sabrine-peche.webp', 1.220),
(15, 'Sabrine Pétillante Pomme 33cl', 'EA', 2, 'sabrine-pomme.jpg', 1.220),
(16, 'Jus Orange Stil', 'JU', 4, 'stil-jus-orange-p.jpg', 0.870),
(17, 'Jus Orange Stil Bouteille 25cl', 'JU', 7, 'stil-jus-orange.jpg', 1.320),
(18, 'Jus Cocktail Tropico 20cl', 'JU', 5, 'tropico-jus.jpg', 0.950),
(19, 'Viva pêche Bouteille 50cl', 'CI', 6, 'viva-peche.jpg', 1.320),
(20, 'Safia Bouteille 0.5l', 'EA', 6, 'safia-eau.jpg', 0.420),
(21, 'Cristalline Bouteille 0.5l', 'EA', 6, 'cristalline-eau.jpg', 0.385);

INSERT INTO VendingMachine VALUES 
(1, 'Lycée Pilote', 20, 10, '2025-01-01', False),
(2, 'Lycée Pilote', 20, 10, '2023-01-01', True),
(3, 'Université Sousse', 12, 10, '2025-01-03', False);

INSERT INTO BoissonMachine (RefVM, RefB, NumR, QteDispo, PrixVente) VALUES
(1, 14, 1, 5, 2.0), (1, 13, 2, 8, 2.0), (1, 18, 3, 6, 1.5), 
(1, 20, 4, 2, 1.0), (1, 11, 5, 2, 2.5), (1, 4, 6, 5, 2.0), 
(1, 21, 7, 2, 1.0), (1, 3, 8, 8, 2.5),  (1, 9, 9, 4, 1.0), 
(1, 5, 10, 7, 1.5), (1, 17, 11, 4, 2.0),(1, 15, 12, 5, 2.0), 
(1, 10, 13, 4, 2.0),(1, 7, 14, 3, 1.5), (1, 19, 15, 3, 2.0), 
(1, 8, 16, 6, 3.0), (1, 16, 17, 9, 1.5),(1, 1, 18, 2, 2.0), 
(1, 6, 19, 2, 1.5), (3, 4, 1, 2, 2.0),  (3, 14, 2, 2, 2.0), 
(3, 13, 3, 4, 2.0), (3, 15, 4, 7, 2.0), (3, 12, 5, 4, 2.5), 
(3, 6, 6, 8, 1.5),  (3, 16, 7, 9, 1.5), (3, 11, 8, 2, 2.5), 
(3, 8, 9, 5, 3.0),  (3, 1, 10, 8, 2.0);
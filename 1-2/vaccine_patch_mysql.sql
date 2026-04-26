USE pet_db;

CREATE TABLE Vaccine_Type(
    Vaccine_Type_ID INTEGER NOT NULL,
    Name VARCHAR(30) NOT NULL,
    CONSTRAINT Vaccine_Type_PK PRIMARY KEY (Vaccine_Type_ID)
);

CREATE TABLE Vaccine(
    Vaccine_ID INTEGER NOT NULL,
    Pet_ID INTEGER NOT NULL,
    Vaccine_Type_ID INTEGER NOT NULL,
    Vaccination_Date DATE NOT NULL,
    Document_Scan VARCHAR(255),
    CONSTRAINT Vaccine_PK PRIMARY KEY (Vaccine_ID),
    CONSTRAINT FK_Vaccine_Pet FOREIGN KEY (Pet_ID)
        REFERENCES Pet(Pet_ID),
    CONSTRAINT FK_Vaccine_Type FOREIGN KEY (Vaccine_Type_ID)
        REFERENCES Vaccine_Type(Vaccine_Type_ID)
);

INSERT INTO Vaccine_Type(Vaccine_Type_ID, Name) VALUES (1, 'Rabies');
INSERT INTO Vaccine_Type(Vaccine_Type_ID, Name) VALUES (2, 'Distemper');

INSERT INTO Vaccine(Vaccine_ID, Pet_ID, Vaccine_Type_ID, Vaccination_Date, Document_Scan)
VALUES (1, 1, 1, '2025-03-10', 'bobik_rabies.pdf');

INSERT INTO Vaccine(Vaccine_ID, Pet_ID, Vaccine_Type_ID, Vaccination_Date, Document_Scan)
VALUES (2, 2, 1, '2025-04-12', 'musia_rabies.pdf');

INSERT INTO Vaccine(Vaccine_ID, Pet_ID, Vaccine_Type_ID, Vaccination_Date, Document_Scan)
VALUES (3, 4, 2, '2025-05-01', 'apelsin_distemper.pdf');

INSERT INTO Vaccine(Vaccine_ID, Pet_ID, Vaccine_Type_ID, Vaccination_Date, Document_Scan)
VALUES (4, 6, 1, '2025-06-15', 'daniel_rabies.pdf');

/*
-- Удалять в таком порядке: сначала дочернюю таблицу, потом справочник.
DROP TABLE Vaccine;
DROP TABLE Vaccine_Type;
*/

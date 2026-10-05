USE DikeyTarimDB;
GO

CREATE TABLE HedefParametreler (
    ParametreID INT IDENTITY(1,1) PRIMARY KEY,
    EvreID INT NOT NULL,
    MinPH DECIMAL(3,1), MaxPH DECIMAL(3,1),
    MinEC DECIMAL(3,1), MaxEC DECIMAL(3,1),
    MinNem INT, MaxNem INT,
    MinSicaklik INT, MaxSicaklik INT,
    Risk NVARCHAR(200),
    Mudahale NVARCHAR(300),
    CONSTRAINT FK_HedefParametreler_Evre FOREIGN KEY (EvreID) REFERENCES GelisimEvreleri(EvreID)
);
GO

INSERT INTO HedefParametreler (EvreID, MinPH, MaxPH, MinEC, MaxEC, MinNem, MaxNem, MinSicaklik, MaxSicaklik, Risk, Mudahale) VALUES
(1,5.5,5.8,0.5,0.8,80,90,22,24,'Dusuk cimlenme orani','Nem ve sicaklik kontrol edilmeli'),
(2,5.8,6.0,1.0,1.2,70,75,21,23,'Fide gelisimi yavaslayabilir','Besin cozeltileri kontrol edilmeli');
GO

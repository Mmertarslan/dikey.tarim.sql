USE DikeyTarimDB;
GO

CREATE TABLE SensorVerileri (
    SensorVeriID INT IDENTITY(1,1) PRIMARY KEY,
    PartiID INT NOT NULL,
    TarihSaat DATETIME NOT NULL,
    PH DECIMAL(3,1),
    EC DECIMAL(3,1),
    Nem INT,
    Sicaklik INT,
    SuSicakligi INT,
    SuSertligi DECIMAL(5,2),
    Isik INT,
    CO2 INT,
    CONSTRAINT FK_SensorVerileri_MarulParti FOREIGN KEY (PartiID) REFERENCES MarulParti(PartiID)
);
GO

INSERT INTO SensorVerileri (PartiID,TarihSaat,PH,EC,Nem,Sicaklik,SuSicakligi,SuSertligi,Isik,CO2) VALUES
(1,'2026-06-02 08:00',5.6,0.6,85,23,20,120.50,150,450),
(1,'2026-06-02 12:00',5.7,0.7,83,23,20,121.00,160,460),
(2,'2026-06-05 08:00',5.9,1.1,72,22,20,118.75,200,500),
(3,'2026-06-10 08:00',5.8,1.6,64,22,20,119.30,300,550);
GO

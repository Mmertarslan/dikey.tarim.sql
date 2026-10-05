USE DikeyTarimDB;
GO

CREATE TABLE GelisimEvreleri (
    EvreID INT IDENTITY(1,1) PRIMARY KEY,
    EvreAdi NVARCHAR(50) NOT NULL,
    BaslangicGun INT NOT NULL,
    BitisGun INT NOT NULL
);
GO

INSERT INTO GelisimEvreleri (EvreAdi, BaslangicGun, BitisGun) VALUES
('Cimlenme',1,3),
('Fide Baslangic',4,10),
('Fide Gelisim',11,15),
('NFT Adaptasyon',16,25),
('Hizli Buyume',26,35),
('Hasat Oncesi',36,40);
GO

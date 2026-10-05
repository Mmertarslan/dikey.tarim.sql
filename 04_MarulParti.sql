USE DikeyTarimDB;
GO

CREATE TABLE MarulParti (
    PartiID INT IDENTITY(1,1) PRIMARY KEY,
    HatID INT NOT NULL,
    PartiAdi NVARCHAR(50) NOT NULL,
    EkimTarihi DATE NOT NULL,
    Cesit NVARCHAR(50),
    Durum NVARCHAR(30) NOT NULL,
    CONSTRAINT FK_MarulParti_UretimHatti FOREIGN KEY (HatID) REFERENCES UretimHatti(HatID)
);
GO

INSERT INTO MarulParti (HatID, PartiAdi, EkimTarihi, Cesit, Durum) VALUES
(1,'Parti-001','2026-06-01','Kivircik Marul','Aktif'),
(2,'Parti-002','2026-06-03','Yedikule Marul','Aktif'),
(3,'Parti-003','2026-05-25','Kivircik Marul','Aktif');
GO

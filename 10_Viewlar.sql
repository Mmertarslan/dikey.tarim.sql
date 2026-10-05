USE DikeyTarimDB;
GO

CREATE VIEW vw_AktifMarulPartileri AS
SELECT mp.PartiID, mp.PartiAdi, uh.HatAdi, mp.EkimTarihi,
DATEDIFF(DAY, mp.EkimTarihi, GETDATE()) + 1 AS KacinciGun,
mp.Cesit, mp.Durum
FROM MarulParti mp
INNER JOIN UretimHatti uh ON mp.HatID = uh.HatID
WHERE mp.Durum = 'Aktif';
GO

CREATE VIEW vw_SonSensorDegerleri AS
SELECT sv.SensorVeriID, mp.PartiAdi, sv.TarihSaat, sv.PH, sv.EC, sv.Nem, sv.Sicaklik,
sv.SuSicakligi, sv.SuSertligi, sv.Isik, sv.CO2
FROM SensorVerileri sv
INNER JOIN MarulParti mp ON sv.PartiID = mp.PartiID
WHERE sv.TarihSaat = (SELECT MAX(sv2.TarihSaat) FROM SensorVerileri sv2 WHERE sv2.PartiID = sv.PartiID);
GO

CREATE VIEW vw_OperatorGozlemListesi AS
SELECT og.GozlemID, mp.PartiAdi, k.AdSoyad AS OperatorAdi, og.GozlemTarihi, og.SorunTipi, og.Aciklama
FROM OperatorGozlemleri og
INNER JOIN MarulParti mp ON og.PartiID = mp.PartiID
INNER JOIN Kullanici k ON og.KullaniciID = k.KullaniciID;
GO

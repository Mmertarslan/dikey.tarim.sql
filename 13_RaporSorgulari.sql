USE DikeyTarimDB;
GO

SELECT COUNT(*) AS AktifPartiSayisi FROM MarulParti WHERE Durum = 'Aktif';

SELECT uh.HatAdi, COUNT(mp.PartiID) AS PartiSayisi
FROM UretimHatti uh
LEFT JOIN MarulParti mp ON uh.HatID = mp.HatID
GROUP BY uh.HatAdi;

SELECT mp.PartiAdi, AVG(sv.PH) AS OrtalamaPH, AVG(sv.EC) AS OrtalamaEC,
AVG(sv.Nem) AS OrtalamaNem, AVG(sv.Sicaklik) AS OrtalamaSicaklik
FROM SensorVerileri sv
INNER JOIN MarulParti mp ON sv.PartiID = mp.PartiID
GROUP BY mp.PartiAdi;

SELECT mp.PartiAdi, COUNT(uk.UyariID) AS UyariSayisi
FROM UyariKayitlari uk
INNER JOIN MarulParti mp ON uk.PartiID = mp.PartiID
GROUP BY mp.PartiAdi
ORDER BY UyariSayisi DESC;

SELECT mp.PartiAdi, k.AdSoyad AS OperatorAdi, og.SorunTipi, og.Aciklama, og.GozlemTarihi
FROM OperatorGozlemleri og
INNER JOIN MarulParti mp ON og.PartiID = mp.PartiID
INNER JOIN Kullanici k ON og.KullaniciID = k.KullaniciID
ORDER BY og.GozlemTarihi DESC;

SELECT PartiAdi, EkimTarihi, DATEDIFF(DAY,EkimTarihi,GETDATE()) + 1 AS KacinciGun, Durum
FROM MarulParti
WHERE DATEDIFF(DAY,EkimTarihi,GETDATE()) + 1 >= 36 AND Durum = 'Aktif';
GO

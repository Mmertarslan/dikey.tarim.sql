USE DikeyTarimDB;
GO

CREATE PROCEDURE sp_SensorVerisiEkle
    @PartiID INT, @PH DECIMAL(3,1), @EC DECIMAL(3,1), @Nem INT,
    @Sicaklik INT, @SuSicakligi INT, @SuSertligi DECIMAL(5,2), @Isik INT, @CO2 INT
AS
BEGIN
    INSERT INTO SensorVerileri (PartiID,TarihSaat,PH,EC,Nem,Sicaklik,SuSicakligi,SuSertligi,Isik,CO2)
    VALUES (@PartiID,GETDATE(),@PH,@EC,@Nem,@Sicaklik,@SuSicakligi,@SuSertligi,@Isik,@CO2);
END;
GO

CREATE PROCEDURE sp_OperatorGozlemEkle
    @PartiID INT, @KullaniciID INT, @SorunTipi NVARCHAR(100), @Aciklama NVARCHAR(500)
AS
BEGIN
    INSERT INTO OperatorGozlemleri (PartiID,KullaniciID,GozlemTarihi,SorunTipi,Aciklama)
    VALUES (@PartiID,@KullaniciID,GETDATE(),@SorunTipi,@Aciklama);
END;
GO

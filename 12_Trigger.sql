USE DikeyTarimDB;
GO

CREATE TRIGGER trg_PH_Uyari
ON SensorVerileri
AFTER INSERT
AS
BEGIN
    INSERT INTO UyariKayitlari (PartiID,SensorVeriID,UyariTarihi,UyariTipi,Aciklama)
    SELECT i.PartiID, i.SensorVeriID, GETDATE(), 'pH Uyarisi',
    'pH degeri marul uretimi icin uygun araligin disindadir.'
    FROM inserted i
    WHERE i.PH < 5.5 OR i.PH > 6.2;
END;
GO

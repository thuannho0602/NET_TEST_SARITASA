BEGIN TRANSACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230521112352_adddatabaseFileNew', N'6.0.0');
GO

COMMIT;
GO


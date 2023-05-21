BEGIN TRANSACTION;
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[File]') AND [c].[name] = N'UpdateDate');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [File] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [File] ALTER COLUMN [UpdateDate] datetime2 NOT NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230521111138_20230520142444_addDatabaseNewfile', N'6.0.0');
GO

COMMIT;
GO


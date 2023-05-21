BEGIN TRANSACTION;
GO

ALTER TABLE [User_Claim] DROP CONSTRAINT [FK_User_Claim_AspNetUsers_UserId];
GO

ALTER TABLE [User_Login] DROP CONSTRAINT [FK_User_Login_AspNetUsers_UserId];
GO

ALTER TABLE [User_Role] DROP CONSTRAINT [FK_User_Role_AspNetUsers_UserId];
GO

ALTER TABLE [User_Token] DROP CONSTRAINT [FK_User_Token_AspNetUsers_UserId];
GO

DROP TABLE [AspNetUsers];
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'UserName');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [User] ALTER COLUMN [UserName] nvarchar(256) NULL;
GO

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'PhoneNumber');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [User] ALTER COLUMN [PhoneNumber] nvarchar(max) NOT NULL;
ALTER TABLE [User] ADD DEFAULT N'' FOR [PhoneNumber];
GO

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'NormalizedUserName');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [User] ALTER COLUMN [NormalizedUserName] nvarchar(256) NULL;
GO

DECLARE @var3 sysname;
SELECT @var3 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'NormalizedEmail');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var3 + '];');
ALTER TABLE [User] ALTER COLUMN [NormalizedEmail] nvarchar(256) NULL;
GO

DECLARE @var4 sysname;
SELECT @var4 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'Email');
IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var4 + '];');
ALTER TABLE [User] ALTER COLUMN [Email] nvarchar(256) NULL;
GO

DECLARE @var5 sysname;
SELECT @var5 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'Id');
IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var5 + '];');
ALTER TABLE [User] ALTER COLUMN [Id] uniqueidentifier NOT NULL;
GO

ALTER TABLE [User] ADD [Address] nvarchar(max) NOT NULL DEFAULT N'';
GO

ALTER TABLE [User] ADD [DateOfBirth] nvarchar(max) NOT NULL DEFAULT N'';
GO

ALTER TABLE [User] ADD [FirstName] nvarchar(max) NOT NULL DEFAULT N'';
GO

ALTER TABLE [User] ADD [LastName] nvarchar(max) NOT NULL DEFAULT N'';
GO

CREATE INDEX [EmailIndex] ON [User] ([NormalizedEmail]);
GO

CREATE UNIQUE INDEX [UserNameIndex] ON [User] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
GO

ALTER TABLE [User_Claim] ADD CONSTRAINT [FK_User_Claim_User_UserId] FOREIGN KEY ([UserId]) REFERENCES [User] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [User_Login] ADD CONSTRAINT [FK_User_Login_User_UserId] FOREIGN KEY ([UserId]) REFERENCES [User] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [User_Role] ADD CONSTRAINT [FK_User_Role_User_UserId] FOREIGN KEY ([UserId]) REFERENCES [User] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [User_Token] ADD CONSTRAINT [FK_User_Token_User_UserId] FOREIGN KEY ([UserId]) REFERENCES [User] ([Id]) ON DELETE CASCADE;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230520141551_data', N'6.0.0');
GO

COMMIT;
GO


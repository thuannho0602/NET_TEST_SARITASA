BEGIN TRANSACTION;
GO

DROP TABLE [AspNetRoleClaims];
GO

DROP TABLE [AspNetUserClaims];
GO

DROP TABLE [AspNetUserLogins];
GO

DROP TABLE [AspNetUserRoles];
GO

DROP TABLE [AspNetUserTokens];
GO

DROP TABLE [AspNetRoles];
GO

DROP INDEX [EmailIndex] ON [User];
GO

DROP INDEX [UserNameIndex] ON [User];
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'Address');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [User] DROP COLUMN [Address];
GO

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'DateOfBirth');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [User] DROP COLUMN [DateOfBirth];
GO

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'Discriminator');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [User] DROP COLUMN [Discriminator];
GO

DECLARE @var3 sysname;
SELECT @var3 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'FirstName');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var3 + '];');
ALTER TABLE [User] DROP COLUMN [FirstName];
GO

DECLARE @var4 sysname;
SELECT @var4 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'LastName');
IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var4 + '];');
ALTER TABLE [User] DROP COLUMN [LastName];
GO

DECLARE @var5 sysname;
SELECT @var5 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'UserName');
IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var5 + '];');
ALTER TABLE [User] ALTER COLUMN [UserName] nvarchar(max) NULL;
GO

DECLARE @var6 sysname;
SELECT @var6 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'NormalizedUserName');
IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var6 + '];');
ALTER TABLE [User] ALTER COLUMN [NormalizedUserName] nvarchar(max) NULL;
GO

DECLARE @var7 sysname;
SELECT @var7 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'NormalizedEmail');
IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var7 + '];');
ALTER TABLE [User] ALTER COLUMN [NormalizedEmail] nvarchar(max) NULL;
GO

DECLARE @var8 sysname;
SELECT @var8 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'Email');
IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var8 + '];');
ALTER TABLE [User] ALTER COLUMN [Email] nvarchar(max) NULL;
GO

CREATE TABLE [AspNetUsers] (
    [Id] uniqueidentifier NOT NULL,
    [FirstName] nvarchar(max) NOT NULL,
    [LastName] nvarchar(max) NOT NULL,
    [DateOfBirth] nvarchar(max) NOT NULL,
    [Address] nvarchar(max) NOT NULL,
    [PhoneNumber] nvarchar(max) NOT NULL,
    [UserName] nvarchar(256) NULL,
    [NormalizedUserName] nvarchar(256) NULL,
    [Email] nvarchar(256) NULL,
    [NormalizedEmail] nvarchar(256) NULL,
    [EmailConfirmed] bit NOT NULL,
    [PasswordHash] nvarchar(max) NULL,
    [SecurityStamp] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [PhoneNumberConfirmed] bit NOT NULL,
    [TwoFactorEnabled] bit NOT NULL,
    [LockoutEnd] datetimeoffset NULL,
    [LockoutEnabled] bit NOT NULL,
    [AccessFailedCount] int NOT NULL,
    CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Role] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(256) NULL,
    [NormalizedName] nvarchar(256) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [User_Claim] (
    [Id] int NOT NULL IDENTITY,
    [UserId] uniqueidentifier NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_User_Claim] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_User_Claim_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [User_Login] (
    [UserId] uniqueidentifier NOT NULL,
    [LoginProvider] nvarchar(max) NULL,
    [ProviderKey] nvarchar(max) NULL,
    [ProviderDisplayName] nvarchar(max) NULL,
    CONSTRAINT [PK_User_Login] PRIMARY KEY ([UserId]),
    CONSTRAINT [FK_User_Login_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [User_Token] (
    [UserId] uniqueidentifier NOT NULL,
    [LoginProvider] nvarchar(450) NOT NULL,
    [Name] nvarchar(450) NOT NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_User_Token] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_User_Token_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Role_Claim] (
    [Id] int NOT NULL IDENTITY,
    [RoleId] uniqueidentifier NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_Role_Claim] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Role_Claim_Role_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Role] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [User_Role] (
    [UserId] uniqueidentifier NOT NULL,
    [RoleId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_User_Role] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_User_Role_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_User_Role_Role_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Role] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
GO

CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
GO

CREATE UNIQUE INDEX [RoleNameIndex] ON [Role] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
GO

CREATE INDEX [IX_Role_Claim_RoleId] ON [Role_Claim] ([RoleId]);
GO

CREATE INDEX [IX_User_Claim_UserId] ON [User_Claim] ([UserId]);
GO

CREATE INDEX [IX_User_Role_RoleId] ON [User_Role] ([RoleId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230520140848_databases', N'6.0.0');
GO

COMMIT;
GO

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

DECLARE @var9 sysname;
SELECT @var9 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'UserName');
IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var9 + '];');
ALTER TABLE [User] ALTER COLUMN [UserName] nvarchar(256) NULL;
GO

DECLARE @var10 sysname;
SELECT @var10 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'PhoneNumber');
IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var10 + '];');
ALTER TABLE [User] ALTER COLUMN [PhoneNumber] nvarchar(max) NOT NULL;
ALTER TABLE [User] ADD DEFAULT N'' FOR [PhoneNumber];
GO

DECLARE @var11 sysname;
SELECT @var11 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'NormalizedUserName');
IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var11 + '];');
ALTER TABLE [User] ALTER COLUMN [NormalizedUserName] nvarchar(256) NULL;
GO

DECLARE @var12 sysname;
SELECT @var12 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'NormalizedEmail');
IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var12 + '];');
ALTER TABLE [User] ALTER COLUMN [NormalizedEmail] nvarchar(256) NULL;
GO

DECLARE @var13 sysname;
SELECT @var13 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'Email');
IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var13 + '];');
ALTER TABLE [User] ALTER COLUMN [Email] nvarchar(256) NULL;
GO

DECLARE @var14 sysname;
SELECT @var14 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'Id');
IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var14 + '];');
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


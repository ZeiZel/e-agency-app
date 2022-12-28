BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[UserModel] (
    [id] INT NOT NULL IDENTITY(1,1),
    [email] NVARCHAR(1000) NOT NULL,
    [password] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    [isAdmin] BIT,
    [isUser] BIT,
    [isEmployee] BIT,
    CONSTRAINT [UserModel_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Client] (
    [id] INT NOT NULL IDENTITY(1,1),
    [userId] INT NOT NULL,
    [organizationId] INT,
    CONSTRAINT [Client_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Client_userId_key] UNIQUE NONCLUSTERED ([userId]),
    CONSTRAINT [Client_organizationId_key] UNIQUE NONCLUSTERED ([organizationId])
);

-- CreateTable
CREATE TABLE [dbo].[AgencyEmployee] (
    [id] INT NOT NULL IDENTITY(1,1),
    [userId] INT NOT NULL,
    CONSTRAINT [AgencyEmployee_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [AgencyEmployee_userId_key] UNIQUE NONCLUSTERED ([userId])
);

-- CreateTable
CREATE TABLE [dbo].[Contract] (
    [id] INT NOT NULL IDENTITY(1,1),
    [conditions] NVARCHAR(1000) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [Contract_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT [Contract_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Organization] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(1000) NOT NULL,
    [email] NVARCHAR(1000) NOT NULL,
    [phoneNumber] INT NOT NULL,
    [adressId] INT NOT NULL,
    CONSTRAINT [Organization_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Organization_adressId_key] UNIQUE NONCLUSTERED ([adressId])
);

-- CreateTable
CREATE TABLE [dbo].[Vacancy] (
    [id] INT NOT NULL IDENTITY(1,1),
    [organizationId] INT NOT NULL,
    CONSTRAINT [Vacancy_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Adress] (
    [id] INT NOT NULL IDENTITY(1,1),
    [country] NVARCHAR(1000),
    [region] NVARCHAR(1000),
    [city] NVARCHAR(1000) NOT NULL,
    [street] NVARCHAR(1000) NOT NULL,
    [building] NVARCHAR(1000) NOT NULL,
    [apartment] NVARCHAR(1000),
    CONSTRAINT [Adress_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Documents] (
    [id] INT NOT NULL IDENTITY(1,1),
    [education] NVARCHAR(1000) NOT NULL,
    [TIN] INT NOT NULL,
    [passportId] INT NOT NULL,
    CONSTRAINT [Documents_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Documents_passportId_key] UNIQUE NONCLUSTERED ([passportId])
);

-- CreateTable
CREATE TABLE [dbo].[Passport] (
    [id] INT NOT NULL IDENTITY(1,1),
    [number] INT NOT NULL,
    [series] INT NOT NULL,
    [surname] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    [patronymic] NVARCHAR(1000) NOT NULL,
    [sex] NVARCHAR(1000) NOT NULL,
    [birth] DATETIME2 NOT NULL,
    [registerId] INT NOT NULL,
    CONSTRAINT [Passport_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Passport_number_key] UNIQUE NONCLUSTERED ([number]),
    CONSTRAINT [Passport_series_key] UNIQUE NONCLUSTERED ([series]),
    CONSTRAINT [Passport_registerId_key] UNIQUE NONCLUSTERED ([registerId])
);

-- AddForeignKey
ALTER TABLE [dbo].[Client] ADD CONSTRAINT [Client_userId_fkey] FOREIGN KEY ([userId]) REFERENCES [dbo].[UserModel]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Client] ADD CONSTRAINT [Client_organizationId_fkey] FOREIGN KEY ([organizationId]) REFERENCES [dbo].[Organization]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[AgencyEmployee] ADD CONSTRAINT [AgencyEmployee_userId_fkey] FOREIGN KEY ([userId]) REFERENCES [dbo].[UserModel]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Organization] ADD CONSTRAINT [Organization_adressId_fkey] FOREIGN KEY ([adressId]) REFERENCES [dbo].[Adress]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Vacancy] ADD CONSTRAINT [Vacancy_organizationId_fkey] FOREIGN KEY ([organizationId]) REFERENCES [dbo].[Organization]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Documents] ADD CONSTRAINT [Documents_passportId_fkey] FOREIGN KEY ([passportId]) REFERENCES [dbo].[Passport]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Passport] ADD CONSTRAINT [Passport_registerId_fkey] FOREIGN KEY ([registerId]) REFERENCES [dbo].[Adress]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH

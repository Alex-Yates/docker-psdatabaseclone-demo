CREATE TABLE [dbo].[VoteTypes] (
    [Id]   INT          IDENTITY (1, 1) NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_VoteType__Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


CREATE TABLE [dbo].[DMSSTAT_TSTATS] (
    [runid]         VARCHAR (250) NOT NULL,
    [ruleid]        VARCHAR (50)  NOT NULL,
    [statscreated]  DATETIME      NOT NULL,
    [statsupdated]  DATETIME      NOT NULL,
    [ruletype]      VARCHAR (50)  NOT NULL,
    [ruleblock]     INT           NOT NULL,
    [rulenum]       INT           NOT NULL,
    [rulesubscript] INT           NOT NULL,
    [controllerid]  VARCHAR (50)  NULL,
    [tabledatabase] VARCHAR (250) NOT NULL,
    [tableschema]   VARCHAR (250) NOT NULL,
    [tablename]     VARCHAR (250) NOT NULL,
    [tablecolumn]   VARCHAR (250) NULL,
    [rowoperations] INT           NULL,
    [coloperations] INT           NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_DMSSTAT_TSTATS_A]
    ON [dbo].[DMSSTAT_TSTATS]([runid] ASC, [ruleid] ASC);


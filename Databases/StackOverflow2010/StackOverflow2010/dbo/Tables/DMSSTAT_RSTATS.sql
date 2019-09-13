CREATE TABLE [dbo].[DMSSTAT_RSTATS] (
    [runid]         VARCHAR (250) NOT NULL,
    [ruleid]        VARCHAR (50)  NOT NULL,
    [ruleblock]     INT           NOT NULL,
    [rulenum]       INT           NOT NULL,
    [rulesubscript] INT           NOT NULL,
    [ruletype]      VARCHAR (50)  NOT NULL,
    [rulecreated]   DATETIME      NOT NULL,
    [ruleupdated]   DATETIME      NOT NULL,
    [secondsactive] INT           NOT NULL,
    [rulestatus]    CHAR (1)      NOT NULL,
    [rulesource]    VARCHAR (250) NULL,
    [ruletarget]    VARCHAR (250) NULL,
    [rowoperations] INT           NULL,
    [coloperations] INT           NULL,
    [rulePrevRPN]   INT           NULL,
    [ruleRPN]       INT           NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_DMSSTAT_RSTATS]
    ON [dbo].[DMSSTAT_RSTATS]([runid] ASC, [ruleid] ASC);


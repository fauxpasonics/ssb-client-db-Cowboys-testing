CREATE TABLE [mdm].[tmp_MDM_Prep]
(
[dimcustomerid] [int] NOT NULL,
[STH] [int] NULL,
[CC] [int] NULL,
[SG] [int] NULL
)
GO
CREATE CLUSTERED INDEX [ix_MDM_Prep] ON [mdm].[tmp_MDM_Prep] ([dimcustomerid])
GO

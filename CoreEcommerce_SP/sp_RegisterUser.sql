USE [CoreEcommerce]
GO
/****** Object:  StoredProcedure [dbo].[sp_registerUser]    Script Date: 2021-04-14 4:56:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Thanh Ty Nguyen>
-- Create date:
-- Description:	Register User
-- =============================================
CREATE PROCEDURE [dbo].[sp_registerUser]
	-- Add the parameters for the stored procedure here
	@email Nvarchar(50),
	@password nvarchar(200),
	@role nvarchar(50),
	@returnValue int OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Accounts(
			Email,
			[Password],
			[Role], 
			Reg_Date) 
			VALUES(
			@email,
			CONVERT(VARCHAR(32), HashBytes('MD5', @password), 2),
			@role,
			GETDATE())
	if(@@ROWCOUNT > 0)
	BEGIN
		SET @returnValue= 200
	END
	ELSE
	BEGIN
		SET @returnValue = 500
	END
END


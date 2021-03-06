USE [CoreEcommerce]
GO
/****** Object:  StoredProcedure [dbo].[sp_loginUser]    Script Date: 2021-04-14 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Thanh Ty Nguyen>
-- Create date:
-- Description:	Login User
-- =============================================
CREATE PROCEDURE [dbo].[sp_loginUser]
	-- Add the parameters for the stored procedure here
	@email Nvarchar(50),
	@password nvarchar(200),
	@returnValue int OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		Id,
		Email,
		[Role],
		Reg_Date
		FROM Accounts
		WHERE Email = @email and
		[Password] = CONVERT(VARCHAR(32), HashBytes('MD5', @password), 2)
	IF(@@ROWCOUNT > 0)
	BEGIN
		SET @returnValue = 200
	END
	ELSE
	BEGIN
		SET @returnValue = 500
	END
END

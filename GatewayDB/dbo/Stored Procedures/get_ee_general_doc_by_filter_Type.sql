-- =============================================
-- Author:		Dilshad Shaik
-- Create date: 3/22/2018
-- Description:	This procedure filters general tax document data based on type whether it is expense,policy and benefits preferred partners etc
-- =============================================
CREATE PROCEDURE dbo.get_ee_general_doc_by_filter_Type 
	-- Add the parameters for the stored procedure here
	@tid varchar(50),
@filterby varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		if(@filterby=4)
		begin
		select dbo.ee_web_form.web_form_id
		 ,dbo.nei_web_form.description
		 ,dbo.nei_web_form.type,dbo.nei_web_form.upload from dbo.nei_web_form 
				INNER JOIN dbo.ee_web_form ON dbo.nei_web_form.web_form_id = dbo.ee_web_form.web_form_id 
				where tid=@tid AND (dbo.nei_web_form.type IN ( 'A', 'AG', 'T')) 
		end

		else if(@filterby=3)
		begin
		select dbo.ee_web_form.web_form_id
		 ,dbo.nei_web_form.description
		 ,dbo.nei_web_form.type,dbo.nei_web_form.upload from dbo.nei_web_form 
				INNER JOIN dbo.ee_web_form ON dbo.nei_web_form.web_form_id = dbo.ee_web_form.web_form_id 
				where tid=@tid AND (dbo.nei_web_form.type IN ( 'M')) 
		end

		else if(@filterby=2)
		begin
		select dbo.ee_web_form.web_form_id
		 ,dbo.nei_web_form.description
		 ,dbo.nei_web_form.type,dbo.nei_web_form.upload from dbo.nei_web_form 
				INNER JOIN dbo.ee_web_form ON dbo.nei_web_form.web_form_id = dbo.ee_web_form.web_form_id 
				where tid=@tid AND (dbo.nei_web_form.type IN ( 'E')) 
		end

		else if(@filterby=1)
		begin
		select dbo.ee_web_form.web_form_id
		 ,dbo.nei_web_form.description
		 ,dbo.nei_web_form.type,dbo.nei_web_form.upload from dbo.nei_web_form 
				INNER JOIN dbo.ee_web_form ON dbo.nei_web_form.web_form_id = dbo.ee_web_form.web_form_id 
				where tid=@tid AND (dbo.nei_web_form.type IN ( 'Z')) 
		end

		else 
		begin
		select dbo.ee_web_form.web_form_id
		 ,dbo.nei_web_form.description
		 ,dbo.nei_web_form.type,dbo.nei_web_form.upload from dbo.nei_web_form 
				INNER JOIN dbo.ee_web_form ON dbo.nei_web_form.web_form_id = dbo.ee_web_form.web_form_id 
				where tid=@tid AND (dbo.nei_web_form.type IN ( 'Z', 'E', 'M', 'A', 'AG', 'T')) 
		end
END








CREATE PROCEDURE [dbo].[create_ee_er_online]
		@tid varchar(10),
		@submit_date date = NULL,
		@tot_exp decimal(18, 2) = NULL,
		@tot_reim_exp decimal(18, 2) = NULL,
		@comments varchar(max) = NULL,
		@payment varchar(10) = NULL,
		@address1 varchar(75) = NULL,
		@address2 varchar(75) = NULL,
		@city varchar(50) = NULL,
		@state varchar(2) = NULL,
		@zip varchar(10) = NULL,
		@country varchar(50)=  NULL,
		@status bit = 1,
		@iagree varchar(50) = NULL
	 
AS
	SET @submit_date = ISNULL(@submit_date, GETDATE())

BEGIN

	--INSERT INTO ee_er_online(
	/*
	INSERT INTO syn_ee_er_online(
			--er_id_auto
			--er_id (computed)
			tid,
			DateSubmitted,  --submit_date
			Total_Exp,  --tot_exp
			Total_ReimExp,  --tot_reim_exp
			[status],
			comments,
			pymnt,  --payment
			address1,
			address2,
			city,
			state,
			zip,
			country,
			IsSubmitted,  --not in new table
			iagree,
			createDate,  
			lastupdated
			)
		VALUES (
			@tid,
			@submit_date,
			@tot_exp,
			@tot_reim_exp,		
			0,
			@comments,
			@payment,
			@address1,
			@address2,
			@city,
			@state,
			@zip,
			@country,
			@status,
			@iagree,
			getdate(),
			getdate());	
			*/

-- Altnernative Insert Query :  Please note I had to hardcode the 3 part name for the table. 
-- What we gain:  The insert is handled by ag_listener_test...
		Insert into openquery(AG_LISTENER_TEST,'Select tid,DateSubmitted,  Total_Exp,  Total_ReimExp,  [status],comments,pymnt,  address1,address2,city,state,zip,country,IsSubmitted,  iagree,createDate,  lastupdated from nei_website_dev.dbo.[erOnline_Rpt]')
		VALUES (@tid,@submit_date,@tot_exp,@tot_reim_exp,0,@comments,@payment,@address1,@address2,@city,@state,@zip,@country,@status,@iagree,getdate(),getdate());	
--

	SELECT MAX(er_id) as Id FROM syn_ee_er_online where tid = @tid

END	



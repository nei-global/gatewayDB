/*
2018-07-02  JET TFS 6398:   ee_er_item_online.IsSubmitted when the parent record is updated.
08/03/18  JET/MLA		:	changed to use openquery instead of the synonym, using current DB to choose destination
09/19/18  MLA			:   rolling back to the version before the change on 8/3,  removing open query which is no longer needed
10/19/18  mkb			:	changed syn_erOnline_Items with syn_ee_er_item_online, added transaction; added success return code
*/
CREATE PROCEDURE [dbo].[update_ee_er_online]
		@er_id_auto int,
		@er_id varchar(25) = NULL,
		@tid varchar(10) = NULL,
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
		@country varchar(50) = NULL,
		@status bit = NULL,
		@iagree varchar(50) = NULL
	 
AS
	SET @submit_date = ISNULL(@submit_date, GETDATE())

BEGIN

BEGIN TRY
	BEGIN TRANSACTION
		UPDATE syn_ee_er_online
			SET		tid = ISNULL(@tid,tid),
					DateSubmitted = ISNULL(@submit_date,DateSubmitted),  --submit_date
					Total_Exp = ISNULL(@tot_exp,Total_Exp),  --tot_exp
					Total_ReimExp = ISNULL(@tot_reim_exp,Total_ReimExp),  --tot_reim_exp
					comments = ISNULL(@comments,comments),
					pymnt = ISNULL(@payment,pymnt),  --payment
					address1 = ISNULL(@address1,address1),
					address2 = ISNULL(@address2,address2),
					city = ISNULL(@city,city),
					[state] = ISNULL(@state,[state]),
					zip = ISNULL(@zip,zip),
					country = ISNULL(@country,country),
					IsSubmitted = ISNULL(@status,IsSubmitted),  --not in new table
					iagree = ISNULL(@iagree,iagree),
					lastupdated = getdate()
			WHERE er_id = @er_id_auto

		UPDATE dbo.syn_ee_er_item_online
			SET IsSubmitted = @status,
				last_updated = GETDATE()
			WHERE er_id = @er_id_auto AND @status is not NULL
				AND IsSubmitted <> @status

	COMMIT TRANSACTION;
	SELECT 1 AS success
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION;
	SELECT 0 AS success
END CATCH

END



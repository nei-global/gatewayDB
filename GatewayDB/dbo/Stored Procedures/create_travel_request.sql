

/*
* 11/02/18 mkb: created
*/

CREATE PROCEDURE [dbo].[create_travel_request]
		@tid varchar(10),
		@email varchar(75),
		@out_phone varchar(25),
		@travel_phone varchar(25),
		@reason_code varchar(2),
		@out_from_date date,
		@out_from_iata varchar(50),
		@out_from_city varchar(50),
		@out_from_state varchar(50),
		@out_from_country varchar(50),
		@out_arrival_time time(7),
		@out_arrival_meridiem varchar(2),
		@out_to_date date,
		@out_to_iata varchar(50),
		@out_to_city varchar(50),
		@out_to_state varchar(50),
		@out_to_country varchar(50),
		@in_from_date date,
		@in_from_iata varchar(50),
		@in_from_city varchar(50),
		@in_from_state varchar(50),
		@in_from_country varchar(50),
		@in_arrival_time time(7),
		@in_arrival_meridiem varchar(2),
		@in_to_date date,
		@in_to_iata varchar(50),
		@in_to_city varchar(50),
		@in_to_state varchar(50),
		@in_to_country varchar(50),
		@car bit,
		@hotel bit,
		@comments varchar(max),
		@employee_name varchar(100),
		@spouse_name varchar(100),
		@family varchar(500) --- sent as a comma delimited list
	 
AS
BEGIN

SET NOCOUNT ON;

--parsing out @family for insert into travel_request_members
	DECLARE @members table (id int, item_value varchar(100))
	DECLARE @member_name varchar(100)
	DECLARE @count int
	DECLARE @current int = 1

	INSERT INTO @members(id, item_value)
		SELECT * FROM dbo.parse_list(@family, ',')
	
	SELECT @count = count(*) FROM @members

	DECLARE @trip_no int
	
	SET @trip_no = ISNULL((SELECT max(trip_no) FROM travel_request WHERE tid = @tid GROUP BY tid), 0) + 1

BEGIN TRY
	BEGIN TRANSACTION
		--initial insert into travel_request
		INSERT INTO travel_request(
			tid,
			trip_no,
			email,
			out_phone,
			travel_phone,
			reason_code,
			car,
			hotel,
			comments,
			create_date,
			update_date)
		VALUES (		
			@tid,
			@trip_no,
			@email,
			@out_phone,
			@travel_phone,
			@reason_code,
			@car,
			@hotel,
			@comments,
			getdate(),
			getdate()
			)

	DECLARE @travel_request_id int
	SET @travel_request_id = SCOPE_IDENTITY() --sets travel_request_id in companions tables
		--travel request info OUT
		INSERT INTO travel_request_info (
			travel_request_id,
			tid,
			trip_no,
			travel_type,
			from_date,
			from_iata,
			from_city,
			from_state,
			from_country,
			arrival_time,
			arrival_meridiem,
			to_date,
			to_iata,
			to_city,
			to_state,
			to_country
			)
		VALUES (
			@travel_request_id,
			@tid,
			@trip_no,
			'OUT',
			@out_from_date,
			@out_from_iata,
			@out_from_city,
			@out_from_state,
			@out_from_country,
			@out_arrival_time,
			@out_arrival_meridiem,
			@out_to_date,
			@out_to_iata,
			@out_to_city,
			@out_to_state,
			@out_to_country
			)
		--travel request info IN
		INSERT INTO travel_request_info (
			travel_request_id,
			tid,
			trip_no,
			travel_type,
			from_date,
			from_iata,
			from_city,
			from_state,
			from_country,
			arrival_time,
			arrival_meridiem,
			to_date,
			to_iata,
			to_city,
			to_state,
			to_country
			)
		VALUES (
			@travel_request_id,
			@tid,
			@trip_no,
			'IN',
			@in_from_date,
			@in_from_iata,
			@in_from_city,
			@in_from_state,
			@in_from_country,
			@in_arrival_time,
			@in_arrival_meridiem,
			@in_to_date,
			@in_to_iata,
			@in_to_city,
			@in_to_state,
			@in_to_country
			)

		IF @employee_name is not null
			--travel request member employee name
			INSERT INTO travel_request_member (
				travel_request_id,
				member_name,
				relationship_code
				)
			VALUES (
				@travel_request_id,
				@employee_name,
				'EE'
				)

		IF @spouse_name is not null
		--travel request member spouse name
		INSERT INTO travel_request_member (
			travel_request_id,
			member_name,
			relationship_code
			)
		VALUES (
			@travel_request_id,
			@spouse_name,
			'SP'
			)

		--travel request member family members name
		IF @family is not null
		WHILE (@current <= @count)
		BEGIN 
			SELECT @member_name = item_value 
				FROM @members 
				WHERE id = @current
		
			INSERT INTO travel_request_member (
				travel_request_id,
				member_name,
				relationship_code
				)
			VALUES (
				@travel_request_id,
				@member_name,
				'DP'
				)
			SET @current = @current + 1
		END

	COMMIT TRANSACTION


END TRY

BEGIN CATCH
	DECLARE @Message varchar(max) = ERROR_MESSAGE()

	RAISERROR(N'Error nr: %d. Message: %s', 1, 16, @@ERROR, @Message)

	ROLLBACK TRANSACTION
END CATCH

END 

SELECT id FROM travel_request WHERE tid = @tid and trip_no = @trip_no






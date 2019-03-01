
/*
* 11/02/18 mkb: created
*/
CREATE PROCEDURE [dbo].[update_travel_request]
		@id int,
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
		@family varchar(500)
	 
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

BEGIN TRY
	BEGIN TRANSACTION;
	
	--updated travel request
	UPDATE travel_request
	SET	
		email = @email,
		out_phone = @out_phone,
		travel_phone = @travel_phone,
		reason_code = @reason_code,
		car = @car,
		hotel = @hotel,
		comments = @comments,
		create_date = create_date,
		update_date = GETDATE()
	WHERE id = @id

	--update travel request info OUT
	UPDATE travel_request_info
	SET
		from_date = @out_from_date,
		from_iata = @out_from_iata,
		from_city = @out_from_city,
		from_state = @out_from_state,
		from_country = @out_from_country,
		arrival_time = @out_arrival_time,
		arrival_meridiem = @out_arrival_meridiem,
		to_date = @out_to_date,
		to_iata = @out_to_iata,
		to_city = @out_to_city,
		to_state = @out_to_state,
		to_country = @out_to_country
	WHERE travel_request_id = @id
		AND travel_type = 'OUT'

	--update travel request info IN
	UPDATE travel_request_info
	SET
		from_date = @in_from_date,
		from_iata = @in_from_iata,
		from_city = @in_from_city,
		from_state = @in_from_state,
		from_country = @in_from_country,
		arrival_time = @in_arrival_time,
		arrival_meridiem = @in_arrival_meridiem,
		to_date = @in_to_date,
		to_iata = @in_to_iata,
		to_city = @in_to_city,
		to_state = @in_to_state,
		to_country = @in_to_country
	WHERE travel_request_id = @id
		AND travel_type = 'IN'
	
	--update or insert travel member EE
	IF @employee_name is not null
		IF EXISTS (SELECT travel_request_id 
					FROM travel_request_member 
					WHERE travel_request_id = @id
						AND relationship_code = 'EE')
			UPDATE travel_request_member
			SET 
				member_name = @employee_name
			WHERE travel_request_id = @id
				AND relationship_code = 'EE'
		ELSE
			INSERT INTO travel_request_member (
				travel_request_id,
				member_name,
				relationship_code
				)
			VALUES (
				@id,
				@employee_name,
				'EE'
			)
	ELSE
		DELETE
		FROM travel_request_member
		WHERE travel_request_id = @id
			AND relationship_code = 'EE'
			

	--update or insert travel member SP
	IF @spouse_name is not null
		IF EXISTS (SELECT travel_request_id 
					FROM travel_request_member 
					WHERE travel_request_id = @id
						AND relationship_code = 'SP')
			UPDATE travel_request_member
			SET 
				member_name = @spouse_name
			WHERE travel_request_id = @id
				AND relationship_code = 'SP'
		ELSE
			INSERT INTO travel_request_member (
				travel_request_id,
				member_name,
				relationship_code
				)
			VALUES (
				@id,
				@spouse_name,
				'SP'
				)
	ELSE
		DELETE
		FROM travel_request_member
		WHERE travel_request_id = @id
			AND relationship_code = 'SP'


	--travel request member family members name
	DELETE
	FROM travel_request_member 
	WHERE travel_request_id = @id
		AND relationship_code = 'DP'
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
				@id,
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




